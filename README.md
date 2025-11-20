Project Title
AI-Driven Drone Delivery System

Group Members:
Tabinda Hassan (46374)
Maryum Shakeel (48406)



CI/CD Pipeline Description:
This repository implements a CI/CD pipeline using "GitHub Actions".  
The workflow automatically builds a Docker image whenever code is pushed or merged into the main branch.  
The image is then pushed to "Docker Hub" under the repository `tabindahassan/my-app`.

Steps in Pipeline:
1.Build: Builds Docker image using the Dockerfile.  
2. Push: Publishes the image to DockerHub.  
3. Deploy: Image becomes available for pull and deployment to any environment.

Instructions to Run Locally:
1. Clone the repository  
2. Run `docker build -t my-app .`  
3. Run `docker run -p 3000:3000 my-app`  
4. Open `http://localhost:3000`

Changelog:
| Date | Update |
|------|---------|
| Oct 10, 2025 | Added CI/CD GitHub Actions workflow |
| Oct 10, 2025 | Automated DockerHub push setup |
