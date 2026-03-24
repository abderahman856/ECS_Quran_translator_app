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

The project follows a structured and modular layout to ensure clarity, scalability, and maintainability across application and infrastructure components.

### Project Layout

```bash
quran-translator-app/
│
├── app/
│   ├── frontend/                # React application (UI layer)
│   └── backend/                # Node.js API (business logic)
│
├── docker/
│   ├── frontend.Dockerfile     # Frontend container configuration
│   └── backend.Dockerfile      # Backend container configuration
│
├── infrastructure/
│   ├── bootstrap/              # Initial setup (S3 backend, state management)
│   └── modules/                # Reusable Terraform modules
│       ├── vpc/
│       ├── security_groups/
│       ├── iam/
│       ├── ecr/
│       ├── ecs/
│       ├── alb/
│       ├── acm/
│       ├── cloudwatch/
│       ├── s3/
│       ├── cloudfront/
│       ├── gateway_endpoint/
│       ├── interface_endpoint/
│       └── ...
│
├── .github/
│   └── workflows/              # CI/CD pipelines (GitHub Actions)
│
├── docs/
│   └── images/                 # Screenshots, diagrams, demo assets
│
├── docker-compose.yml          # Local multi-container setup
├── README.md                   # Project documentation
└── .env.example                # Environment variables template
```

### Structure Explanation

* **app/**
  Contains the core application code, separated into frontend and backend for better scalability and independent development.

* **docker/**
  Holds Dockerfiles for building production-ready container images for each service.

* **infrastructure/**
  Manages all cloud resources using Terraform:

  * **bootstrap/** initializes remote state storage (S3, DynamoDB)
  * **modules/** contains reusable infrastructure components

* **.github/workflows/**
  Defines CI/CD pipelines for automating build, test, and deployment processes.

* **docs/**
  Stores documentation assets such as architecture diagrams and application screenshots.

* **docker-compose.yml**
  Enables local development by running frontend and backend containers together.

* **.env.example**
  Provides a template for required environment variables without exposing sensitive data.

