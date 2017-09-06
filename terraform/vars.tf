# variables file
# contains the aws access credentials, aws amis per region, aws instance type depending on dynatrace managed sizing 
# the Dynatrace init params, download URL and License key received by email 
#
# Raffaele Talarico
# 29/08/2017

#############
# DYNATRACE #
#############

variable "DYNATRACE_DOWNLOAD_URL" {
#replace the URL here with the dynatrace managed download url you received by email. copy the URL contained after wget -O dynatrace-managed.sh 
default ="https://opcsvc.ruxit.com/downloads/installer/get/latest?...."
}

variable "DYNATRACE_LICENSE_KEY"{
#paste here the Dynatrace License Key you find on your Dynatrace Managed installation email 
default = "ReplaceWithYourOwnLicenseKey"
}

variable "DYNATRACE_INIT_ENV"{
#the name of the the Environment that will be created on Dynatrace Managed 
default = "My5MinutesEnvironment"
}

variable "DYNATRACE_INIT_NAME"{
#the name of the Dynatrace Managed Environment owner
default = "YourNameHere"
} 

variable "DYNATRACE_INIT_LASTNAME"{
#the name of the Dynatrace Managed Environment owner
default = "YourLastNameHere"
} 

#the email of the Dynatrace Managed Environment owner
variable "DYNATRACE_INIT_EMAIL"{
default = "YourAwesome@Email.com"
}

#the initial password of Adminuser, it's recommended to change it after the automated installation process has taken place
variable "DYNATRACE_INIT_PWD"{
default = "YourTemporaryAdminPwd"
}

#######
# AWS #
#######

variable "AWS_ACCESS_KEY" {
# here you specify your AWS Access Key of the user you've previously created to grant access on EC2
# you can comment the following lines to be prompted for the aws-access-key after terraform apply
  type = "string"
  default = "YourAccessKeyHere"
}

variable "AWS_SECRET_KEY" {
# here you specify your AWS Access Key of the user you've previously created to grant access on EC2
# you can comment the following lines to be prompted for the aws-secret-key after terraform apply
  type = "string"
  default = "YourSecretKey"
}

variable "AWS_REGION" {
# you can specify here the preferred AWS region
# you can comment the following line to be prompted for the aws-region after terraform apply
	default = "eu-west-1"
}

variable "AWS_KEYPAIR_NAME"{
#enter the key pair name of the key pair you've previously created on AWS
default = "MyAWSKeyName"
}

variable "AWS_PRIVATE_KEY"{
#the local path to the private key .pem file you've downloaded after creating the KeyPair on AWS
#remember this is the local path from which you are executing terraform 
default = "/path/to/file/MyAWSKeyName.pem"
}

#specify the root volume size. default is 20GB
variable "ROOT_VOLUME_SIZE"{
default = 20
}

#here are the Ubuntu AMI IDs already listed for each region 
variable "AMIS"{
# you can comment the following lines to be prompted for the aws-amis
	type = "map"
	default = {
		us-east-2 = "ami-24260641"
		us-east-1 = "ami-cb1d41b0"
		us-west-1 = "ami-629db402"
		us-west-2 = "ami-29716b50"
		ap-south-1 = "ami-27ec9448"
		ap-northeast-2 = "ami-fdb06993"
		ap-southeast-1 = "ami-ba59cbd9"
		ap-southeast-2 = "ami-c8f3ecab"
		ap-northeast-1 = "ami-014ead67"
		ca-central-1 = "ami-4403bc20"
		eu-central-1 = "ami-1bd17d74"
		eu-west-1 = "ami-254ba35c"
		eu-west-2 = "ami-2819084c"
		sa-east-1 = "ami-cb5027a7"	
	}
}

variable "DYNATRACE_SIZING" {
#check the "AWS_INSTANCE_TYPE" values in the next block for the available options
#please keep in mind that even using the trial sizing you will incur in expenses
#you can comment the following line to be prompted for the dynatrace-sizing
	default = "trial"
}

variable "AWS_INSTANCE_TYPE" {
#the available Dynatrace Sizings available are listed here:
#https://help.dynatrace.com/dynatrace-managed/introduction/what-are-the-hardware-and-software-requirements/
#since Dynatrace Managed it's more memory consuming you can opt to choose the memory optimized EC2 instance types
#by specifying trial-memory, small-memory, medium-memory or large-memory
	type = "map"
	default = {
		trial = "m4.xlarge" 
		small = "m4.2xlarge"
		medium = "m4.4xlarge"
		large = "m4.10xlarge"
		trial-memory = "r4.xlarge" 
		small-memory = "r4.2xlarge"
		medium-memory = "r4.4xlarge"
		large-memory = "r4.8xlarge"
	}
}



