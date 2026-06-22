pipeline {
    agent any

    environment {
        DEV_IMAGE  = "raguraaman/project-3-devops-dev"
        PROD_IMAGE = "raguraaman/project-3-devops-prod"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DEV_IMAGE:$BUILD_NUMBER .'
            }
        }

        stage('Push DEV Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $DEV_IMAGE:$BUILD_NUMBER
                    '''
                }
            }
        }


        stage('Promote to PROD') {
            steps {
                sh '''
                docker pull $DEV_IMAGE:$BUILD_NUMBER

                docker tag \
                $DEV_IMAGE:$BUILD_NUMBER \
                $PROD_IMAGE:$BUILD_NUMBER

                docker push $PROD_IMAGE:$BUILD_NUMBER
                '''
            }
        }
		
	stage('Deploy to EC2') {
    		steps {
        		sh './deploy.sh'
		}
	}
    }
}
