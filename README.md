```hcl
module "network" {
  source                = "./modules/vnet"
  
  vnet_name             = "vnet-user-01"
  location              = "germanywestcentral"
  resource_group_name   = "rg-user-01"
  
  # Using the first entry from your list
  vnet_address_space    = "10.1.0.0/16"
  subnet_name           = "internal"
  subnet_address_prefix = "10.1.1.0/24"
}
```
```sh
#     VNet Address Space (CIDR) ; Subnet Address Prefix (CIDR)
1     10.1.0.0/16                 10.1.1.0/24
2     10.2.0.0/16                 10.2.1.0/24
3     10.3.0.0/16                 10.3.1.0/24
...
```
