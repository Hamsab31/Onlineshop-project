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
                sh 'echo "Branch = $GIT_BRANCH"'
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

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DEV_IMAGE:latest .'
            }
        }

        stage('Push to DEV Repo') {
            when {
                expression { env.GIT_BRANCH == 'origin/dev' }
            }
            steps {
                sh 'docker push $DEV_IMAGE:latest'
            }
        }

        stage('Push to PROD Repo') {
            when {
                expression { env.GIT_BRANCH == 'origin/master' }
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