# CNN Model Deployment



## 1. How to build and run Docker container in local computer



## 2. How to deploy Docker container to GCP

1. First we need to build our Docker container image using Cloud Build and register to GCR (Google Container Registry).
In your local terminal, navigate to the app directory and run: `gcloud builds submit --tag gcr.io/<PROJECT_ID>/<container-name>`

2. Let's now deploy the Docker container image on the cloud. Run: `gcloud run deploy --image gcr.io/<PROJECT-ID>/<container-name> --platform managed`. 
You will then be prompted to enter service name, region, and allow for unauthentications invocations. Press `y` to allow public access to the URL. 


## References
1. Deploy Docker Container to GCP - https://towardsdatascience.com/deploy-a-dockerized-fastapi-app-to-google-cloud-platform-24f72266c7ef