pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo "🔹 Checking out code from GitHub..."
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    if (isUnix()) {
                        sh '''
                        echo "Installing dependencies on Linux..."
                        npm install
                        '''
                    } else {
                        bat '''
                        echo Installing dependencies on Windows...
                        npm install
                        '''
                    }
                }
            }
        }

        stage('Build App') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'npm run build'
                    } else {
                        bat 'npm run build'
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t maryumshakeel123/myapp:latest .'
                    } else {
                        bat 'docker build -t maryumshakeel123/myapp:latest .'
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Build completed successfully!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
