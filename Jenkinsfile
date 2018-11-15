node('jenkinsNode1') {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        //emailext body: '${env.BUILD_URL} has result ${currentBuild.result}', subject: 'Status of pipeline: ${currentBuild.fullDisplayName}', to: 'vangelov@jboxers.com'
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        //emailext body: 'Build Image', subject: 'Test', to: 'vangelov@jboxers.com'
        app = docker.build("vangelovj/test")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
        //emailext body: 'Test image', subject: 'Test', to: 'vangelov@jboxers.com'
        app.inside {
            sh 'echo "Tests passed"'
            sh 'uname -a;date;uptime'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
       
        //emailext body: 'psuh image', subject: 'Test', to: 'vangelov@jboxers.com'
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
