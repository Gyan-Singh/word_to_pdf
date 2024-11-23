Live hosted(https://word-to-pdf-mnck.onrender.com/)

# **Project Documentation**

## **Table of Contents**
1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Technologies Used](#technologies-used)
4. [System Architecture](#system-architecture)
5. [Setup Instructions](#setup-instructions)
   - [Prerequisites](#prerequisites)
   - [Installation Steps](#installation-steps)
6. [Usage Guide](#usage-guide)
7. [Microservice Design](#microservice-design)
8. [Error Handling](#error-handling)
9. [CI/CD Pipeline](#cicd-pipeline)
10. [Kubernetes Deployment](#kubernetes-deployment)


---

## **Project Overview**
This project is a web application that processes `.docx` files uploaded by users and converts them to PDF format. Additional features include:
- Password protection for the converted PDF files.
- Simple UI for seamless user interaction.

---

## **Features**
- Upload `.docx` files.
- Convert `.docx` files to PDF.
- Download converted PDF files.
- Optional password protection for PDF.
- Dockerized for easy deployment.
- CI/CD pipeline for automated builds and tests.
- Kubernetes manifests for hosting on a cluster.

---

## **Technologies Used**
- **Backend**: Python (Flask)
- **Frontend**: HTML, CSS
- **PDF Processing**: `python-docx` and `reportlab` libraries
- **Metadata Handling**: `python-docx` or `PyPDF2`
- **Containerization**: Docker
- **Orchestration**: Kubernetes
- **CI/CD**: GitHub Actions
- **Version Control**: Git (GitHub/Bitbucket)

---

## **System Architecture**
This project uses a microservice-based architecture with the following components:
1. **Frontend Service**: Handles user interactions and file uploads.
2. **Processing Service**: Converts `.docx` files to PDF and processes metadata.
3. **Authentication Service**: Handles password protection for PDFs.
4. **Storage Service**: Stores uploaded files and converted PDFs.

---

## **Setup Instructions**

### **Prerequisites**
- Python 3.8+
- Docker
- Kubernetes (Minikube/Cloud Provider)
- Node.js (for frontend dependencies, if applicable)
- Git

### **Installation Steps**
1. **Clone the Repository**:
   ```bash
   https://github.com/Gyan-Singh/word_to_pdf
   cd word_to_pdf
   ```

2. **Set Up Virtual Environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the Application**:
   ```bash
   python main.py
   ```

5. **Access the Application**:
   Open your browser and navigate to `http://localhost:5000`.

---

## **Usage Guide**
1. Open the application in your browser.
2. Upload a `.docx` file using the provided form.
3. Choose to add password protection (optional).
4. Download the converted PDF.

---

## **Microservice Design**
### **Services**:
1. **Frontend Service**:
   - Handles user requests and serves the UI.
   - Communicates with backend via REST APIs.

2. **Processing Service**:
   - Converts `.docx` to PDF.

3. **Authentication Service**:
   - Handles password encryption for PDFs.

### **Communication**:
- All services communicate via REST APIs.
- Service discovery enabled using environment variables or service mesh.

---

## **Error Handling**
- File upload errors (e.g., unsupported format) return descriptive error messages.
- File size limitations ensure server stability.
- Detailed logging for debugging issues.
- Graceful handling of Docker container failures.

---

## **CI/CD Pipeline**
A GitHub Actions pipeline automates:
1. Code linting and testing using `pytest`.
2. Building Docker images.
3. Pushing the Docker image to a container registry.
4. Deploying to a Kubernetes cluster.

**Pipeline YAML Example**:
```yaml
name: Build and Deploy

on: push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'
      - name: Install dependencies
        run: pip install -r requirements.txt
      - name: Run tests
        run: pytest
      - name: Build Docker image
        run: docker build -t gyan777/word_to_pdf:latest .
      - name: Push Docker image
        run: docker push gyan777/word_to_pdf:latest
```

---

## **Kubernetes Deployment**
### **Kubernetes Manifest Files**
- **Deployment**:
  ```yaml
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: word_to_pdf
  spec:
    replicas: 3
    selector:
      matchLabels:
        app: word_to_pdf
    template:
      metadata:
        labels:
          app: word_to_pdf
      spec:
        containers:
        - name: offline-project
          image: gyan777/word_to_pdf:latest
          ports:
          - containerPort: 5000
  ```

- **Service**:
  ```yaml
  apiVersion: v1
  kind: Service
  metadata:
    name: word_to_pdft-service
  spec:
    selector:
      app: word_to_pdf
    ports:
      - protocol: TCP
        port: 80
        targetPort: 5000
    type: LoadBalancer
  ```

