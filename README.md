# complex
This repository contains the application created/provided during the Udemy Docker course.  The app is written in react/node/js.  The app code was provided by the course. The app is not indended for any production deployment. It is intended to teach deployment of a complex app using Docker and Kubernetes.  

Initially the app was deployed on Docker in AWS Elastic Beanstalk. This version of the app deployment is preserved in the tag "docker-compose". The docker-compose.yml files have some useful examples that I'll refer to later.

The app itself, consists of a web frontend that allows the user to enter an index. An API accepts these indices, stores them as a record in postgres, and publishes the index in redis. A backend worker process subscribes to redis. When a new index is published, it calculates the fibonacci number at the given index, and stores it back in redis.  The API will also query Redis and postgres, for all the submitted indices, and the calculated numbers, and return them to the client.
