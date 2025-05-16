# 🚀 Jenkins + SonarQube + Trivy Setup on Ubuntu EC2

This guide provides step-by-step instructions to set up **Jenkins**, **SonarQube**, and **Trivy** on a single **Ubuntu EC2 instance**.

---

## 🖥️ Prerequisites

- An EC2 instance running **Ubuntu 20.04+**
- At least **t3.medium** (2 vCPU, 4 GB RAM) or higher
- Port 8080, 9000, and 8081 open in the Security Group
- `sudo` privileges

---

## 🔧 Step 1: Update the System

```bash
sudo apt update && sudo apt upgrade -y

⚙️ Step 2: Install Java (Required for Jenkins & SonarQube)

```bash
sudo apt install openjdk-17-jdk -y
java -version

🛠️ Step 3: Install Jenkins
1. Add Jenkins GPG key and repo:
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

2. Install Jenkins:

sudo apt update
sudo apt install jenkins -y

3. Start Jenkins:

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

🧪 Step 4: Install SonarQube
⚠️ Requires at least 4 GB RAM.

sudo useradd -m -d /opt/sonarqube -s /bin/bash sonar

1. Create a user:
bash

sudo useradd -m -d /opt/sonarqube -s /bin/bash sonar
2. Install dependencies:

sudo apt install unzip wget -y
3. Download and set up SonarQube:

cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.4.1.88267.zip
sudo unzip sonarqube-*.zip
sudo mv sonarqube-* sonarqube
sudo chown -R sonar:sonar /opt/sonarqube

4. Start SonarQube:


sudo su - sonar
cd /opt/sonarqube/bin/linux-x86-64
./sonar.sh start
Access SonarQube at: http://<EC2-Public-IP>:9000
Default login: admin / admin

🔍 Step 5: Install Trivy (Security Scanner)

sudo apt install wget apt-transport-https gnupg lsb-release -y

wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | \
  sudo tee -a /etc/apt/sources.list.d/trivy.list

sudo apt update
sudo apt install trivy -y
✅ Verify Trivy:

trivy --version
Example Trivy Scan:

trivy fs /etc
