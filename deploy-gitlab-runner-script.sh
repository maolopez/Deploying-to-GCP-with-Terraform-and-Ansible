#!/usr/bin

sudo useradd -c ansible -d /home/ansible -s /bin/bash ansible
sudo passwd -d ansible
sudo usermod -aG wheel ansible
sudo su - ansible
sudo yum upgrade -y > /tmp/1-yum.txt
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash > /tmp/2-curl.txt
sudo yum install gitlab-runner -y > /tmp/3-runner.txt
chmod u+w /etc/sudoers
sed -i '$ a gitlab-runner ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
chmod u-w /etc/sudoers
sudo yum install docker -y > /tmp/4-docker.txt
service docker enable
service docker start
groupadd docker
usermod -aG docker ansible
service docker stop
service docker start
gitlab-runner register -n \
  --url https://gitlab.example.com/ \
  --registration-token your-token \
  --executor docker \
  --description "docker-builder" \
  --docker-image "docker:latest" \
  --docker-privileged

VERSION=2.0.0
OS=linux  # or "darwin" for OSX, "windows" for Windows.
ARCH=amd64  # or "386" for 32-bit OSs, "arm64" for ARM 64.
curl -fsSL "https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/download/v${VERSION}/docker-credential-gcr_${OS}_${ARCH}-${VERSION}.tar.gz" \
| tar xz --to-stdout ./docker-credential-gcr \
> /usr/local/bin/docker-credential-gcr && chmod +x /usr/local/bin/docker-credential-gcr
docker-credential-gcr configure-docker > tmp/4-docker-credential.txt

#Your credentials are saved in your user home directory: Linux: $HOME/.docker/config.json
