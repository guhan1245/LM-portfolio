pipeline {
    agent any

    environment {
        // Define any necessary environment variables here
        // For example, you could define a deployment directory or URL
        DEPLOY_DIR = '/var/www/html'  // Example deployment directory
    }

    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    // Checkout the code from your GitHub repository
                    git url: 'https://github.com/guhan1245/LM-portfolio.git', branch: 'main', credentialsId: 'e547c381-be07-4433-9edb-a8da4bc2e420'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Since it's just an HTML file, we skip the build process
                    echo 'No build steps required for a simple HTML project.'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Here, we deploy the HTML file. For example, copy it to a web server's directory.
                    echo 'Deploying HTML file...'
                    // Example: Use SCP to copy the HTML file to the server
                    sh 'scp index.html user@your-server:/var/www/html'  // Modify as per your server's location

                    // If using AWS S3 to deploy:
                    // sh 'aws s3 cp index.html s3://your-bucket-name/'

                    // You can also copy the file locally if needed
                    // sh 'cp index.html /desired/local/path/'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed. Please check the logs.'
        }
    }
}
