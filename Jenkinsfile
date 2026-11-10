pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'ls -la'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    python -m venv venv
                    . venv/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    . venv/bin/activate
                    pytest -v --junitxml=test-results.xml
                '''
            }
            post {
                always {
                    junit 'test-results.xml'
                }
            }
        }

        stage('Package') {
            steps {
                sh '''
                    mkdir -p dist
                    tar -czf dist/app.tar.gz app.py requirements.txt
                '''
                archiveArtifacts artifacts: 'dist/app.tar.gz', fingerprint: true
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    mkdir -p /var/jenkins_home/deploy
                    cp app.py requirements.txt /var/jenkins_home/deploy/
                    echo "Deployed at $(date)" > /var/jenkins_home/deploy/DEPLOYED.txt
                    ls -la /var/jenkins_home/deploy
                '''
            }
        }

        stage('Terraform Validate and Plan') {
            steps {
                dir('terraform') {
                    sh '''
                        terraform init -input=false
                        terraform fmt -check
                        terraform validate
                        terraform plan -input=false -out=tfplan
                        terraform show -no-color tfplan > plan-output.txt
                    '''
                }
                archiveArtifacts artifacts: 'terraform/plan-output.txt', fingerprint: true
            }
        }
    }

    post {
        success { echo 'Pipeline completed successfully.' }
        failure { echo 'Pipeline failed. Check the logs.' }
    }
}