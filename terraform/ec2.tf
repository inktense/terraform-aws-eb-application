# Just like an IAM user represents a person, an instance profile represents EC2 instances.
resource "aws_iam_instance_profile" "ec2_eb_profile" {
  name = "eb-demo-app-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role" "ec2_role" {
  name               = "eb-demo-app-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.eb_assume_policy.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
  ]
}

