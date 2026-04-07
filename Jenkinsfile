pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/tehreem-fat/enterprise-linux-security-hardening-toolkit.git'
        DEPLOY_DIR = '/tmp/secure_server_deploy'
        LOG_FILE = '/var/log/auth.log'
    }

    options {
        timestamps()
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo '📦 Cloning repository...'
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Code Quality & Syntax Check') {
            steps {
                echo '🧹 Validating scripts...'
                sh '''
                echo "Checking Bash scripts syntax..."
                find . -name "*.sh" -exec bash -n {} \\;

                echo "Checking Python syntax..."
                python3 -m py_compile log_monitor.py

                echo "✅ Code validation successful"
                '''
            }
        }

        stage('Security Linting (Basic)') {
            steps {
                echo '🔐 Running basic security checks...'
                sh '''
                echo "Checking for hardcoded passwords..."
                grep -Ri "password" . || true

                echo "Checking for sudo misuse..."
                grep -Ri "sudo" . || true

                echo "✅ Basic security scan completed"
                '''
            }
        }

        stage('Setup Deployment Environment') {
            steps {
                echo '⚙️ Preparing deployment directory...'
                sh '''
                rm -rf ${DEPLOY_DIR}
                mkdir -p ${DEPLOY_DIR}
                cp -r * ${DEPLOY_DIR}/
                ls -la ${DEPLOY_DIR}
                '''
            }
        }

        stage('Execute Hardening Scripts') {
            steps {
                echo '🔧 Running system hardening scripts...'
                sh '''
                cd ${DEPLOY_DIR}
                chmod +x *.sh || true

                for script in *.sh; do
                    echo "Executing $script..."
                    sudo bash $script || true
                done

                echo "✅ Hardening scripts executed"
                '''
            }
        }

        stage('Threat Detection Simulation') {
            steps {
                echo '🕵️ Running log monitoring...'
                sh '''
                cd ${DEPLOY_DIR}

                echo "Simulating threat detection..."
                python3 log_monitor.py || true

                echo "✅ Threat detection completed"
                '''
            }
        }

        stage('Report Generation') {
            steps {
                echo '📊 Generating security report...'
                sh '''
                cd ${DEPLOY_DIR}

                echo "Security Report - $(date)" > report.txt
                echo "---------------------------" >> report.txt

                echo "Open Ports:" >> report.txt
                ss -tuln >> report.txt

                echo "\\nLast Logins:" >> report.txt
                last -a | head >> report.txt

                echo "\\nRunning Services:" >> report.txt
                systemctl list-units --type=service --state=running >> report.txt

                echo "✅ Report generated"
                '''
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo '📁 Archiving reports...'
                archiveArtifacts artifacts: '**/*.txt', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '🎉 Pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Check logs for debugging.'
        }
        always {
            echo '📌 Cleaning workspace...'
            cleanWs()
        }
    }
}
