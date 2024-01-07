output "external_ip_address_app" {
  value = [for ex_address in yandex_compute_instance.app.*.network_interface.0.nat_ip_address : ex_address]
}

output "external_ip_address_lb" {
  value = yandex_lb_network_load_balancer.lb.listener.*.external_address_spec[0].*.address
}
