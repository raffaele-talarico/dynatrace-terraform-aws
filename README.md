# Spin up your Dynatrace Managed node in 5 minutes using Terraform and AWS

This project allows you to quickly spin up your Dynatrace Managed instance on AWS using the IAC tool Terraform. If you're new to Terraform
please take a look first at the official page:
https://www.terraform.io/
or if you're new to Dynatrace (I hope you're not :-) ) please take a look at the official website and documentation pages:
https://www.dynatrace.com and https://help.dynatrace.com/dynatrace-managed/

The requirements for this project are:
- AWS account (please note that you will incur in expenses, everything reported here is not free tier eligible)
- Dynatrace Managed email with download link and license key (you can ask a trial here: https://www.dynatrace.com/trial/managed/)
- Linux box with Terraform
  - for my tests I've used the Vagrant box I've created https://app.vagrantup.com/rtalarico/boxes/raff-box
  - an Ubuntu 17.04 Zesty Zapus with Terraform 0.9.11 installed 
- Have fun using IAC!

The Terraform files created to automate the Dynatrace Managed node set up are:
- provider.tf
  - it basically contains the details to access your AWS environment
- vars.tf
  - it contains every single variable used in both provider and instance files
- instance.tf
  - it contains the AWS instance details and the Dynatrace Managed installation automation steps 
  
Should you have any question feel free to contact me at raffaele.talarico [at] dynatrace.com 
