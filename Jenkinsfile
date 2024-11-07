pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                // Checkout the code from GitHub repository
                git url: 'https://github.com/guhan1245/LM-portfolio.git', branch: 'main', credentialsId: 'e547c381-be07-4433-9edb-a8da4bc2e420'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Run build commands, e.g., for Node.js (npm install), Java (mvn clean install), etc.
                    sh 'npm install'  // Replace with your build command if necessary
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests here (you can replace this with your actual test commands)
                    sh 'npm test'  // Replace with your test command if needed
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy your project, e.g., run deployment scripts, push to a server, etc.
                    echo 'Deploying project...'
                    // Add deployment commands here
                }
            }
        }
    }

    post {
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed. Please check the logs.'
        }
    }
}
