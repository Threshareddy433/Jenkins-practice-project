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
├── README.md           # This documentation
└── requirements.txt    # Python dependencies (if needed)
```

## 🚀 Features

### Python Application (`app.py`)
- Mathematical operations (add, multiply, divide)
- Factorial calculation
- Prime number checking
- User greeting functionality
- Comprehensive error handling

### Unit Tests (`test_app.py`)
- Test mathematical operations
- Test edge cases and error conditions
- Integration testing
- Boundary condition testing
- 100% function coverage

### Docker Support
- Multi-stage Docker build
- Non-root user for security
- Health checks
- Optimized image size
- Production-ready configuration

### Jenkins Pipeline
- **9 comprehensive stages**:
  1. Initialize - Setup and info display
  2. Checkout - Code retrieval
  3. Setup Python - Environment verification
  4. Install Dependencies - Package management
  5. Code Quality Check - Syntax and import validation
  6. Run Unit Tests - Comprehensive testing
  7. Run Application - Application execution
  8. Docker Operations - Build, test, and scan
  9. Generate Reports - Build documentation

## 🛠️ Prerequisites

### System Requirements
- **Linux/Ubuntu** (recommended)
- **Python 3.11+**
- **Docker 20.10+**
- **Jenkins 2.400+**
- **Git 2.30+**

### Jenkins Plugins (Required)
- Pipeline plugin
- Git plugin
- Docker Pipeline plugin
- Workspace Cleanup plugin

## 📦 Installation & Setup

### 1. Install Jenkins and Docker

```bash
# Update system
sudo apt update

# Install Java (required for Jenkins)
sudo apt install openjdk-11-jdk -y

# Add Jenkins repository
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt update
sudo apt install jenkins -y

# Install Docker
sudo apt install docker.io -y

# Start services
sudo systemctl start jenkins docker
sudo systemctl enable jenkins docker

# Add jenkins user to docker group
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

### 2. Clone and Setup Project

```bash
# Clone the project
git clone https://github.com/yourusername/jenkins-python-demo.git
cd jenkins-python-demo

# Test locally
python3 app.py
python3 test_app.py

# Build Docker image
docker build -t python-jenkins-demo:test .
docker run --rm python-jenkins-demo:test
```

### 3. Configure Jenkins

1. **Access Jenkins**: Open `http://localhost:8080`
2. **Get initial password**: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
3. **Install suggested plugins**
4. **Create admin user**

### 4. Create Jenkins Pipeline

1. **New Item** → Enter name: `python-jenkins-demo`
2. **Select**: Pipeline
3. **Pipeline Configuration**:
   - Definition: `Pipeline script from SCM`
   - SCM: `Git`
   - Repository URL: `your-git-repo-url`
   - Branch: `*/main`
   - Script Path: `Jenkinsfile`
4. **Save** and **Build Now**

## 🎯 Usage

### Running Locally

```bash
# Run the application
python3 app.py

# Run tests
python3 test_app.py

# Run with Docker
docker build -t python-jenkins-demo .
docker run --rm python-jenkins-demo
```

### Jenkins Pipeline Execution

1. **Trigger Build**: Click "Build Now" in Jenkins
2. **Monitor Progress**: Watch pipeline stages
3. **View Logs**: Click build number → "Console Output"
4. **Check Results**: Review stage outcomes

### Expected Output

```
============================================================
🐍 Python Application - Jenkins CI/CD Demo
============================================================
📊 Mathematical Operations:
   Addition: 10 + 5 = 15
   Multiplication: 10 × 5 = 50
   Division: 10 ÷ 5 = 2.0
   Factorial: 5! = 120
   Prime numbers in [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]: [2, 3, 5, 7, 11]

🎉 Hello, Jenkins User! Welcome to our Jenkins CI/CD pipeline!

📋 Application Information:
   Version: 1.0.0
   Environment: Production
   Status: ✅ All systems operational

✅ Application executed successfully!
============================================================
```

## 🧪 Testing

### Test Coverage
- **Mathematical Operations**: Addition, multiplication, division
- **Advanced Functions**: Factorial, prime checking
- **Utility Functions**: User greeting
- **Error Handling**: Division by zero, negative factorials
- **Edge Cases**: Boundary conditions
- **Integration Tests**: Function combinations

### Running Tests

```bash
# Standard test run
python3 test_app.py

# Verbose test output
python3 -m unittest test_app.py -v

# In Docker container
docker run --rm python-jenkins-demo python3 test_app.py
```

## 🐳 Docker

### Building Images

```bash
# Build with tag
docker build -t python-jenkins-demo:1.0.0 .

# Build latest
docker build -t python-jenkins-demo:latest .
```

### Running Containers

```bash
# Run application
docker run --rm python-jenkins-demo:latest

# Run tests
docker run --rm python-jenkins-demo:latest python3 test_app.py

# Interactive shell
docker run -it python-jenkins-demo:latest bash
```

### Image Details
- **Base Image**: python:3.11-slim
- **Size**: ~50MB (optimized)
- **Security**: Non-root user
- **Health Checks**: Included
- **Multi-arch**: x86_64 support

## 📊 Pipeline Stages Explained

| Stage | Purpose | Duration |
|-------|---------|----------|
| Initialize | Setup and information display | ~10s |
| Checkout | Code retrieval from Git | ~15s |
| Setup Python | Environment verification | ~20s |
| Install Dependencies | Package management | ~30s |
| Code Quality Check | Syntax and import validation | ~15s |
| Run Unit Tests | Comprehensive testing | ~25s |
| Run Application | Application execution | ~10s |
| Docker Operations | Build, test, and scan | ~60s |
| Generate Reports | Build documentation | ~10s |

**Total Pipeline Duration**: ~3-5 minutes

## 🔧 Customization

### Adding Dependencies

Create `requirements.txt`:
```txt
requests==2.31.0
pytest==7.4.0
flask==2.3.3
```

Update Dockerfile:
```dockerfile
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
```

### Environment Variables

Add to Jenkinsfile:
```groovy
environment {
    APP_ENV = 'production'
    DEBUG_MODE = 'false'
    LOG_LEVEL = 'INFO'
}
```

### Notifications

Add email notifications:
```groovy
post {
    success {
        emailext (
            subject: "✅ Build Success: ${env.JOB_NAME} - #${env.BUILD_NUMBER}",
            body: "Pipeline completed successfully!",
            to: "team@company.com"
        )
    }
}
```

## 🛡️ Security Best Practices

- ✅ Non-root Docker user
- ✅ Minimal base image
- ✅ No secrets in code
- ✅ Input validation
- ✅ Error handling
- ✅ Health checks
- ✅ Clean workspace

## 🚨 Troubleshooting

### Common Issues

**1. Docker Permission Denied**
```bash
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

**2. Python Module Not Found**
```bash
# Check Python path
python3 -c "import sys; print(sys.path)"
```

**3. Jenkins Build Fails**
- Check console output
- Verify Git repository access
- Ensure Docker is running
- Check file permissions

**4. Docker Build Fails**
- Verify Dockerfile syntax
- Check .dockerignore
- Ensure sufficient disk space

### Logs and Debugging

```bash
# Jenkins logs
sudo tail -f /var/log/jenkins/jenkins.log

# Docker logs
docker logs <container_id>

# System logs
sudo journalctl -u jenkins -f
```

## 📈 Performance Optimization

### Jenkins
- Use parallel stages
- Optimize Docker layer caching
- Clean old builds automatically
- Use Jenkins agents for scaling

### Docker
- Multi-stage builds
- Layer optimization
- .dockerignore optimization
- Image size monitoring

## 🤝 Contributing

1. **Fork** the repository
2. **Create** feature branch (`git checkout -b feature/new-feature`)
3. **Commit** changes (`git commit -am 'Add new feature'`)
4. **Push** to branch (`git push origin feature/new-feature`)
5. **Create** Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙋‍♂️ Support

For questions and support:
- **GitHub Issues**: Create an issue for bugs or feature requests
- **Documentation**: Check this README for common solutions
- **Jenkins Documentation**: https://www.jenkins.io/doc/
- **Docker Documentation**: https://docs.docker.com/

## 🎉 Acknowledgments

- Jenkins community for excellent CI/CD tools
- Docker for containerization platform
- Python community for the amazing ecosystem
- Open source contributors

---

**Happy Coding! 🚀**