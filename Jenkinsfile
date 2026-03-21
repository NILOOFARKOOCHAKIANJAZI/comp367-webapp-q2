pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    environment {
        DOCKER_HUB_USERNAME = 'niloofarkoochakianjazi'
        IMAGE_NAME = 'niloofarkoochakianjazi/comp367-webapp:lab3'
    }

    stages {
        stage('Check out') {
            steps {
                git branch: 'main', url: 'https://github.com/NILOOFARKOOCHAKIANJAZI/comp367-webapp-q2.git'
            }
        }

        stage('Build maven project') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker login') {
            steps {
                withCredentials([string(credentialsId: 'CredentialID_DockerHubPWD', variable: 'DOCKER_HUB_TOKEN')]) {
                    sh 'echo "$DOCKER_HUB_TOKEN" | docker login -u "$DOCKER_HUB_USERNAME" --password-stdin'
                }
            }
        }

        stage('Docker build') {
            steps {
                sh 'docker build -t "$IMAGE_NAME" .'
            }
        }

        stage('Docker push') {
            steps {
                sh 'docker push "$IMAGE_NAME"'
            }
        }
    }
}
