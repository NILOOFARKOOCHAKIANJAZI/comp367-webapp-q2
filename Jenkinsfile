pipeline {
    agent any

    tools {
        maven 'Maven'
    }

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
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Docker login') {
            steps {
                withCredentials([string(credentialsId: 'CredentialID_DockerHubPWD', variable: 'DOCKER_HUB_TOKEN')]) {
                    bat 'echo %DOCKER_HUB_TOKEN% | docker login -u %DOCKER_HUB_USERNAME% --password-stdin'
                }
            }
        }

        stage('Docker build') {
            steps {
                bat 'docker build -t "%IMAGE_NAME%" .'
            }
        }

        stage('Docker push') {
            steps {
                bat 'docker push "%IMAGE_NAME%"'
            }
        }
    }
}
