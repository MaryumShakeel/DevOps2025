pipeline {
    agent any

    environment {
        // Docker Hub credentials
        DOCKERHUB_USERNAME = 'maryumshakeel123'
        DOCKERHUB_TOKEN = 'New-Token'
        IMAGE_NAME = 'maryumshakeel123/myapp:latest' // Assignment ke liye latest tag
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/MaryumShakeel/DevOps2025.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh "echo ${DOCKERHUB_TOKEN} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin"
                    echo 'Logged in to Docker Hub successfully!'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}").push()
                    echo 'Docker image pushed successfully!'
                }
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }
        failure {
            echo 'CI/CD Pipeline failed!'
        }
    }
}
