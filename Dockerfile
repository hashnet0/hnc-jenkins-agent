FROM hnc-base:latest
LABEL name="hnc-jenkins-agent"
LABEL description="HashNet Container for a Jenkins CI Agent (slave)"
LABEL maintainer="hashsploit <hashsploit@protonmail.com>"

ARG PASSWORD=password

ENV PASSWORD $PASSWORD

# Install dependencies
RUN echo "Updating system ..." \
	&& apt-get update >/dev/null 2>&1 \
	&& echo "Installing dependencies ..." \
	&& apt-get install -y \
	git \
	openssh-server \
	openjdk-11-jdk \
	maven \
	>/dev/null 2>&1


# Setup SSH server
RUN echo "Setting up SSH server ..." \
	&& sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
	&& mkdir -p /var/run/sshd \
	>/dev/null 2>&1


# Add jenkins user
RUN adduser --quiet jenkins \
	&& echo "jenkins:$PASSWORD" | chpasswd \
	&& mkdir -p /home/jenkins/.m2


# Copy authorized keys
COPY .ssh/authorized_keys /home/jenkins/.ssh/


# Set up permissions
RUN chown -R jenkins:jenkins /home/jenkins/


# Expose ssh service
EXPOSE 22


# Set image starting point
CMD ["/usr/sbin/sshd", "-D"]

