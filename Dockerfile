FROM mcr.microsoft.com/dotnet/sdk:6.0

ENV NODE_VERSION 18.18.0
SHELL ["/bin/bash", "-l", "-c"]

RUN apt-get update && \
    apt install -y curl && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
    source ~/.bashrc
RUN nvm install $NODE_VERSION

#Adding the directories whic we'll want to use
RUN mkdir /Project && mkdir /Project/browser && mkdir /Project/desktop
EXPOSE 8080/tcp
EXPOSE 8080/udp
ENTRYPOINT cd /Project/browser && npm ci && npm start
