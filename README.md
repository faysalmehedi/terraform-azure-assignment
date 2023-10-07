# Terraform Azure Assignment

### Summary: 
This is simple azure architecture project where all the components is deployed using Terraform. Every components were deployed on single resource group, whether one virtual network with four subnets were created. There will be two application hosted in two Azure App services. Each App Service app is hosted in its own App Service plan, allowing each to be scaled independently if necessary. All resources required by these hosted apps, such as storage and compute, as well as scaling needs are fully managed by the App Service Environment infrastructure. Applications are storing data on Azure Postgresql Flexible Database which is deployed on delegated subnet with VNET Integration. All the outbound traffic are going through Azure Firewall; Route Table have been configured for the routing. An Application Gateway have been deployed for the incoming traffic which is resolving DNS to reach App service Environment using Private DNS Zone. 


### Workflow Diagram
![Project Diagram](https://github.com/faysalmehedi/terraform-azure-poc/blob/main/arch-diagram/az-tf-assignment.png)


### Azure Components Used

- `Resource Group`
- `Virtual Network`
- `Subnet`
    - 4 subnet [Appgw, Firewall, Postgresql(Delegated), appservice(delegated)]
- `Private DNS Zone`
    - 2 [Appservice, Postgresql]
- `Azure Firewall`
- `Route Table`
- `Azure Postgresql Flexible Server (VNET Integration)`
- `App Service Environment v3`
- `App Service Plan`
- `App Service (Web App)`
- `Application Gateway`

#### Scripts
For this assignment I segregated the components and deployed sequentaly for better support granular access control and configuration changes. All the `tfstate` files are stored in the `blob storage with version enabling`. I used `data resource` block for dynamically fetch data and use in other components.

```console
# change the directory
cd 01_network/

# run terraform commands
terraform init
terraform validate
terraform plan -var-file=var.tfvars -out=network.tfplan
terraform apply network.tfplan

```

#### Limitations

1. Due to limited resource access and subscription policy, App Services and App GW were not fully tested.
2. Firewall policy needs to be tuned with App service; basic policy added.
3. Certifications were not created