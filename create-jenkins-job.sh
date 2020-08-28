#!/bin/bash
source properties.env
source secrets.env || echo Error: missing secrets.env. Please create this file and try again.

JOB_CONFIG=`cat "./templates/default-jenkins-job.xml" | \
        sed -e "s#{{ GIT_URL }}#$2#g" \
        -e "s#{{ GIT_BRANCH }}#$GIT_BRANCH#g" \
        -e "s#{{ SCRIPT_PREFIX }}#$SCRIPT_PREFIX#g"`

echo "$JOB_CONFIG" > job-config.xml

java -jar $JENKINS_CLI_PATH -s $JENKINS_URL \
-auth $J_USERNAME:$J_TOKEN \
create-job $1 < ./job-config.xml
