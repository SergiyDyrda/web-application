pipeline {
    agent any
    stages {
        stage("Checkout") {
            steps {
                git url: 'https://github.com/SergiyDyrda/web-application'
            }
        }
        stage('Clean') {
            steps {
                sh "mvn clean"
            }
        }
        stage('Compile') {
            steps {
                sh "mvn compile"
            }
        }
        stage("Unit test") {
            steps {
                sh "mvn test"
            }
        }
        stage("Package") {
            steps {
                sh "mvn package"
            }
        }
        stage("Deploy") {
            steps {
                sh "mvn deploy"
            }
        }
    }
}