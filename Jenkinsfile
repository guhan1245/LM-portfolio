pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'e547c381-be07-4433-9edb-a8da4bc2e420', url: 'https://github.com/guhan1245/LM-portfolio.git'
            }
        }
        stage('Build') {
            steps {
                sh 'make build'  // Replace with your build command
            }
        }
        stage('Test') {
            steps {
                sh 'make test'  // Replace with your test command
            }
        }
        stage('Deploy') {
            steps {
                sh 'make deploy'  // Replace with your deploy command
            }
        }
    }
}
