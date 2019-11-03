data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "template_file" "argo_protected_userdata" {
  template = file("${path.module}/files/userdata.template.sh")
  vars = {
    argo_secrets_bucket = var.argo_secrets_bucket
  }
}

resource "aws_instance" "workspace" {
  count = var.workspace_enabled ? 1 : 0

  ami                  = data.aws_ami.ubuntu.id
  key_name             = var.ssh_key
  instance_type        = var.workspace_instance_type
  iam_instance_profile = aws_iam_instance_profile.workspace_iam_instance_profile.name

  subnet_id                   = aws_subnet.public[count.index].id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_vpc.network.default_security_group_id,
  ]

  ebs_optimized = true
  root_block_device {
    encrypted = true
  }
  user_data = data.template_file.argo_protected_userdata.rendered

  tags = {
    Name = var.project_name
  }
}

//resource "aws_ebs_volume" "workspace" {
//  count = 1 # always exist
//
//  availability_zone = aws_subnet.public[count.index].availability_zone
//  size              = 20
//  encrypted         = true
//
//  tags = {
//    Name = var.project_name
//  }
//}
//
//resource "aws_volume_attachment" "ebs_att" {
//  count = var.workspace_enabled ? 1 : 0
//
//  device_name  = "/dev/sdh"
//  volume_id    = aws_ebs_volume.workspace[count.index].id
//  instance_id  = aws_instance.workspace[count.index].id
//  skip_destroy = true
//}
