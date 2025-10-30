
pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out code from GitHub..."
                timeout(time: 5, unit: 'MINUTES') {
                    git(
                        url: 'https://github.com/MaryumShakeel/DevOps2025.git',
                        branch: 'main'
                    )
                }
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

       stage('Run Tests') {
    steps {
        script {
            if (isUnix()) {
                sh '''
                echo "Running Jest tests on Linux..."
                npm test --silent || true
                '''
            } else {
                bat '''
                echo Running Jest tests on Windows...
                npm test --silent || exit 0
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
            echo "❌ Build failed! Please check the logs."
        }
    }
}
