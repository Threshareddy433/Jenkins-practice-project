pipeline {
    agent any
    
    environment {
        APP_NAME = 'python-jenkins-demo'
        DOCKER_IMAGE = "${APP_NAME}"
        BUILD_VERSION = "${BUILD_NUMBER}"
        PYTHON_VERSION = '3.13'
    }
    
    stages {
        stage('🚀 Initialize') {
            steps {
                echo '🚀 Starting Jenkins CI/CD Pipeline'
                echo "Build Number: ${BUILD_NUMBER}"
                echo "Python Version: ${PYTHON_VERSION}"
            }
        }
        
        stage('📥 Checkout') {
            steps {
                echo '📥 Code checkout completed!'
                sh 'ls -la'
            }
        }
        
        stage('🐍 Setup Python') {
            steps {
                echo '🐍 Setting up Python environment...'
                sh 'python3 --version'
                sh 'pip3 --version'
            }
        }
        
        stage('🧪 Run Tests') {
            steps {
                echo '🧪 Running tests...'
                script {
                    if (fileExists('test_app.py')) {
                        sh 'python3 test_app.py'
                    } else {
                        echo 'test_app.py not found, skipping tests'
                    }
                }
            }
        }
        
        stage('🚀 Run App') {
            steps {
                echo '🚀 Running application...'
                script {
                    if (fileExists('app.py')) {
                        sh 'python3 app.py'
                    } else {
                        echo 'app.py not found, creating simple test'
                        sh 'python3 -c "print(\\"Hello from Jenkins!\\")"'
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo '🎉 Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
        always {
            echo '🏁 Pipeline execution finished'
        }
    }
}
