provider "google" {
    region = "us-central1"
    zone = "us-central1-a"
}

resource "google_sql_database" "database_postgres" {
    name = "postgres-db"
    instance = google_sql_database_instance.instance_postgres.name
}

resource "google_sql_database_instance" "instance_postgres" {
    name = "postgres-instance"
    region = "us-central1"
    database_version = "POSTGRES_15"
    settings {
      tier = "db-f1-micro"
      ip_configuration {
      authorized_networks {
        name            = "postgres-net"
        value           = "0.0.0.0/0"
      }
      }
    }
    deletion_protection = "false"  
}
/* First database resources*/
resource "google_sql_user" "user1" {
    name = "postgre-user"
    instance = google_sql_database_instance.instance_postgres.name
    password = "Passw0rd!"
  }
 /* Firewall rules*/ 
resource "google_compute_firewall" "rules" {
  name        = "db-rule"
  network     = "default"
  description = "mysql port=3306, postgres port=5432, mssql port=1433"

  allow {
    protocol  = "tcp"
    ports     = ["80", "8080", "1000-2000", "5432", "3306", "1433"]
  }

  source_tags = ["db"]
  target_tags = ["web"]
}
