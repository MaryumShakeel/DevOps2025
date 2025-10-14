Project Title
AI-Driven Drone Delivery System

Group Member
Tabinda Hassan (46374)

How to build the image
docker build -t app-image:v2 .

How to run the container
docker run -p 3000:3000 app-image:v2

Commit and push to github
git add Dockerfile README.md
git commit -m "Added Dockerfile and instructions for DEVOPS Deliverable 2"
git push

Description of our CI/CD pipeline
This project uses GitHub Actions to build and push a Docker image automatically when code is pushed to the main branch.

Instructions to run and deploy app
docker build -t myapp . 
and docker run -p 3000:3000 myapp (3000  Development (React default port))
docker run -p 80:80 myapp  (80  Production (HTTP standard port for browser access))

Changelog section
Updated Dockerfile and CI/CD workflow on Oct 14, 2025.

<<<<<<< HEAD















# MyApp – Docker Containerization
# (updated timestamp for GitHub)
=======
## 🎥 Project Demo  From MAryum Side
Watch the full demo video here: [Click to Watch](https://drive.google.com/file/d/1bw7VUaA2qcQylTJXBVppbmZvl7OpUE0v/view?usp=sharing)

>>>>>>> f0163e3 (Updated README file with video link and CI/CD details)
