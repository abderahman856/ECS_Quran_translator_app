# Quran Application Translator, Cloud_Native Web Application

### Description

A cloud-native web application that allows users to search for Quran verses by Surah and Ayah number and instantly retrieve their translations using an external Quran API.

The application is fully containerized with Docker and deployed on AWS using Terraform, showcasing modern DevOps practices such as Infrastructure as Code, container orchestration with ECS Fargate, load balancing with ALB, and centralized logging with CloudWatch.

This project demonstrates how to design and deploy a scalable and production-ready cloud architecture for a full-stack application.

## Table of Contents

* [Live Demo](https://github.com/abderahman856/ECS_Quran_translator_app?tab=readme-ov-file#live-demo)
* [Architecture](#architecture)
* [Technology Stack](#technology-stack)
* [Repository Structure](#repository-structure)
* [Features](#features)
* [Deployment Process](#deployment-process)
* [Local Development](#local-development)
* [Future Improvements](#future-improvements)
* [Learning Outcomes](#learning-outcomes)
* [Author](#author)

## Live Demo

The application is deployed in a production-style cloud environment using AWS ECS Fargate, Application Load Balancer, and Terraform Infrastructure as Code.

🌐 Application URL:
https://baashe.uk

### How to Test

  Open the application using the link above.
  
  Enter a Surah number and Ayah number.
  
  The application fetches the verse translation from the Quran API and displays the result instantly.

## Architecture 
![Architecture Diagram](docs/Architecture_diagram.gif)

## Technology Stack

This project leverages a modern, cloud_native technology stack to ensure scalability, reliability, and maintainability.

### Frontend

* **React.js** ; Builds a dynamic and responsive user interface.
* **JavaScript (ES6+)** ; Core language for frontend logic and interactivity.

### Backend

* **Node.js** ; Runtime environment for executing server_side logic.
* **Express.js** ; Lightweight framework for building REST APIs.
* **Axios** ; Handles HTTP requests to the external Quran API.

### Containerization

* **Docker** ; Packages the application into portable containers.
* **Docker Compose** ; Manages multi-container setup for local development.

### Cloud & Infrastructure

* **AWS ECS (Fargate)** ; Runs containers without managing servers.
* **Amazon ECR** ; Stores Docker images securely.
* **Application Load Balancer (ALB)** ; Distributes traffic across services.
* **AWS CloudWatch** ; Logging and monitoring for application health.

### Infrastructure as Code (IaC)

* **Terraform** ; Provisions and manages cloud infrastructure using code.
* **Modular Terraform Design** ; Ensures reusable and maintainable infrastructure.

### CI/CD & Automation

* **GitHub Actions** ; Automates build, test, and deployment pipelines.
* **OIDC Authentication** ; Secure access to AWS without storing credentials.

### Networking & Security

* **VPC (Virtual Private Cloud)** ; Isolated network environment in AWS.
* **Security Groups** ; Control inbound and outbound traffic.
* **ACM (AWS Certificate Manager)** ; Manages SSL/TLS certificates for HTTPS.

### DNS & CDN

* **Cloudflare** ; Domain management, DNS routing, and CDN for improved performance and security.

### External Services

* **Quran API (alquran.cloud)** ; Provides Quran verse data and translations.

## Repository Structure

The project is organized using a modular and production-oriented structure, separating application code, infrastructure, CI/CD pipelines, and documentation for clarity and scalability.

### Project Layout

```bash
quran-translator-app/
│
├── .github/
│   └── workflows/                     # CI/CD pipelines (GitHub Actions)
│       ├── docker-build-push.yml      # Build & push Docker images to ECR
│       ├── frontend.yml               # Frontend-specific pipeline
│       ├── terraform-plan-pr.yml      # Terraform plan for pull requests
│       ├── terraform-apply.yml        # Apply infrastructure changes
│       ├── terraform-destroy-apply.yml# Destroy infrastructure
│       ├── terraform-destroy-plan.yml # Plan destroy actions
│       └── terraform-unlock-state.yml # Unlock Terraform state
│
├── Infra/                             # Main infrastructure (Terraform)
│   ├── acm/                           # SSL certificates (HTTPS)
│   ├── alb/                           # Load balancer configuration
│   ├── cloudflare/                    # DNS integration (Cloudflare)
│   ├── cloudfront/                    # CDN (optional)
│   ├── cloudwatch/                    # Logging & monitoring
│   ├── ecr/                           # Container registry
│   ├── ecs/                           # Container orchestration (Fargate)
│   ├── envs/                          # Environment-specific configs
│   ├── gateway_endpoint/              # VPC gateway endpoints
│   ├── s3/                            # Storage resources
│   ├── security_groups/               # Network security rules
│   ├── vpc/                           # Networking (VPC, subnets)
│   ├── main.tf                        # Root Terraform configuration
│   ├── variables.tf                   # Input variables
│   ├── outputs.tf                     # Output values
│   ├── backend.tf                     # Remote state configuration
│   └── README.md                      # Infra documentation
│
├── app/                               # Application source code
│   ├── frontend/                      # React frontend
│   └── backend/                       # Node.js backend API
│
├── bootstrap/                         # Initial infrastructure setup
│   ├── oidc/                          # OIDC setup for CI/CD authentication
│   ├── main.tf                        # Bootstrap resources (S3, IAM)
│   ├── provider.tf                    # Provider configuration
│   ├── variables.tf                   # Bootstrap variables
│   └── outputs.tf                     # Bootstrap outputs
│
├── docs/                              # Documentation & assets
│   ├── CI_CD_pipelines/               # Pipeline visualizations
│   │   ├── dev_environment/           # Dev pipeline screenshots
│   │   └── prod_environment/          # Prod pipeline screenshots
│   ├── Manual_Clickops/               # Manual setup steps (if any)
│   ├── containers/                   # Container-related docs
│   ├── developing_the_app_locally/   # Local setup guides
│   └── Architecture_diagram.gif      # System architecture diagram
│
├── docker-compose.yml                 # Local multi-container setup
├── package.json                       # Project dependencies (root)
├── package-lock.json                  # Dependency lock file
├── .dockerignore                      # Docker ignore rules
├── .gitignore                         # Git ignore rules
├── .pre-commit-config.yaml            # Code quality hooks
└── README.md                          # Project documentation
```

### Structure Explanation

* **.github/workflows/**
  Contains CI/CD pipelines for automating build, deployment, and infrastructure operations.

* **Infra/**
  Houses all Terraform infrastructure code, organized into modular components for scalability and reuse.

* **app/**
  Contains the core application:

  * **frontend/** → React UI
  * **backend/** → Node.js API

* **bootstrap/**
  Responsible for initial setup such as Terraform remote state (S3) and secure authentication (OIDC).

* **docs/**
  Includes architecture diagrams, pipeline screenshots, and supporting documentation.

* **docker-compose.yml**
  Enables local development by running frontend and backend containers together.

* **Root files**
  Manage dependencies, Git configuration, and project-level settings.


