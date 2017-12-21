FROM lambci/lambda:build-nodejs6.10
LABEL maintainer=github.com/totomz

RUN echo "//registry.npmjs.org/:_authToken=\${NPM_TOKEN}" > ~/.npmrc
