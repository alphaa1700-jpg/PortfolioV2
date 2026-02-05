pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-node-app"
        CONTAINER_NAME = "portfolio-container"
    }

    stages {

        stage('Clone Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'CI=true npm test -- --passWithNoTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push & Deploy') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub-creds',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {

            sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'

            // Push image
            sh 'docker tag $IMAGE_NAME $DOCKER_USER/$IMAGE_NAME'
            sh 'docker push $DOCKER_USER/$IMAGE_NAME'

            // Deploy container on VM
            sh 'docker stop $CONTAINER_NAME || true'
            sh 'docker rm $CONTAINER_NAME || true'
            sh 'docker pull $DOCKER_USER/$IMAGE_NAME'
            sh 'docker run -d -p 80:80 --name $CONTAINER_NAME $DOCKER_USER/$IMAGE_NAME'
        }
    }
}


    post {
        always {
            sh 'docker logout || true'
        }
    }
}
