# bootstrap/oidc/main.tf

# ─── GitHub Actions OIDC Identity Provider ────────────────────────────────────
# Tells AWS to trust GitHub Actions as an identity provider
# Applied once manually — never destroyed
resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  # GitHub's OIDC thumbprints — public and safe to commit
  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1",
    "1c58a3a8518e8759bf075b76b750d4f2df264fcd"
  ]

  tags = {
    Name      = "${var.project_name}-github-oidc-provider"
    ManagedBy = "Terraform"
  }
}

# ─── IAM Role for GitHub Actions ──────────────────────────────────────────────
# GitHub Actions assumes this role when running pipelines
# No static keys — temporary token per pipeline run
resource "aws_iam_role" "github_actions" {
  name        = "${var.project_name}-github-actions-role"
  description = "Role assumed by GitHub Actions via OIDC - no static keys"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            # Only YOUR repo can assume this role
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_org}/${var.github_repo}:*"
          }
        }
      }
    ]
  })

  tags = {
    Name      = "${var.project_name}-github-actions-role"
    ManagedBy = "Terraform"
  }
}

# ─── IAM Policy for GitHub Actions ───────────────────────────────────────────
resource "aws_iam_policy" "github_actions" {
  name        = "${var.project_name}-github-actions-policy"
  description = "Permissions for GitHub Actions to deploy Quran app"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # ── ECS ──────────────────────────────────────────────────────────────
      {
        Sid    = "ECSAccess"
        Effect = "Allow"
        Action = [
          "ecs:DescribeClusters",
          "ecs:DescribeServices",
          "ecs:DescribeTaskDefinition",
          "ecs:DescribeTasks",
          "ecs:ListClusters",
          "ecs:ListServices",
          "ecs:ListTaskDefinitions",
          "ecs:ListTasks",
          "ecs:RegisterTaskDefinition",
          "ecs:UpdateService",
          "ecs:CreateCluster",
          "ecs:DeleteCluster",
          "ecs:CreateService",
          "ecs:DeleteService",
          "ecs:TagResource"
        ]
        Resource = "*"
      },
      # ── ECR ──────────────────────────────────────────────────────────────
      {
        Sid    = "ECRAccess"
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage",
          "ecr:DescribeRepositories",
          "ecr:CreateRepository",
          "ecr:DeleteRepository",
          "ecr:ListImages",
          "ecr:BatchDeleteImage",
          "ecr:PutLifecyclePolicy",
          "ecr:PutImageTagMutability",
          "ecr:TagResource",
          "ecr:ListTagsForResource",   # ← add this
        ]
        Resource = "*"
      },
      # ── S3 ───────────────────────────────────────────────────────────────
      {
        Sid    = "S3Access"
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:CreateBucket",
          "s3:DeleteBucket",
          "s3:GetBucketLocation",
          "s3:PutBucketPolicy",
          "s3:GetBucketPolicy",
          "s3:PutBucketVersioning",
          "s3:GetBucketVersioning",
          "s3:PutBucketEncryption",
          "s3:GetEncryptionConfiguration",
          "s3:PutBucketPublicAccessBlock",
          "s3:GetBucketPublicAccessBlock",
          "s3:PutBucketLogging",
          "s3:GetBucketLogging",
          "s3:PutLifecycleConfiguration",
          "s3:GetLifecycleConfiguration",
          "s3:GetBucketAcl",
        ]
        Resource = "*"
      },
      # ── CloudFront ────────────────────────────────────────────────────────
      {
        Sid      = "CloudFrontAccess"
        Effect   = "Allow"
        Action   = ["cloudfront:*"]
        Resource = "*"
      },
      # ── VPC and Networking ────────────────────────────────────────────────
      {
        Sid      = "VPCAccess"
        Effect   = "Allow"
        Action   = ["ec2:*"]
        Resource = "*"
      },
      # ── IAM ──────────────────────────────────────────────────────────────
      {
        Sid    = "IAMAccess"
        Effect = "Allow"
        Action = [
          "iam:CreateRole",
          "iam:DeleteRole",
          "iam:GetRole",
          "iam:PassRole",
          "iam:AttachRolePolicy",
          "iam:DetachRolePolicy",
          "iam:CreatePolicy",
          "iam:DeletePolicy",
          "iam:GetPolicy",
          "iam:GetPolicyVersion",
          "iam:ListPolicyVersions",
          "iam:ListAttachedRolePolicies",
          "iam:ListRolePolicies",
          "iam:PutRolePolicy",
          "iam:DeleteRolePolicy",
          "iam:GetRolePolicy",
          "iam:TagRole",
          "iam:UntagRole",
          "iam:TagPolicy",
          "iam:CreateOpenIDConnectProvider",
          "iam:DeleteOpenIDConnectProvider",
          "iam:GetOpenIDConnectProvider",
          "iam:UpdateOpenIDConnectProviderThumbprint",
          "iam:ListOpenIDConnectProviders"
        ]
        Resource = "*"
      },
      # ── CloudWatch & Logs ─────────────────────────────────────────────────
      {
        Sid      = "CloudWatchAccess"
        Effect   = "Allow"
        Action   = ["cloudwatch:*", "logs:*"]
        Resource = "*"
      },
      # ── ACM ──────────────────────────────────────────────────────────────
      {
        Sid      = "ACMAccess"
        Effect   = "Allow"
        Action   = ["acm:*"]
        Resource = "*"
      },
      # ── ALB ──────────────────────────────────────────────────────────────
      {
        Sid      = "ALBAccess"
        Effect   = "Allow"
        Action   = ["elasticloadbalancing:*"]
        Resource = "*"
      },
      # ── Terraform State Bucket ────────────────────────────────────────────
      {
        Sid    = "TerraformStateBucket"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.state_bucket}",
          "arn:aws:s3:::${var.state_bucket}/*"
        ]
      }
    ]
  })

  tags = {
    Name      = "${var.project_name}-github-actions-policy"
    ManagedBy = "Terraform"
  }
}

# ─── Attach Policy to Role ────────────────────────────────────────────────────
resource "aws_iam_role_policy_attachment" "github_actions" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.github_actions.arn
}
