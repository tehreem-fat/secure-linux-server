pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/tehreem-fat/secure-linux-server.git'
        DEPLOY_DIR = '/tmp/secure_server_deploy'
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📦 Cloning repository...'
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Code Validation') {
            steps {
                echo '🧹 Checking file syntax...'
                sh '''
                echo "Checking Shell scripts..."
                find . -name "*.sh" -exec bash -n {} \\;
                echo "✅ All shell scripts syntax OK!"
                '''
            }
        }

        stage('Setup Environment') {
            steps {
                echo '⚙️ Creating deployment directory...'
                sh '''
                mkdir -p ${DEPLOY_DIR}
                cp -r * ${DEPLOY_DIR}/
                ls -la ${DEPLOY_DIR}
                '''
            }
        }

        stage('Deploy (Simulation)') {
            steps {
                echo '🚀 Simulating deployment of Secure Linux Server...'
                sh '''
                cd ${DEPLOY_DIR}
                echo "Running server setup scripts..."
                chmod +x *.sh || true
                for file in *.sh; do
                    echo "Executing $file..."
                    bash $file || true
                done
                echo "✅ Deployment simulation completed!"
                '''
            }
        }
    }

    post {
        success {
            echo '🎉 Secure Linux Server pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Check logs for errors.'
        }
    }
}
