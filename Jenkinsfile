pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/guhan1245/LM-portfolio.git'
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
