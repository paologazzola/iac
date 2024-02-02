# Terraform - Gitlab pipeline
This project helps to create an IaC Terraform AWS pipeline in a (self-managed) Gitlab.  
Peculiarities of the solution are:
- 3 different AWS cloud environments (development, staging and production);
- each env is created in a different AWS account (I don't want to mix envs in a single account);
- each AWS account credentials are stored in different gitlab pipeline variables;

## AWS Services covered
### Lambdas (layered)
Module **lambdas**: https://github.com/paologazzola/iac/tree/main/terraform-gitlab/modules/lambdas.  
There is a zip containing an empty lambda. This lambda uses a newly created lambda layer. The zip is only for creation purpose, you can set up (recommended for automation and fast delivery) an additional pipeline for deploy the updated lambda function.

### VPC (networking)
Module **networking**: https://github.com/paologazzola/iac/tree/main/terraform-gitlab/modules/networking.  
This module creates a new VPC with subnets.

## Gitlab variables
Gitlab CI/CD pipeline variables (all masked):
- `AWS_ACCESS_KEY_ID_DEVELOPMENT`: development account access key
- `AWS_SECRET_ACCESS_KEY_DEVELOPMENT`: development account secret access key
- `AWS_REGION_ID_DEVELOPMENT`: development env region id (es: eu-south-1)
- `AWS_ACCESS_KEY_ID_STAGING`: staging account access key
- `AWS_SECRET_ACCESS_KEY_STAGING`: staging account secret access key
- `AWS_REGION_ID_STAGING`: staging env region id (es: eu-south-1)
- `AWS_ACCESS_KEY_ID_PRODUCTION`: production account access key
- `AWS_SECRET_ACCESS_KEY_PRODUCTION`: production account secret access key
- `AWS_REGION_ID_PRODUCTION`: production env region id (es: eu-south-1)

### Multi environments
The IaC project uses the _File Structure Approach_ for managing the three different environments. If you don't known what is, watch this video: https://www.youtube.com/watch?v=7xngnjfIlK4&t=5766s

The Gitlab pipeline is displayed like this:
![iac-ex2](https://github.com/paologazzola/iac/assets/26058077/2ecfabb8-4de1-4eee-903b-dca5cc728fd6)


