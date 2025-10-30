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

        // ✅ JUnit report publish
        junit 'junit.xml'
    }
}
