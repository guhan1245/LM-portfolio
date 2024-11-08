pipeline {
    agent any

    environment {
        // Set Docker image name
        IMAGE_NAME = 'my-webpage-apache'
        DOCKER_REGISTRY = 'localhost:5000' // Use local Docker registry, or leave as empty for direct deployment
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Pull the code from GitHub repository
                git 'https://github.com/your-username/your-repository.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t ${IMAGE_NAME} .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop any running container of the same name
                    sh 'docker ps -q --filter "name=${IMAGE_NAME}" | xargs -r docker stop'
                    sh 'docker ps -a -q --filter "name=${IMAGE_NAME}" | xargs -r docker rm'
                    
                    // Run the Docker container in detached mode
                    sh 'docker run -d -p 80:80 --name ${IMAGE_NAME} ${IMAGE_NAME}'
                }
            }
        }

        stage('Push to Docker Registry (Optional)') {
            when {
                branch 'main' // Only push to Docker registry on main branch (if using a private registry)
            }
            steps {
                script {
                    // Push the Docker image to the registry
                    sh 'docker tag ${IMAGE_NAME} ${DOCKER_REGISTRY}/${IMAGE_NAME}'
                    sh 'docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Optionally remove the Docker image after deployment
                    sh 'docker rmi ${IMAGE_NAME}'
                }
            }
        }
    }

    post {
        always {
            // Cleanup after build
            sh 'docker ps -q --filter "name=${IMAGE_NAME}" | xargs -r docker stop'
            sh 'docker ps -a -q --filter "name=${IMAGE_NAME}" | xargs -r docker rm'
        }
    }
}
