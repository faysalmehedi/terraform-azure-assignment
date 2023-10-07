# Terraform Azure Assignment

## Summary: This is simple azure architecture project where all the components is deployed by Terraform. There are two application hosted in two Azure App services. Each App Service app is hosted in its own App Service plan, allowing each to be scaled independently if necessary. All resources required by these hosted apps, such as storage and compute, as well as scaling needs are fully managed by the App Service Environment infrastructure. Applications are storing data on Azure Postgresql Flexible Database which is deployed on delegated subnet with VNET Integration. All the outbound traffic are going through Azure Firewall configuring the Route Table. An Application Gateway have been deployed for the incoming traffic which is resolving DNS to reach App service Environment using Private DNS Zone. 


#### Workflow Diagram
![Project Diagram](https://github.com/faysalmehedi/terraform-azure-poc/blob/main/arch-diagram/az-tf-assignment.png)


#### Azure Components Used

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

