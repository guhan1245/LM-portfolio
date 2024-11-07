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
            echo 'Deploying HTML file...'
            // Replace 'user@your-server' with your actual SSH user and server address
            sh 'scp index.html user@192.168.1.100:/var/www/html'  // Replace with your actual server details

            // Or if you're using AWS S3 to deploy, use:
            // sh 'aws s3 cp index.html s3://your-bucket-name/'

            // Local deployment (if needed):
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
