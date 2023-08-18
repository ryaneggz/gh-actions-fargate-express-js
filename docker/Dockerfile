FROM ubuntu:20.04

# Prevent tzdata from prompting for timezone
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Chicago

# Install required packages
RUN apt-get update && \
    apt-get install -y curl sudo git jq libicu-dev && \
    apt-get clean && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Add runner user
RUN useradd -m runner && \
    usermod -aG sudo runner && \
    echo 'runner:runner' | chpasswd

# Setup entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER runner
WORKDIR /home/runner

ENTRYPOINT ["/entrypoint.sh"]
