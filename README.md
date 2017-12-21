# docker-lambda-build
Docker container to build nodejs module for AWS Lambda with private npm repo. 

# Usage
```bash
docker run -it -v "$PWD":/var/task -e NPM_TOKEN=${cat ~/.npmrc | awk -F= '{print $2}'} elysiumtech/build-lambda-node610 npm install
```
