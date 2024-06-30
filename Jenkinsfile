pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub') // The ID of the Docker Hub credentials in Jenkins
        DOCKERHUB_REPO = 'your-dockerhub-username/your-repository' // Replace with your Docker Hub repo
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
