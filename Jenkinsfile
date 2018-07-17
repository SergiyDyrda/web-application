node {
    stage("Checkout") {
            git url: 'https://github.com/SergiyDyrda/web-application'
    }
    stage("Clean|Compile|Unit test|Package|Deploy") {
        def server = Artifactory.server 'artifactory-server'
        withEnv(["ARTIFACTORY_CONTEXT_URL=${server.url}",
                 "ARTIFACTORY_CONTEXT_USERNAME = ${server.username}",
                 "ARTIFACTORY_CONTEXT_PASSWORD = ${server.password}"]) {
            sh "mvn clean deploy"
        }

    }
}