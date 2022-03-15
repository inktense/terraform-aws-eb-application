resource "aws_elastic_beanstalk_application" "eb_demo_app" {
  name        = "tf-demo-app"
  description = "Demo Beanstalk application provisioned with Terraform"

  #   appversion_lifecycle {
  #     service_role = aws_iam_role.beanstalk_service.arn
  #     # The number of days to retain an application version.
  #     max_age_in_days = 30
  #     # Set to true to delete a version's source bundle from S3 when the application version is deleted.
  #     delete_source_from_s3 = true
  #   }
}

resource "aws_elastic_beanstalk_environment" "eb_demo_app_env" {
  name        = var.env
  application = aws_elastic_beanstalk_application.eb_demo_app.name
  tier        = "WebServer"
  # A solution stack to base your environment off of.
  solution_stack_name = "64bit Amazon Linux 2 v5.5.0 running Node.js 16"

  # The instance profile doesn't get automatically added like it does when creating an elastic beanstalk through the console.  
  # Needed to add it manually.   
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }
}
