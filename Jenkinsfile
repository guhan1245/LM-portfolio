pipeline {
    agent any

    environment {
        DEPLOY_HOST = "192.168.1.100"  // IP of the server
        DEPLOY_USER = "user"  // SSH user
        DEPLOY_PATH = "/var/www/html"  // Path to deploy HTML file
        SSH_KEY = credentials('ssh-key-id')  // Add SSH key as a credential in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from Git repository'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'No build steps required for a simple HTML project'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying HTML file to the server'
                script {
                    // Set up SSH connection
                    sh '''
                    ssh -i $SSH_KEY user@$DEPLOY_HOST "mkdir -p $DEPLOY_PATH"
                    scp -i $SSH_KEY index.html $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH
                    '''
                }
            }
        }

        stage('Post Actions') {
            steps {
                echo 'Deployment completed'
            }
        }
    }

    post {
        failure {
            echo 'Deployment failed. Please check the logs.'
        }
    }
}
