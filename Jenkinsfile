pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds' // Jenkins Docker credentials ID
        IMAGE_NAME = 'maryumshakeel123/myapp:latest'
        NODE_VERSION = '22.13.1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Increase Git buffer for heavy repo
                sh 'git config --global http.postBuffer 524288000'
                
                // Shallow clone to avoid large fetch issues
                checkout([$class: 'GitSCM',
                          branches: [[name: 'main']],
                          doGenerateSubmoduleConfigurations: false,
                          extensions: [[$class: 'CloneOption', depth: 1, noTags: false, shallow: true]],
                          userRemoteConfigs: [[url: 'https://github.com/MaryumShakeel/DevOps2025.git']]
                ])
            }
        }

        stage('Install Node.js Dependencies') {
            steps {
                // Ensure Node.js is available on EC2 Jenkins agent
                sh '''
                   node -v
                   npm install
                '''
            }
        }

        stage('Build Vite App') {
            steps {
                sh '''
                   npm run build
                '''
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
                        echo 'Docker image pushed successfully!'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
