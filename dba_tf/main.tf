provider "google" {
    project = "database-adminstration"
    region = "us-central1"
    zone = "us-central1-a"
}

resource "google_sql_database" "database_label_terraform" {
    name = "my-postgres-database"
    instance = google_sql_database_instance.instance_label_terraform.name
}

resource "google_sql_database_instance" "instance_label_terraform" {
    name = "postgres-instance"
    region = "us-central1"
    database_version = "POSTGRES_11"
    settings {
      tier = "db-f1-micro"
    }
    deletion_protection = "false"  
}
/* First database resources*/
resource "google_sql_user" "users" {
    name = "postgre-dev-user"
    instance = google_sql_database_instance.instance_label_terraform.name
    password = "Passw0rd!"
  }
  