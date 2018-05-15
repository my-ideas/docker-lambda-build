# docker-lambda-build
Build you AWS Lambda cpode with dependencies valid at runtime using private npm repo!

# Usage
Install node dependencies that will work in AWS Lambda:
```bash
docker run -it -v "$PWD":/var/task -e NPM_TOKEN=$(cat ~/.npmrc | awk -F= '{print $2}') myideas/lambda-build npm install
```

* NPM_TOKEN is the token to access your private repo


# Additional tools
These tools are included in this image to be used in the build environment, eg in Bitbucket Pipeline

* turbodeploy to deploy to AWS
* semver_update can be called before npm publish to automatically increment the fix number of the package semver version  