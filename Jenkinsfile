pipeline {
    def server

    agent any
    stages {
        stage("Checkout") {
            steps {
                git url: 'https://github.com/SergiyDyrda/web-application'
            }
        }
        stage('Artifactory configuration') {
            // Obtain an Artifactory server instance, defined in Jenkins --> Manage:
        }
        stage("Clean|Compile|Unit test|Package|Deploy") {
            server = Artifactory.server 'artifactory-server'
            environment {
                ARTIFACTORY_CONTEXT_URL = server.url
                ARTIFACTORY_CONTEXT_USERNAME = server.username
                ARTIFACTORY_CONTEXT_PASSWORD = server.password
            }
            steps {
                    sh "mvn clean deploy"
            }

        }
    }
}