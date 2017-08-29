# provider file
# it contains the aws credentials and region details, provided separately in the variables file
#
# Raffaele Talarico
# 29/08/2017


# instead of using static access and secret key variables
# you can also use a shared credentials file
#   shared_credentials_file = "/Users/myUser/.aws/credentials"
#   profile                 = "myAwsProfile"
#
# further details here:
# https://www.terraform.io/docs/providers/aws/index.html

provider "aws" {
	access_key = "${var.AWS_ACCESS_KEY}"
	secret_key = "${var.AWS_SECRET_KEY}"
	region = "${var.AWS_REGION}"
}