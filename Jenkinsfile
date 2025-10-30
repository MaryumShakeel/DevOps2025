stage('Run Tests') {
    steps {
        script {
            if (isUnix()) {
                sh '''
                echo "Running Jest tests on Linux..."
                npm test
                '''
            } else {
                bat '''
                echo Running Jest tests on Windows...
                npm test
                '''
            }
        }
        // ✅ JUnit report publish
        junit 'junit.xml'
    }
}
