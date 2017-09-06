# instance file
# it contains the aws instance details
#
# Raffaele Talarico
# 29/08/2017

# for further details about aws_instance available arguments 
# check out https://www.terraform.io/docs/providers/aws/r/instance.html
# for further details about Dynatrace Managed installation params 
# check out https://help.dynatrace.com/dynatrace-managed/dynatrace-server/can-i-install-dynatrace-server-using-custom-parameters/

resource "aws_instance" "dynatracemanagednode" {
	
	#enter the key pair name of the key pair you've previously created on AWS - the value is defined in the vars file 
	key_name = "${var.AWS_KEYPAIR_NAME}"

	#ami ID and instance type are defined in the vars file 
  	ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  	instance_type = "${lookup(var.AWS_INSTANCE_TYPE, var.DYNATRACE_SIZING)}"
	
	#EC2 instance root volume size
	root_block_device {
	#choose the volume size you'd like to assign to the root volume
        volume_size = 20
    }

	#specify a tag (optional) for the EC2 instance
	tags {
    	  DynatraceManagedNode = "SpinnedUpin5Minutes"
  	}
	
	#remote-exec block
	#these are the automation commands executed after the creation of the EC2 instance directly on the host
	#it basically downloads the Dynatrace Managed version from the Download URL defined in vars file
	#it executes the installation script using the --install-silent mode, passing the license key and the initial setup params defined
	#in the vars file 
	
	provisioner "remote-exec" {
    		inline = [
      			"sudo wget -O /tmp/dynatrace-managed.sh ${var.DYNATRACE_DOWNLOAD_URL}",
      			"cd /tmp/",
				"sudo /bin/sh dynatrace-managed.sh --install-silent --license ${var.DYNATRACE_LICENSE_KEY} --initial-environment ${var.DYNATRACE_INIT_ENV} --initial-first-name ${var.DYNATRACE_INIT_NAME} --initial-last-name ${var.DYNATRACE_INIT_LASTNAME} --initial-email ${var.DYNATRACE_INIT_EMAIL} --initial-pass ${var.DYNATRACE_INIT_PWD}"
    		]
	#the connection block defines the connection params to ssh into the newly created EC2 instance 
			connection {
				type = "ssh"
				user = "ubuntu"
				private_key = "${file(var.AWS_PRIVATE_KEY)}"
				timeout = "2m"
				agent = false
			}
  	}
}
