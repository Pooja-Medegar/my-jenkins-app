pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Pooja-Medegar/my-jenkins-app.git'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(['ec2-ssh']) {
                    sh '''
                    echo "📦 Copying files to EC2..."
                    scp -o StrictHostKeyChecking=no -r * ec2-user@44.211.242.212:/tmp/myapp
                    echo "🚀 Running deploy script on EC2..."
                    ssh -o StrictHostKeyChecking=no ec2-user@44.211.242.212 'bash /tmp/myapp/deploy.sh'
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
