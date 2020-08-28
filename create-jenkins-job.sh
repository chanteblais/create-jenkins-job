#!/bin/bash
source properties.env
source secrets-exp.env || echo Error: missing secrets.env. Please create this file and try again.

if [[ $3 == 'gaia' ]]; then
  echo "Creating project in Gaia"
  source /Users/chanteblais/GitHub_Projects/create-jenkins-job/secrets-gaia.env || echo Error: missing secrets.env. Please create this file and try again.
else
  echo "Creating project in Exp"
  source /Users/chanteblais/GitHub_Projects/create-jenkins-job/secrets.env || echo Error: missing secrets.env. Please create this file and try again.
fi

source /Users/chanteblais/GitHub_Projects/create-jenkins-job/properties.env

JOB_CONFIG=`cat "/Users/chanteblais/GitHub_Projects/create-jenkins-job/templates/default-jenkins-job.xml" | \
        sed -e "s#{{ GIT_URL }}#$2#g" \
        -e "s#{{ GIT_BRANCH }}#$GIT_BRANCH#g" \
        -e "s#{{ SCRIPT_PREFIX }}#$SCRIPT_PREFIX#g"`

echo "$JOB_CONFIG" > job-config.xml
echo $GIT_URL

java -jar $JENKINS_CLI_PATH -s $JENKINS_URL \
-auth $J_USERNAME:$J_TOKEN \
create-job $1 < ./job-config.xml
