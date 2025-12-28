pipeline {
    agent any

    environment {
        DEV_IMAGE  = "h4meed/onlineshop-dev"
        PROD_IMAGE = "h4meed/onlineshop-prod"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DEV_IMAGE:latest .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-hub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                      echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Push to DEV Repo') {
            when {
                branch 'dev'
            }
            steps {
                sh 'docker push $DEV_IMAGE:latest'
            }
        }

        stage('Push to PROD Repo') {
            when {
                branch 'master'
            }
            steps {
                sh '''
                  docker tag $DEV_IMAGE:latest $PROD_IMAGE:latest
                  docker push $PROD_IMAGE:latest
                '''
            }
        }
    }
}