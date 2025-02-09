provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_instance" "k8-M" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.xlarge"
  key_name      = "PRTKEY"
  tags = {
    Name = "Kmaster"
  }

  // Adding block device mapping for additional storage
  ebs_block_device {
    device_name = "/dev/sda1" // The device name may vary depending on the AMI
    volume_size = 30
    volume_type = "gp2"       // Adjust volume type as per your requirement
  }
}

resource "aws_instance" "k8-S1" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.medium"
  key_name      = "PRTKEY"
  tags = {
    Name = "Kslave"
  }
}
