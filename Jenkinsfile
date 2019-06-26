pipeline {
    agent any
    stages {
        stage('Installing Dependences') {
            steps {
                container('nodejs') {
                    sh 'npm config set http-proxy http://proxy.correiosnet.int:80'
                    sh 'npm config set https-proxy http://proxy.correiosnet.int:80'
                    sh 'npm install'
                }
            }
        }
        stage('Building Docker Image') {
            steps {
                container('docker') {
                    sh "docker build -t mycluster.icp:8500/default/reactapp:v${env.BUILD_NUMBER} ."
                }
            }
        }
        stage('Pushing image to ICP Registry') {
            steps {
                container('docker') {
                    withCredentials([usernamePassword(credentialsId: 'registry-secret',
                                    usernameVariable: 'USERNAME',
                                    passwordVariable: 'PASSWORD')]) {
                        sh "docker login -u ${USERNAME} -p ${PASSWORD} mycluster.icp:8500"
                        sh "docker push mycluster.icp:8500/default/reactapp:v${env.BUILD_NUMBER}"
                    }
                }
            }
        }
        stage("Delivery Application on ICP") {
            steps {
                container('kubectl') {
                    sh "kubectl create deployment reactapp-deployment --image=mycluster.icp:8500/default/reactapp:v${env.BUILD_NUMBER} -n default"
                    sh "kubectl expose deployment reactapp-deployment --name=reactapp-service --type=LoadBalancer --port=8080 -n default"
                }
            }
        }
    }
}
