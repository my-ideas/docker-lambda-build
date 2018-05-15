FROM lambci/lambda:build-nodejs8.10
LABEL maintainer=github.com/totomz

RUN echo "//registry.npmjs.org/:_authToken=\${NPM_TOKEN}" > ~/.npmrc


# Copy scripts
WORKDIR /usr/local/bin
COPY semver ./
COPY turbodeploy ./
COPY jq ./
COPY semver_update ./

WORKDIR /var/task
