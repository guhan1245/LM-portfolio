pipeline {
    agent any

    environment {
        // Define any necessary environment variables here if needed
    }

    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    // Checkout the code from the GitHub repository
                    git url: 'https://github.com/guhan1245/LM-portfolio.git', branch: 'main', credentialsId: 'e547c381-be07-4433-9edb-a8da4bc2e420'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // You can add validation steps for the HTML file if needed
                    echo 'No build steps required for this project.'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Optionally, add a step to validate your HTML, e.g., checking if the HTML file is valid
                    echo 'Testing not required for a simple HTML project.'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy your HTML file, for example, copying to a server or S3
                    echo 'Deploying HTML file...'
                    // Example: 
                    // sh 'scp index.html user@server:/path/to/deployment/location'
                    // or if using AWS S3:
                    // sh 'aws s3 cp index.html s3://your-bucket-name/'
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
