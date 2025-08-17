#!/bin/bash

# Complete Jenkins Python CI/CD Project Setup Script
# This script creates the entire project structure with all necessary files

set -e  # Exit on any error

echo "🚀 Setting up Jenkins Python CI/CD Demo Project"
echo "=" * 60

# Create project directory
PROJECT_NAME="jenkins-python-demo"
echo "📁 Creating project directory: $PROJECT_NAME"
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

echo "📝 Creating Python application file (app.py)..."
cat > app.py << 'EOF'
#!/usr/bin/env python3

def add_numbers(a, b):
    """Add two numbers and return the result"""
    return a + b

def multiply_numbers(a, b):
    """Multiply two numbers and return the result"""
    return a * b

def divide_numbers(a, b):
    """Divide two numbers and return the result"""
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

def greet_user(name):
    """Greet the user with their name"""
    return f"Hello, {name}! Welcome to our Jenkins CI/CD pipeline!"

def calculate_factorial(n):
    """Calculate factorial of a number"""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def is_prime(n):
    """Check if a number is prime"""
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

def main():
    """Main function to run the application"""
    print("=" * 60)
    print("🐍 Python Application - Jenkins CI/CD Demo")
    print("=" * 60)
    
    # Test basic operations
    num1, num2 = 10, 5
    
    addition_result = add_numbers(num1, num2)
    multiplication_result = multiply_numbers(num1, num2)
    division_result = divide_numbers(num1, num2)
    
    print(f"📊 Mathematical Operations:")
    print(f"   Addition: {num1} + {num2} = {addition_result}")
    print(f"   Multiplication: {num1} × {num2} = {multiplication_result}")
    print(f"   Division: {num1} ÷ {num2} = {division_result}")
    
    # Test factorial
    factorial_num = 5
    factorial_result = calculate_factorial(factorial_num)
    print(f"   Factorial: {factorial_num}! = {factorial_result}")
    
    # Test prime checking
    test_numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    primes = [num for num in test_numbers if is_prime(num)]
    print(f"   Prime numbers in {test_numbers}: {primes}")
    
    # Greet user
    greeting = greet_user("Jenkins User")
    print(f"\n🎉 {greeting}")
    
    # Application info
    print(f"\n📋 Application Information:")
    print(f"   Version: 1.0.0")
    print(f"   Environment: Production")
    print(f"   Status: ✅ All systems operational")
    
    print(f"\n✅ Application executed successfully!")
    print("=" * 60)

if __name__ == "__main__":
    main()
EOF

echo "🧪 Creating unit tests file (test_app.py)..."
cat > test_app.py << 'EOF'
#!/usr/bin/env python3
import unittest
from app import add_numbers, multiply_numbers, divide_numbers, greet_user, calculate_factorial, is_prime

class TestMathOperations(unittest.TestCase):
    
    def test_add_numbers(self):
        """Test addition function"""
        self.assertEqual(add_numbers(2, 3), 5)
        self.assertEqual(add_numbers(-1, 1), 0)
        self.assertEqual(add_numbers(0, 0), 0)
        self.assertEqual(add_numbers(-5, -3), -8)
    
    def test_multiply_numbers(self):
        """Test multiplication function"""
        self.assertEqual(multiply_numbers(3, 4), 12)
        self.assertEqual(multiply_numbers(-2, 3), -6)
        self.assertEqual(multiply_numbers(0, 5), 0)
        self.assertEqual(multiply_numbers(-2, -3), 6)
    
    def test_divide_numbers(self):
        """Test division function"""
        self.assertEqual(divide_numbers(10, 2), 5)
        self.assertEqual(divide_numbers(9, 3), 3)
        self.assertEqual(divide_numbers(-6, 2), -3)
        self.assertAlmostEqual(divide_numbers(7, 3), 2.333333333333333)
        
        # Test division by zero
        with self.assertRaises(ValueError):
            divide_numbers(5, 0)
    
    def test_calculate_factorial(self):
        """Test factorial function"""
        self.assertEqual(calculate_factorial(0), 1)
        self.assertEqual(calculate_factorial(1), 1)
        self.assertEqual(calculate_factorial(5), 120)
        self.assertEqual(calculate_factorial(3), 6)
        
        # Test negative number
        with self.assertRaises(ValueError):
            calculate_factorial(-1)
    
    def test_is_prime(self):
        """Test prime number checking"""
        # Test prime numbers
        self.assertTrue(is_prime(2))
        self.assertTrue(is_prime(3))
        self.assertTrue(is_prime(5))
        self.assertTrue(is_prime(7))
        self.assertTrue(is_prime(11))
        
        # Test non-prime numbers
        self.assertFalse(is_prime(1))
        self.assertFalse(is_prime(4))
        self.assertFalse(is_prime(6))
        self.assertFalse(is_prime(8))
        self.assertFalse(is_prime(9))
        self.assertFalse(is_prime(10))
        
        # Test edge cases
        self.assertFalse(is_prime(0))
        self.assertFalse(is_prime(-5))

class TestUtilityFunctions(unittest.TestCase):
    
    def test_greet_user(self):
        """Test greeting function"""
        result = greet_user("Alice")
        self.assertIn("Alice", result)
        self.assertIn("Hello", result)
        self.assertIn("Welcome", result)
        
        # Test empty name
        result_empty = greet_user("")
        self.assertIn("Hello", result_empty)
        
        # Test special characters
        result_special = greet_user("John-Doe_123")
        self.assertIn("John-Doe_123", result_special)

class TestIntegration(unittest.TestCase):
    
    def test_complex_calculations(self):
        """Test combinations of functions"""
        # Test: (2 + 3) * 4 = 20
        step1 = add_numbers(2, 3)  # 5
        result = multiply_numbers(step1, 4)  # 20
        self.assertEqual(result, 20)
        
        # Test: 10 / 2 + 3 = 8
        step1 = divide_numbers(10, 2)  # 5
        result = add_numbers(step1, 3)  # 8
        self.assertEqual(result, 8)
    
    def test_edge_cases(self):
        """Test edge cases and boundary conditions"""
        # Test very large numbers
        large_result = add_numbers(999999, 1)
        self.assertEqual(large_result, 1000000)
        
        # Test decimal precision
        result = divide_numbers(1, 3)
        self.assertAlmostEqual(result, 0.3333333333333333, places=10)

if __name__ == "__main__":
    print("🧪 Running Unit Tests...")
    print("=" * 50)
    
    # Run tests with verbose output
    unittest.main(verbosity=2, exit=False)
    
    print("=" * 50)
    print("✅ Unit tests completed!")
EOF

echo "🐳 Creating Dockerfile..."
cat > Dockerfile << 'EOF'
# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set metadata
LABEL maintainer="your-email@example.com"
LABEL version="1.0.0"
LABEL description="Python Jenkins CI/CD Demo Application"

# Set working directory inside container
WORKDIR /app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV APP_ENV=production

# Update package list and install any system dependencies if needed
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for security
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Copy application files
COPY app.py .
COPY test_app.py .

# Create logs directory
RUN mkdir -p /app/logs

# Change ownership of app directory to appuser
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Health check to ensure container is healthy
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python3 -c "import app; print('Health check passed')" || exit 1

# Add volume for logs (optional)
VOLUME ["/app/logs"]

# Default command to run the application
CMD ["python3", "app.py"]
EOF

echo "🚫 Creating .dockerignore file..."
cat > .dockerignore << 'EOF'
# Git files and directories
.git
.gitignore
.gitattributes

# Python cache and compiled files
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# Virtual environments
env/
venv/
ENV/
env.bak/
venv.bak/
.env
.venv

# IDE and editor files
.vscode/
.idea/
*.swp
*.swo
*~
.project
.settings/
.pydevproject

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs and databases
*.log
*.sqlite
*.db

# Testing
.coverage
.pytest_cache/
.tox/
.nox/
htmlcov/
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/

# Documentation
docs/
*.md
LICENSE
README*

# Configuration files
.env.local
.env.development
.env.test
config.local.json

# Jenkins and CI/CD files
Jenkinsfile
.jenkins/
jenkins/

# Docker files
Dockerfile*
docker-compose*.yml
.dockerignore

# Backup files
*.bak
*.backup
*.orig

# Temporary files
tmp/
temp/
.tmp/
EOF

echo "⚙️ Creating Jenkinsfile..."
cat > Jenkinsfile << 'EOF'
pipeline {
    agent any
    
    environment {
        APP_NAME = 'python-jenkins-demo'
        DOCKER_IMAGE = "${APP_NAME}"
        BUILD_VERSION = "${BUILD_NUMBER}"
        PYTHON_VERSION = '3.11'
    }
    
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timeout(time: 30, unit: 'MINUTES')
        timestamps()
    }
    
    stages {
        stage('🚀 Initialize') {
            steps {
                echo '=' * 60
                echo '🚀 Starting Jenkins CI/CD Pipeline'
                echo '=' * 60
                echo "📋 Build Information:"
                echo "   → Project: ${APP_NAME}"
                echo "   → Build Number: ${BUILD_NUMBER}"
                echo "   → Build Version: ${BUILD_VERSION}"
                echo "   → Python Version: ${PYTHON_VERSION}"
                echo "   → Workspace: ${WORKSPACE}"
                echo '=' * 60
            }
        }
        
        stage('📥 Checkout Code') {
            steps {
                echo '📥 Checking out code from repository...'
                script {
                    sh 'ls -la'
                    sh 'pwd'
                }
                echo '✅ Code checkout completed successfully!'
            }
        }
        
        stage('🐍 Setup Python Environment') {
            steps {
                echo '🐍 Setting up Python environment...'
                sh '''
                    echo "Python version:"
                    python3 --version
                    
                    echo "Pip version:"
                    pip3 --version
                    
                    echo "Python path:"
                    which python3
                '''
                echo '✅ Python environment verified successfully!'
            }
        }
        
        stage('📦 Install Dependencies') {
            steps {
                echo '📦 Installing project dependencies...'
                sh '''
                    python3 -m pip install --upgrade pip
                    
                    if [ -f "requirements.txt" ]; then
                        echo "Installing from requirements.txt..."
                        pip3 install -r requirements.txt
                    else
                        echo "No requirements.txt found. No external dependencies to install."
                    fi
                    
                    python3 -c "import app; print('✅ app.py imports successfully')"
                    python3 -c "import test_app; print('✅ test_app.py imports successfully')"
                '''
                echo '✅ Dependencies installed successfully!'
            }
        }
        
        stage('🔍 Code Quality Check') {
            parallel {
                stage('Syntax Check') {
                    steps {
                        echo '🔍 Performing Python syntax validation...'
                        sh '''
                            echo "Checking app.py syntax..."
                            python3 -m py_compile app.py
                            
                            echo "Checking test_app.py syntax..."
                            python3 -m py_compile test_app.py
                            
                            echo "✅ All Python files have valid syntax!"
                        '''
                    }
                }
                
                stage('Import Check') {
                    steps {
                        echo '🔍 Checking module imports...'
                        sh '''
                            echo "Testing imports..."
                            python3 -c "
import app
import test_app
print('✅ All imports successful!')
print(f'Functions in app: {[func for func in dir(app) if not func.startswith(\"_\")]}')
"
                        '''
                    }
                }
            }
        }
        
        stage('🧪 Run Unit Tests') {
            steps {
                echo '🧪 Executing comprehensive unit tests...'
                sh '''
                    echo "Running unit tests with detailed output..."
                    python3 test_app.py
                    
                    echo ""
                    echo "Running tests with unittest module for additional verification..."
                    python3 -m unittest test_app.py -v
                '''
                echo '✅ All unit tests passed successfully!'
            }
        }
        
        stage('🚀 Run Application') {
            steps {
                echo '🚀 Executing the main application...'
                sh '''
                    echo "Running the Python application..."
                    python3 app.py
                    
                    echo ""
                    echo "Application execution completed successfully!"
                '''
                echo '✅ Application executed successfully!'
            }
        }
        
        stage('🐳 Docker Operations') {
            stages {
                stage('Build Docker Image') {
                    steps {
                        echo '🐳 Building Docker image...'
                        script {
                            sh """
                                echo "Building Docker image: ${DOCKER_IMAGE}:${BUILD_VERSION}"
                                docker build -t ${DOCKER_IMAGE}:${BUILD_VERSION} .
                                
                                echo "Tagging as latest..."
                                docker build -t ${DOCKER_IMAGE}:latest .
                                
                                echo "Docker images built:"
                                docker images | grep ${DOCKER_IMAGE}
                            """
                        }
                        echo "✅ Docker image built successfully: ${DOCKER_IMAGE}:${BUILD_VERSION}"
                    }
                }
                
                stage('Test Docker Image') {
                    steps {
                        echo '🧪 Testing Docker image functionality...'
                        script {
                            sh """
                                echo "Testing application in Docker container..."
                                docker run --rm ${DOCKER_IMAGE}:latest
                                
                                echo ""
                                echo "Running unit tests in Docker container..."
                                docker run --rm ${DOCKER_IMAGE}:latest python3 test_app.py
                                
                                echo ""
                                echo "Testing Docker health check..."
                                docker run --rm ${DOCKER_IMAGE}:latest python3 -c "import app; print('Docker health check passed!')"
                            """
                        }
                        echo '✅ Docker image testing completed successfully!'
                    }
                }
            }
        }
        
        stage('📊 Generate Reports') {
            steps {
                echo '📊 Generating build reports...'
                script {
                    sh '''
                        echo "=== BUILD REPORT ===" > build-report.txt
                        echo "Build Number: ${BUILD_NUMBER}" >> build-report.txt
                        echo "Build Date: $(date)" >> build-report.txt
                        echo "Python Version: $(python3 --version)" >> build-report.txt
                        echo "Docker Image: ${DOCKER_IMAGE}:${BUILD_VERSION}" >> build-report.txt
                        echo "Git Commit: $(git rev-parse HEAD 2>/dev/null || echo 'N/A')" >> build-report.txt
                        echo "Workspace: ${WORKSPACE}" >> build-report.txt
                        echo "=== END REPORT ===" >> build-report.txt
                        
                        echo "Build report generated:"
                        cat build-report.txt
                    '''
                }
                echo '✅ Build reports generated successfully!'
            }
            post {
                always {
                    archiveArtifacts artifacts: 'build-report.txt', fingerprint: true
                }
            }
        }
    }
    
    post {
        always {
            echo '🏁 Pipeline execution completed!'
            echo '🧹 Performing cleanup operations...'
            
            script {
                sh '''
                    echo "Current Docker images:"
                    docker images | grep ${DOCKER_IMAGE} || true
                    
                    echo "Cleaning up old Docker images (keeping last 5)..."
                    docker images ${DOCKER_IMAGE} --format "{{.Tag}}" | grep -E "^[0-9]+$" | sort -nr | tail -n +6 | xargs -r docker rmi ${DOCKER_IMAGE}: || true
                '''
            }
            
            cleanWs()
            
            echo '=' * 60
            echo '🏁 Jenkins Pipeline Execution Summary:'
            echo "   → Status: ${currentBuild.currentResult}"
            echo "   → Duration: ${currentBuild.durationString}"
            echo "   → Build: #${BUILD_NUMBER}"
            echo '=' * 60
        }
        
        success {
            echo '🎉 PIPELINE COMPLETED SUCCESSFULLY! 🎉'
            echo '✅ All stages passed without errors'
            echo '🚀 Application is ready for deployment!'
        }
        
        failure {
            echo '❌ PIPELINE FAILED!'
            echo '🔍 Please check the console output for error details'
            echo '🛠️  Fix the issues and retry the build'
        }
        
        unstable {
            echo '⚠️  PIPELINE UNSTABLE'
            echo '📊 Some tests may have failed or there are warnings'
        }
    }
}
EOF

echo "📚 Creating README.md documentation..."
cat > README.md << 'EOF'
# 🐍 Python Jenkins CI/CD Demo Project

A complete demonstration project showcasing Jenkins CI/CD pipeline with Python application and Docker containerization.

## 📋 Project Overview

This project demonstrates a complete CI/CD workflow using:
- **Python 3.11** application with mathematical operations
- **Unit testing** with comprehensive test coverage
- **Docker** containerization for consistent deployments
- **Jenkins** pipeline for automated CI/CD
- **Git** version control integration

## 🏗️ Project Structure

```
jenkins-python-demo/
├── app.py              # Main Python application
├── test_app.py         # Comprehensive unit tests
├── Dockerfile          # Docker image configuration
├── .dockerignore       # Docker build exclusions
├── Jenkinsfile         # Jenkins pipeline definition
└── README.md           # This documentation
```

## 🚀 Quick Start

1. **Test locally:**
   ```bash
   python3 app.py
   python3 test_app.py
   ```

2. **Build Docker image:**
   ```bash
   docker build -t python-jenkins-demo .
   docker run --rm python-jenkins-demo
   ```

3. **Setup Jenkins pipeline:**
   - Create new Pipeline project
   - Point to this repository
   - Use `Jenkinsfile` for pipeline definition

## 📊 Pipeline Stages

1. **Initialize** - Setup and information display
2. **Checkout** - Code retrieval from Git
3. **Setup Python** - Environment verification
4. **Install Dependencies** - Package management
5. **Code Quality Check** - Syntax and import validation
6. **Run Unit Tests** - Comprehensive testing
7. **Run Application** - Application execution
8. **Docker Operations** - Build and test Docker image
9. **Generate Reports** - Build documentation

## 🛠️ Requirements

- Python 3.11+
- Docker 20.10+
- Jenkins 2.400+
- Git 2.30+

## 📝 License

MIT License - see LICENSE file for details.
EOF

echo "🔧 Creating .gitignore file..."
cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# Virtual environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# IDEs
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
*.log

# Testing
.coverage
.pytest_cache/
.tox/
.nox/
htmlcov/
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/

# Jenkins
build-report.txt

# Temporary files
*.tmp
*.bak
EOF

echo "✅ Running local tests to verify setup..."
echo "🧪 Testing Python application..."
python3 app.py

echo ""
echo "🧪 Running unit tests..."
python3 test_app.py

echo ""
echo "🐳 Building Docker image for testing..."
docker build -t python-jenkins-demo:test . > /dev/null 2>&1

echo "🐳 Testing Docker container..."
docker run --rm python-jenkins-demo:test > /dev/null 2>&1

echo ""
echo "🎉 LOCAL SETUP VERIFICATION COMPLETED!"
echo "=" * 60
echo "📁 Project structure created:"
ls -la

echo ""
echo "📋 Next Steps:"
echo "1. Initialize Git repository:"
echo "   git init"
echo "   git add ."
echo "   git commit -m 'Initial commit: Complete Jenkins CI/CD project'"
echo ""
echo "2. Push to your Git repository:"
echo "   git remote add origin https://github.com/yourusername/jenkins-python-demo.git"
echo "   git push -u origin main"
echo ""
echo "3. Setup Jenkins pipeline:"
echo "   - Create new Pipeline project in Jenkins"
echo "   - Configure SCM to point to your Git repository"
echo "   - Use 'Jenkinsfile' for pipeline definition"
echo ""
echo "4. Run the pipeline:"
echo "   - Click 'Build Now' in Jenkins"
echo "   - Monitor the pipeline stages"
echo "   - Check console output for detailed logs"
echo ""
echo "🚀 Your complete Jenkins CI/CD project is ready!"
echo "=" * 60
EOF

# Make the setup script executable
chmod +x setup.sh

echo "✅ Complete project setup script created!"
echo ""
echo "📋 To use this script:"
echo "1. Save it as 'setup.sh'"
echo "2. Make it executable: chmod +x setup.sh"
echo "3. Run it: ./setup.sh"
echo ""
echo "🎯 The script will create the complete project with all files!"