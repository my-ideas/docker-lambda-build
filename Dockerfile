FROM lambci/lambda:build-nodejs8.10
LABEL maintainer=github.com/totomz

ARG GITHASH

RUN echo "@porketta:registry=http://npm.my-ideas.it/repository/porketta/" >> ~/.npmrc	
RUN echo "@my-ideas:registry=http://npm.my-ideas.it/repository/my-ideas/" >> ~/.npmrc	
RUN echo "//npm.my-ideas.it/repository/porketta/:_authToken=\${NPM_TOKEN}" >> ~/.npmrc	
RUN echo "//npm.my-ideas.it/repository/my-ideas/:_authToken=\${NPM_TOKEN}" >> ~/.npmrc	

RUN echo "https://github.com/my-ideas/docker-lambda-build/commit/$GITHASH" >> ~/__image_version

# Copy scripts
WORKDIR /usr/local/bin
COPY semver ./
COPY turbodeploy ./
COPY jq ./
COPY semver_update ./
COPY checkstack ./

WORKDIR /var/task
