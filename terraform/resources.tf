resource "yandex_compute_instance" "clickhouse" {
  name        = "clickhouse"
  platform_id = var.vm_web_platform
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd82r0edj6mgkkc3htec"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ansible:${file("/root/.ssh/id_ed25519.pub")}"
  }

}

resource "yandex_compute_instance" "vector" {
  name        = "vector"
  platform_id = var.vm_web_platform
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd82r0edj6mgkkc3htec"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ansible:${file("/root/.ssh/id_ed25519.pub")}"
  }

}
