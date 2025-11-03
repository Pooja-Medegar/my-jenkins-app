pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Pooja-Medegar/my-jenkins-app.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the app...'
                sh 'ls -l'
            }
        }

        stage('Deploy to Server') {
            steps {
                echo 'Deploying to target server...'
                // Example:
                // sh 'ssh -i /path/to/key.pem ec2-user@<server-ip> "bash /home/ec2-user/deploy.sh"'
            }
        }
    }

   post {
    success {
        echo "Build Successful!"
    }
    failure {
        echo "Build Failed!"
    }
}
}
