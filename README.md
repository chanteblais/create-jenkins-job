# create-jenkins-job
This repo is for creating jenkins jobs using the jenkins CLI   

## Requirements
Jenkins CLI Client: https://jenkins-cjd-exp.esgstud.io/jnlpJars/jenkins-cli.jar  
Add the jar to the following directory: ~/JenkinsGlobal/jenkins-cli.jar  
Jenkins API token: https://jenkins-cjd-exp.esgstud.io/me/configure (Requires a jenkins login).  

## Creating a Job  
Rename `secrets-example.env` and add your credentials.  
Update `properties.env` with your job configuration and Jenkins URL.

run ./create-jenkins-job.sh $JOB_NAME
