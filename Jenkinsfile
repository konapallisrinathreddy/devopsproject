pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('srinath') // Replace with your Docker Hub credentials ID
        DOCKERHUB_REPO = 'srinath12123/devops-project1' // Replace with your Docker Hub repo
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKERHUB_REPO}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKERHUB_CREDENTIALS') {
                        docker.image("${DOCKERHUB_REPO}:latest").push('latest')
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up any resources used by the pipeline
            cleanWs()
        }
    }
}
