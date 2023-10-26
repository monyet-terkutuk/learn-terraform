# provider isinya bisa AWS, GCP dan lainnya
provider "google" {
  project     = "isi dengan project id(di dalam project info)"
  credentials = file("credentials.json") # credential.json di dapat dari (iam&admin/service accounts/klik salah satu service account/keys)
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_instance" "my_instance" {
  name         = "terraform-instance" # nama instance
  machine_type = "f1-micro"           #ini adalah jenis mesin di instance, defaulnya E2
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }
}
