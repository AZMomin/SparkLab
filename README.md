# Jupyter Lab & Spark - Docker Environment

Dockerfile config for quickly spinning up a Spark environment with Jupyter Lab

## Installed Dependencies
* JDK 8
* Scala 2.12.7
* Python 3.6
* Pip 3.6
* Spark 2.4.0
* Jupyter Lab


## Build
`docker build -t IMAGE_NAME .`

## Run 
`docker run -p 8888:8888 IMAGE_NAME`


## Easy Setup
Does not require cloning repo.

`docker run -p 8888:8888 amomin/sparklab`
