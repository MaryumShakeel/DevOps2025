pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds' // Jenkins credentials ID
        IMAGE_NAME = 'maryumshakeel123/myapp:latest'
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
                    echo 'Docker image built successfully!'
                }
            }
        }

        stage('Login to Docker Hub & Push Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", 
                                                     usernameVariable: 'USERNAME', 
                                                     passwordVariable: 'PASSWORD')]) {
                        sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                        docker.image("${IMAGE_NAME}").push()
                        echo 'Docker image pushed to Docker Hub successfully!'
                    }
                }
            }
        }
    }

    post {
        success { echo 'Pipeline completed successfully!' }
        failure { echo 'Pipeline failed!' }
    }
}

