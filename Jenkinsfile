pipeline {
    //test trigger
    //agent none
    agent {label 'master'}
    parameters {
        choice(name: 'BUILD_APP', choices: ['All', 'NodeJS', 'Python'], description: 'Please choose type of this build')
    }
    environment {
        PASS = credentials('registry-pass') 
    }

    stages {
	stage('Buid NodeJS') {
            when {
                expression { 
                    params.BUILD_APP == 'NodeJS'
                }
            }
            steps {
                echo "Build Node"
                sh './jenkins/build/build.sh NodeJS'
            }
        }
        stage('Buid Python') {
            when {
                expression { 
                    params.BUILD_APP == 'Python'
                }
            }
            steps {
                echo "Build Python"
                sh './jenkins/build/build.sh Python'
            }
        }
        stage('Build All') {
            when {
                expression { 
                    params.BUILD_APP == 'All'
                }
            }
            steps {
                echo "Build All"
                sh './jenkins/build/build.sh All'
            }
        }

        /*stage('Test') {
            //agent {label 'master'}
            steps {
                sh './pipeline6/jenkins/test/mvn.sh mvn test'
            }

            post {
                always {
                    junit 'pipeline6/java-app/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Push') {
            //agent {label 'master'}
            steps {
                sh './pipeline6/jenkins/push/push.sh'
            }
        }

        stage('Deploy') {
            //agent {label 'node1'}
            steps {
                sh './pipeline6/jenkins/deploy/deploy.sh'
            }
        }*/
    }
}
