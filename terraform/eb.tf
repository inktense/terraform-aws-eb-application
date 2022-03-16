resource "aws_elastic_beanstalk_application" "eb_demo_app" {
  name        = "tf-demo-app"
  description = "Demo Beanstalk application provisioned with Terraform"

    appversion_lifecycle {
      service_role = aws_iam_role.ec2_role.arn
      # The number of days to retain an application version.
      max_age_in_days = 30
      # Set to true to delete a version's source bundle from S3 when the application version is deleted.
      delete_source_from_s3 = true
    }
}

resource "aws_elastic_beanstalk_environment" "eb_demo_app_env" {
  name        = var.env
  application = aws_elastic_beanstalk_application.eb_demo_app.name
  tier        = "WebServer"
  # A solution stack to base your environment off of.
  solution_stack_name = "64bit Amazon Linux 2 v5.5.0 running Node.js 16"

  # The instance profile doesn't get automatically added like it does when creating an elastic beanstalk through the console.  
  # Needed to add it manually. This represents Environment settings.
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.ec2_eb_profile.name
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }

    setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_instance_count
  }
}
