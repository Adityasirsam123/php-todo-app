#!/bin/bash

# jenkins.sh - Install Jenkins on Ubuntu

set -e  # Exit immediately if a command exits with a non-zero status.

echo "🔧 Step 1: Updating the System..."
sudo apt update && sudo apt upgrade -y

echo "⚙️ Step 2: Installing Java (Required for Jenkins & SonarQube)..."
sudo apt install openjdk-17-jdk -y
java -version

echo "🛠️ Step 3: Installing Jenkins..."

# Add Jenkins GPG key and repo
echo "➡️ Adding Jenkins GPG key and repository..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
echo "📦 Installing Jenkins package..."
sudo apt update
sudo apt install jenkins -y

# Start and enable Jenkins
echo "🚀 Starting and Enabling Jenkins..."
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
