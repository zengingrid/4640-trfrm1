Lab 5: Terraform
- Installing Terraform (via binary)
  1. Visit https://developer.hashicorp.com/terraform/downloads
  2. Binary download for Linux: AMD64 
  3. Unzip the folder and move the file into usr/local/bin
  4. Remove the zip
- Creating the .env file
  1. In digitalocean, go to API to generate a token
  2. copy the token and put it in a .env file
  3. export the token as TF_VAR
  ```bash
  export TF_VAR_do_token=<token_value>
  ```
- Creating main.tf based on digital ocean documentation
- Run: 
  ```bash
  terraform init
  ```
- To validate
   ```bash
  terraform plan or terraform validate
  ``` 
- To build
   ```bash
  terraform apply
  ``` 
- To delete everything
   ```bash
  terraform destroy
  ``` 
