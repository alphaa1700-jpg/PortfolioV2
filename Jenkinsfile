pipeline {
    agent any

    environment {
        IMAGE = "jenkins-demo-app"
        CONTAINER = "jenkins-demo-container"
    }

    stages {

        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop $CONTAINER || true'
                sh 'docker rm $CONTAINER || true'
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d -p 3000:3000 --name $CONTAINER $IMAGE'
            }
        }
    }
}
