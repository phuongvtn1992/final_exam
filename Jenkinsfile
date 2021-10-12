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
                    params.BUILD_APP == 'NodeJS' || params.BUILD_APP == 'All'
                }
            }
            steps {
                echo "Build Node"
                ./final_exam/jenkins/build/build.sh NodeJS
            }
        }
        stage('Buid Python') {
            when {
                expression { 
                    params.BUILD_APP == 'Python' || params.BUILD_APP == 'All'
                }
            }
            steps {
                echo "Build Python"
                ./final_exam/jenkins/build/build.sh Python
            }
        }
        /*stage('Build') {
            //agent {label 'master'}
            steps {
                sh '''
                    ./final_exam/jenkins/build/clone_repo.sh
                    ./final_exam/jenkins/build/build.sh ${params.BUILD_APP}
                '''
            }
        }

        stage('Test') {
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
