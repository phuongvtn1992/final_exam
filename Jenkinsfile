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
                echo "Push Node Img"
                sh './jenkins/push/push.sh NodeJS'
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
                sh './jenkins/push/push.sh Python'
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
                sh './jenkins/push/push.sh All'
            }
        }
        stage('Deploy NodeJS') {
            agent {label 'ubuntu'}
	    when {
                expression { 
                    params.BUILD_APP == 'NodeJS'
                }
            }
            steps {
		echo "Deploy NodeJS Img"
                sh './jenkins/push/push.sh NodeJS'
            }
        }
	stage('Deploy Python') {
            agent {label 'ubuntu'}
	    when {
                expression { 
                    params.BUILD_APP == 'Python'
                }
            }
            steps {
		echo "Deploy NodeJS Img"
                sh './jenkins/push/push.sh Python'
            }
        }
	stage('Deploy All') {
            agent {label 'ubuntu'}
	    when {
                expression { 
                    params.BUILD_APP == 'All'
                }
            }
            steps {
		echo "Deploy NodeJS Img"
                sh './jenkins/push/push.sh All'
            }
        }
    }
}
