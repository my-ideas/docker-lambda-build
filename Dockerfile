FROM lambci/lambda:build-nodejs8.10
LABEL maintainer=github.com/totomz

# Copy scripts
WORKDIR /usr/local/bin
COPY semver ./
COPY turbodeploy ./
COPY jq ./
COPY semver_update ./
COPY checkstack ./
COPY .npmrc ~/.npmrc
WORKDIR /var/task
