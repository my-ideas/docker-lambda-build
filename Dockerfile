FROM lambci/lambda:build-nodejs12.x
LABEL maintainer=github.com/totomz

ARG GITHASH

RUN echo "@porketta:registry=http://npm.my-ideas.it/repository/porketta/" >> ~/.npmrc	
RUN echo "@my-ideas:registry=http://npm.my-ideas.it/repository/my-ideas/" >> ~/.npmrc	
RUN echo "//npm.my-ideas.it/repository/porketta/:_authToken=\${NPM_TOKEN}" >> ~/.npmrc	
RUN echo "//npm.my-ideas.it/repository/my-ideas/:_authToken=\${NPM_TOKEN}" >> ~/.npmrc	

RUN echo "https://github.com/my-ideas/docker-lambda-build/commit/$GITHASH" >> ~/__image_version

# Update aws cli
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Copy scripts
WORKDIR /usr/local/bin
COPY semver ./
COPY turbodeploy ./
COPY jq ./
COPY semver_update ./
COPY checkstack ./

# Install terraform
RUN curl https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip --output terraform.zip && \
    unzip terraform.zip && \
    chmod +x terraform && \
    rm terraform.zip

WORKDIR /var/task
