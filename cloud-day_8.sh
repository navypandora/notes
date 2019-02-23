install git
IAM: create a new user, give it full permissions to CodeCommit and IAMsshkeys
add ssh key.pub(generated using ssh-keygen) of your machine to the user for CodeCommit
vim config:
			Host git-codecommit.*.amazonaws.com
			        User AKIAITCIEHAYDHGHE4MA  (access ID from aws)
			        IdentityFile ~/.ssh/codecommitkey (keygen file)
chmod 600 config
ssh (access ID)@git-codecommit.ap-south-1.amazonaws.com

Install AWS CLI: pip install awscli
It is a python module


***Create-repo***
aws codecommit create-repository --repository-name mydemo 
aws codecommit list-repositories
aws codecommit get-repository --repository-name mydemo
aws codecommit batch-get-repositories --repository-names mydemo repo1
aws codecommit update-repository-name --old-name mydemo --new-name changedit
aws codecommit delete-repository --repository-name changedit

***clone,push,pull***
git clone ssh://APKAJKD7Q74ID72PEJZQ@git-codecommit.ap-south-1.amazonaws.com/v1/repos/changedit
the rest of the git commands


***migrate-git-repo***
create new repo in codecommit
git pull (original repo)
push to codecommit
delete repo from local machine


***SNS-Triggers***
Create a topic in SNS
subscribe to topic usng email
go to CodeCommit, go to repo, create trigger(send to amazon SNS)

***lambda-Triggers***
create a lambda function
add lambda permission file 
create role policy for codecommit in lambda basic execution in IAM
go to CodeCommit, go to repo, create trigger(send to amazon lambda)

***setup-codedeploy***
Add permission to a user to give it access to codedeploy
Create a role, giving ec2 the permissions to access s3 buckets
Create a role, giving code the permissions to access other aws services

***configure-ec2-with-codedeploy***
launch amazon linux ami
set IAM role
paste the bash script in the advanced settings:
	#!/bin/bash
	yum update -y
	yum install ruby aws-cli -y
	cd /home/ec2-user
 	aws s3 cp s3://aws-codedeploy-ap-southeast-1/latest/install . --region ap-southeast-1
 	chmod +x install
 	./install auto
add storage

check service is running:
	service codedeploy-agent status


***create/edit/delete-application***
Create an application and deployment group in codedeploy
changing an application's' name is only possible through aws cli
aws deploy update-application --application-name testdeploy --new-application-name testchanged
aws deploy delete-application --application-name testchanged

***adding/editing/deleting-deployment-groups-and-configurations***
aws deploy list-deployment-groups --application-name testchanged
aws deploy update-deployment-groups --application-name testchanged --current-deployment-group-name testgroup --new-deployment-group-name testgroupchanged
aws deploy create-deployment-config --deployment-config-name mycustomconfig --minimum-healthy-hosts type=HOST_COUNT/FLEET_PERCENT,value=1 aws deploy list-deployment-configs
aws deploy list-deployment-configs
aws deploy get-deployment-config  --deployment-config-name CodeDeployDefault.AllAtOnce


***AppSpec-File***
it must be named as appspec.yml
it contains the location and destination, state before, during and after executing the application of the source code.
(github)
***creating-and-uploading-a-revision***
how to push an application to s3:
aws deploy push --application-name testchanged --ignore-hidden-files --s3-location s3://kanishkgodha/app.zip  --source . 
(push source code/zip choosing deploy-configuration from application to s3 bucket)

create new deployment using CodeDeploy (aws console)
aws cli:
copy and paste the response given when we pushed the revision to s3 bucket
then:
aws deploy get-deployment --deployment-id

***monitor-deployments***
SNS-Triggers must be setup pre-deployment
go to codedeploy -> application -> create trigger (Aws console)

***deploy-using-lambda***
create a role allowing lambda to access s3
create a lambda function, trigger it to s3 bucket

***codepipeline***
grant codepipelinefullaccess IAM role to any user you want to create the piepline with.
it's' a simple process, just navigate to aws codepipeline and you'll' get it.
aws codepipeline list-pipelines
aws codepipeline get-pipeline --name <pieplinename>
aws codepipeline get-pipeline-state  --name
aws codepipeline get-pipeline --name <pieplinename> > newfile.json
(this command will autopopulate the json file with the already created pipeline's' structure)
aws codepipeline update-pipeline --cli-input-json file://newfile.json
(upload the edited edited .json structure file to aws)


***create-pipeline-on-aws-using-github-and-jenkins***
make a new role for ec2 with permission "awscodepipelinecustomactionaccess", so that the instance we give it to, will have access to codepipeline
create a new EC2 instance, attach the above role to it
go to advanced settings:
#!/bin/bash
yum update -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
yum install jenkins -y 
yum install gem -y
gem install rake
gem install haml

open the following ports:
22, 80, 8080

ssh into the ec2 server


vim /etc/init.d/jenkins:
	# Source function library.

	. /etc/init.d/functions
	# Custom Path
	export PATH="/usr/local/bin:/usr/bin:$PATH"

systemctl restart jenkins

access jenkins from ec2's' ip using IP:8080
Install following plugins:
AWS CodePipeline Plugin, Rake Plugin

for the next steps refer to cloud-day_8.0.png - cloud-day_8.4.png

***approval-actions***
for the next steps refer to cloud-day_8.5.png