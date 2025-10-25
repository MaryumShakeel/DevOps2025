pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds'   // Jenkins Docker credentials ID
        IMAGE_NAME = 'maryumshakeel123/myapp:latest'
        NODE_VERSION = '22.13.1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo '🔹 Checking out code from GitHub...'
                sh 'git config --global http.postBuffer 524288000'

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
                echo '🔹 Installing Node.js dependencies...'
                sh '''
                   node -v
                   npm install
                '''
            }
        }

        stage('Build Vite App') {
            steps {
                echo '🔹 Building Vite App...'
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                    echo '✅ Docker image built successfully!'
                }
            }
        }

        stage('Login to Docker Hub & Push Image') {
            steps {
                echo '🔹 Logging into Docker Hub and pushing image...'
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}",
                                                     usernameVariable: 'USERNAME',
                                                     passwordVariable: 'PASSWORD')]) {
                        sh '''
                            echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                            docker push ${IMAGE_NAME}
                        '''
                        echo '✅ Docker image pushed successfully!'
                    }
                }
            }
        }
    }

    post {
        success {
            echo '🎉 Pipeline completed successfully! Image pushed to Docker Hub.'
        }
        failure {
            echo '❌ Pipeline failed! Check the logs for details.'
        }
    }
}
