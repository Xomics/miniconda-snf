# Docker container for running Similarity Network Fusion [(Wang et al, 2014)](https://doi.org/10.1038/nmeth.2810)


## Pull Docker image
```{bash}
docker pull casperdevisser/miniconda-snf:v0.8 #latest
```

## Build Docker image 

```{bash}
# Dockerfile VERSION = v0.8
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t casperdevisser/miniconda-snf:$VERSION . 
```