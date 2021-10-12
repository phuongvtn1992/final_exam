pipeline {
    agent none
    //agent {label 'master'}
    parameters {
        choice(name: 'BUILD_APP', choices: ['All', 'NodeJS', 'Python'], description: 'Please choose type of this build')
    }
    environment {
        PASS = credentials('registry-pass') 
    }

    stages {
	stage('Buid NodeJS') {
            agent {label 'master'}
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
            agent {label 'master'}
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
	    agent {label 'master'}
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
        }*/

        stage('Push NodeJS Img') {
	    agent {label 'master'}
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
        stage('Push Python Img') {
	    agent {label 'master'}
            when {
                expression { 
                    params.BUILD_APP == 'Python'
                }
            }
            steps {
                echo "Push Python Img"
                sh './jenkins/build/build.sh Python'
            }
        }
        stage('Push All Img') {
	    agent {label 'master'}
            when {
                expression { 
                    params.BUILD_APP == 'All'
                }
            }
            steps {
                echo "Push All Img"
                sh './jenkins/build/build.sh All'
            }
        }
        /*stage('Deploy') {
            //agent {label 'node1'}
            steps {
                sh './pipeline6/jenkins/deploy/deploy.sh'
            }
        }*/
    }
}
