pipeline {
    agent any

    environment {
        // Set Docker image name
        IMAGE_NAME = 'my-webpage-apache'
        DOCKER_REGISTRY = 'localhost:5000' // Use local Docker registry or leave as empty for direct deployment
        DOCKER_IMAGE = "${DOCKER_REGISTRY}/${IMAGE_NAME}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Pull the code from GitHub repository
                git url: 'https://github.com/guhan1245/LM-portfolio.git', credentialsId: 'github-credentials-id'
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
                    // Stop any running container with the same name
                    sh 'docker ps -q --filter "name=${IMAGE_NAME}" | xargs -r docker stop'
                    sh 'docker ps -a -q --filter "name=${IMAGE_NAME}" | xargs -r docker rm'
                    
                    // Run the Docker container in detached mode
                    sh 'docker run -d -p 80:80 --name ${IMAGE_NAME} ${IMAGE_NAME}'
                }
            }
        }

        stage('Push to Docker Registry (Optional)') {
            when {
                branch 'main' // Only push to Docker registry on the 'main' branch (if using a private registry)
            }
            steps {
                script {
                    // If you're using a private registry, login first
                    if (DOCKER_REGISTRY != '') {
                        sh "docker login ${DOCKER_REGISTRY} -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    }
                    
                    // Tag the Docker image for pushing to registry
                    sh 'docker tag ${IMAGE_NAME} ${DOCKER_IMAGE}'
                    
                    // Push the Docker image to the registry
                    sh 'docker push ${DOCKER_IMAGE}'
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
            // Cleanup after build: stop and remove any containers with the same name
            sh 'docker ps -q --filter "name=${IMAGE_NAME}" | xargs -r docker stop'
            sh 'docker ps -a -q --filter "name=${IMAGE_NAME}" | xargs -r docker rm'
        }
    }
}
