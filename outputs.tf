locals {
  this_queue_name = "${alicloud_mns_queue.this_queue.name}"
}

output "queue_name" {
  value = "${local.this_queue_name}"
}
