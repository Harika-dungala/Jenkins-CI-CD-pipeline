# Jenkins-CI-CD-pipeline
Jenkins CI/CD Pipeline Setup (Command Steps)
1. Repository Setup
git clone <your-repo-url>
cd jenkins-cicd-pipeline


Add Jenkinsfile in the repo for pipeline stages (checkout, build, test, deploy).

Create Dockerfile to containerize the application.

# 2. Jenkins Setup

Install Jenkins locally.

Create a Pipeline Job.

Enable Build Triggers → GitHub hook trigger for GITScm polling.

# 3. Expose Jenkins via Ngrok
ngrok http 8080


Copy the public URL (e.g., https://hopeless-finley-maliciously.ngrok-free.dev).

Use this URL for GitHub webhook.

# 4. GitHub Webhook Setup

Add a webhook in GitHub repository:

Payload URL: Ngrok public URL + /github-webhook/

Content type: application/json

Event: Push only

# 5. Git Workflow
# Pull latest changes from GitHub
git pull origin main --rebase

# Edit or add files
echo "Testing Jenkins trigger" >> README.md

# Stage and commit changes
git add README.md
git commit -m "Add test line to trigger Jenkins"

# Push changes to GitHub
git push


Pushing triggers Jenkins automatically via webhook.

# 6. Verify Jenkins Pipeline

Open Jenkins → Dashboard → pipeline job

Check Build History → new build should start automatically

Console Output shows stages:

Checkout

Build Docker image

Run tests

Deploy container

Verify deployment:

Local: http://localhost:5000

Ngrok: https://hopeless-finley-maliciously.ngrok-free.dev

# 7. Optional Webhook Test
curl -H "Content-Type: application/json" \
     --data '{"ref":"refs/heads/main","repository":{"full_name":"<your-username>/<repo-name>"}}' \
     https://hopeless-finley-maliciously.ngrok-free.dev/github-webhook/


Use this if the webhook does not trigger automatically.

# 8. Outcome

CI/CD pipeline is fully automated.

Every GitHub push triggers build, test, and deploy.

Docker container runs the application locally and is accessible via Ngrok.
