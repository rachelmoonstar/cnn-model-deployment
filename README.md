# MLOps: CNN Model Deployment

The model API is currently deployed on: https://rachel-model-api-7w6n2246cq-uk.a.run.app/. 

To check out Swagger UI and test out model predictions with images, visit: https://rachel-model-api-7w6n2246cq-uk.a.run.app/docs.


## ML Model
This image classification CNN model is trained with [CIFAR-100 dataset](https://www.cs.toronto.edu/~kriz/cifar.html) and uses transfer learning to adopt convolutional layers from ResNet-50 model. More information on the trained model can be found in: `cnn_model_training.ipynb` and `cnn_model_prediction.ipynb`.

## Deployment
The model's predictions are served as an API with FastAPI framework, in `main.py`. The backend ML model server has been dockerized, pushed to GCR (Google Container Registry) and deployed to GCP (Google Cloud Platform). Files that are relevant to Docker container deployment are `Dockerfile`,`docker_run.sh`, and `boot.sh`.

## Tutorial
### 1. How to build and run Docker container in local computer

1. Navigate to the app directory and type: `./docker_run.sh`. This bash script will:
    1. stop currently running Docker container if it already exists
    2. build new Docker image using Dockerfile
    3. create and run a Docker container using the built Docker image.

2. To check whether Docker container is running properly (and to find out the name of the running container), type `docker ps`. If you see any error status, type `docker logs <NAME>` to fetch logs for the container. To inspect the insides of currently running container (aka navigate Docker container instance with CLI), type `docker exec -it <NAME> /bin/bash`.

3. Visit `localhost:8000` to test your application running on your local computer!

4. To stop the Docker container, type `docker stop <NAME>`. 

5. When you are finished with testing Docker containers locally, make sure to remove unused containers and images by typing `docker system prune`. These unused containers and images will take up lots of space if they are not removed.




### 2. How to deploy Docker container to GCP

1. First we need to build our Docker container image using Cloud Build and register to GCR. In the local terminal, navigate to the app directory and run: `gcloud builds submit --tag gcr.io/<PROJECT_ID>/<container-name>`

2. Let's now deploy the Docker container image on the cloud. Run: `gcloud run deploy --image gcr.io/<PROJECT-ID>/<container-name> --platform managed`. 
You will then be prompted to enter service name, region, and allow for unauthentications invocations. Press `y` to allow public access to the URL. You will get a URL to your ML application running on the cloud!


## References
- Deploy Docker Container to GCP - https://towardsdatascience.com/deploy-a-dockerized-fastapi-app-to-google-cloud-platform-24f72266c7ef
