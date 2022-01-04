Alicloud MNS Queue Terraform Module   
terraform-alicloud-mns-queue
---

This Terraform module will create a queue instance.

These types of resources are supported:

* [Alicloud_mns_queue](https://www.terraform.io/docs/providers/alicloud/r/mns_queue.html)

----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf
    
```hcl
module "mns-queue" {
  source = "terraform-alicloud-modules/mns-queue/alicloud"

  #variables for  queue
  name                        = "tf-example-mnsqueue"
  delay_seconds               = 0
  maximum_message_size        = 65536
  message_retention_period    = 259200
  visibility_timeout          = 30
  polling_wait_seconds        = 0
}
```

2. Setting `access_key` and `secret_key` values through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|name               | The name of queue.    |  string     |     ""      | yes |  
|delay_seconds      | This attribute defines the length of time, in seconds, after which every message sent to the queue is dequeued. Valid value range: 0-604800 seconds, i.e., 0 to 7 days.  |  int     |     0      | no |  
|maximum_message_size               | This indicates the maximum length, in bytes, of any message body sent to the queue.    |  int     |     65536      | no| 
|message_retention_period               | Messages are deleted from the queue after a specified length of time, whether they have been activated or not.    |  int     |   259200     | yes |  
|visibility_timeout               | Dequeued messages change from active (visible) status to inactive (invisible) status.    |  int     |    30     | no |  
|polling_wait_seconds               | Long polling is measured in seconds.    |  int     |     0      | no | 
 

## Outputs

| Name | Description |
|------|-------------|
| queue_name     |        the name of queue created     |

## Notes
From the version v1.2.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
   version              = ">=1.56.0"
   region               = var.region != "" ? var.region : null
   configuration_source = "terraform-alicloud-modules/mns-queue"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.1.0:

```hcl
module "mns-queue" {
   source        = "terraform-alicloud-modules/mns-queue/alicloud"
   version       = "1.1.0"
   region        = "cn-beijing"
   name          = "tf-example-mnsqueue"
   delay_seconds = 0
   // ...
}
```

If you want to upgrade the module to 1.2.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
   region = "cn-beijing"
}
module "mns-queue" {
   source        = "terraform-alicloud-modules/mns-queue/alicloud"
   name          = "tf-example-mnsqueue"
   delay_seconds = 0
   // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
   region = "cn-beijing"
   alias  = "bj"
}
module "mns-queue" {
   source        = "terraform-alicloud-modules/mns-queue/alicloud"
   providers     = {
      alicloud = alicloud.bj
   }
   name          = "tf-example-mnsqueue"
   delay_seconds = 0
   // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

Authors
---------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
