pipeline {
    agent any
        
    tools {
        maven 'MyMaven'
    }
    stages {      
        stage ('1.Complie Code') {
            steps {
                sh 'mvn compile'
        }
        }
        stage ('2.Test Code') {
            steps {
                sh 'mvn test'
        }
            post{
            success{
                junit 'target/surefire-reports/*.xml'
            }
        }
        }
        stage ('3.Package Code') {
            steps {
                sh 'mvn clean package'
                sh 'mvn clean install'
            }
        }
        stage ('4.Build and Push Docker Image') {
            steps {
                sh 'docker build -t sathiz/$JOB_NAME:$BUILD_NUMBER .'            
            withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'Docker_pwd', usernameVariable: 'Docker_ID')]) {
                sh "echo '${Docker_pwd}' | docker login -u ${Docker_ID} --password-stdin"
            }
                sh 'docker push sathiz/$JOB_NAME:$BUILD_NUMBER'
            }
        }
        
    }
}
