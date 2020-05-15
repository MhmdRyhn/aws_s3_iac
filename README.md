# aws_s3_iac
Setting up a S3 bucket using Terraform. This contains the following features:
- Create bucket
- Bucket policy
- CORS configuration
- Create folder(s) inside the bucket


# Commands To Manipulate Resources
- **View execution plan**
```
terraform plan --var-file input.tfvars
```

- **Apply the configurations** 
```
terraform apply --var-file input.tfvars --auto-approve
```
Remove `--auto-approve` option from the above command to approve manually (by inputting prompt).

- **Destroy all resources**
```
terraform destroy --var-file input.tfvars --auto-approve
```
Remove `--auto-approve` option from the above command to approve manually (by inputting prompt).
