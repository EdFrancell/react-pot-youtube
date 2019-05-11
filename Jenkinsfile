pipeline {
    agent any
    stages {
        stage('Installing Dependences') {
            steps {
                container('nodejs') {
                    sh 'npm install'
                }
            }
        }
        stage('Building Docker Image') {
            steps {
                container('docker') {
                    sh "docker build -t dcprd036036.weg.net:8500/default/reactapp:v${env.BUILD_NUMBER} ."
                }
            }
        }
        stage('Pushing image to ICP Registry') {
            steps {
                container('docker') {
                    withCredentials([usernamePassword(credentialsId: 'registry-secret',
                                    usernameVariable: 'USERNAME',
                                    passwordVariable: 'PASSWORD')]) {
                        sh "docker login -u ${USERNAME} -p ${PASSWORD} master.icp.cloud:8500"
                        sh "docker push dcprd036036.weg.net:8500/default/reactapp:v${env.BUILD_NUMBER}"
                    }
                }
            }
        }
        stage("Delivery Application on ICP") {
            steps {
                container('kubectl') {
                    sh "kubectl create deployment reactapp-deployment --image=dcprd036036.weg.net:8500/default/reactapp:v${env.BUILD_NUMBER} -n default"
                    sh "kubectl expose deployment reactapp-deployment --name=reactapp-service --type=LoadBalancer --port=8080 -n default"
                }
            }
        }
    }
}
