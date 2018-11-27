pipeline {
    agent any
    stages {
        stage('Instalando dependencias') {
            steps {
                container('nodejs') {
                    dir("react-pot-youtube") {
                        sh 'npm install'
                    }
                }
            }
        }
        stage('Construindo Imagem Docker') {
            steps {
                container('docker') {
                    dir("react-pot-youtube"){
                        sh 'ls -l'
                        //sh "docker build -t mycluster.icp:8500/default/reactapp:v${env.BUILD_NUMBER} ."
                    }
                }
            }
        }
        // stage('Subindo Imagem para o ICP') {
        //     steps {
        //         container('docker') {
        //             withCredentials([usernamePassword(credentialsId: 'registry-secret',
        //                             usernameVariable: 'USERNAME',
        //                             passwordVariable: 'PASSWORD')]) {
        //                 sh "docker login -u ${USERNAME} -p ${PASSWORD} mycluster.icp:8500"
        //                 sh "docker push mycluster.icp:8500/default/reactapp:v${env.BUILD_NUMBER}"
        //             }
        //         }
        //     }
        // }
        // stage("Delivery no ICP Dev") {
        //     steps {
        //         container('kubectl') {
        //             sh "kubectl create deployment reactapp-deployment --image=mycluster.icp:8500/default/reactapp:v${env.BUILD_NUMBER} -n default"
        //             sh "kubectl expose deployment status deployment reactapp-deployment -n default"
        //             sh "kubectl set image deployment reactapp-deployment reactapp=mycluster.icp:8500/default/reactapp:v${env.BUILD_NUMBER} -n default"
        //             sh "kubectl rollout status deployment reactapp-deployment -n default"
        //         }
        //     }
        // }
    }
}