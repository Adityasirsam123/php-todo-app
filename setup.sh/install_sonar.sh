#!/bin/bash

# SonarQube Install Script for Ubuntu EC2
# Tested on Ubuntu 20.04/22.04

set -e

echo "🔧 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing required packages..."
sudo apt install -y openjdk-17-jdk wget unzip

echo "👤 Creating Sonar user..."
sudo useradd -m -d /opt/sonarqube -s /bin/bash sonar || true

echo "⬇️ Downloading SonarQube..."
cd /opt
SONAR_VERSION="10.4.1.88267"
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONAR_VERSION}.zip

echo "📦 Extracting SonarQube..."
sudo unzip sonarqube-${SONAR_VERSION}.zip
sudo mv sonarqube-${SONAR_VERSION} sonarqube
sudo chown -R sonar:sonar /opt/sonarqube

echo "🚀 Setting up systemd service..."
cat <<EOF | sudo tee /etc/systemd/system/sonarqube.service
[Unit]
Description=SonarQube service
After=network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

echo "🔄 Reloading systemd and enabling service..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable sonarqube
sudo systemctl start sonarqube

echo "✅ SonarQube installation complete!"
echo "🌐 Access it at: http://<your-ec2-public-ip>:9000"
