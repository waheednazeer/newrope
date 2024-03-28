# first db
resource "google_sql_database" "database1" {
  name     = "mysql-waheed-development-db"
  instance = google_sql_database_instance.instance1.name
}


resource "google_sql_database_instance" "instance1" {
  name             = "mysql-waheed-dev-instance1"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}
resource "google_sql_user" "user1" {
    name = "mysql-dev-user"
    instance = google_sql_database_instance.instance1.name
    password = "Passw0rd!"
  }

/************* 2nd db **************/
resource "google_sql_database" "database2" {
  name     = "mysql-waheed-integrationtest-db"
  instance = google_sql_database_instance.instance2.name
}

resource "google_sql_database_instance" "instance2" {
  name             = "mysql-waheed-int-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}
resource "google_sql_user" "user2" {
    name = "mysql-int-user"
    instance = google_sql_database_instance.instance2.name
    password = "Passw0rd!"
  }

/************* 3rd db **************/
resource "google_sql_database" "database3" {
  name     = "mysql-waheed-qa-db"
  instance = google_sql_database_instance.instance3.name
}


resource "google_sql_database_instance" "instance3" {
  name             = "mysql-waheed-qa-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}
resource "google_sql_user" "user3" {
    name = "mysql-qa-user"
    instance = google_sql_database_instance.instance3.name
    password = "Passw0rd!"
  } 
/************* 4th db **************/
resource "google_sql_database" "database4" {
  name     = "postgres-waheed-development-db"
  instance = google_sql_database_instance.instance4.name
}


resource "google_sql_database_instance" "instance4" {
  name             = "postgres-waheed-dev-instance"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}
resource "google_sql_user" "user4" {
    name = "postgre-dev-user"
    instance = google_sql_database_instance.instance4.name
    password = "Passw0rd!"
  } 

  /************* 5th db **************/
resource "google_sql_database" "database5" {
  name     = "postgres-waheed-integrationtest-db"
  instance = google_sql_database_instance.instance5.name
}


resource "google_sql_database_instance" "instance5" {
  name             = "postgres-waheed-integrationtest-instance"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}
resource "google_sql_user" "user5" {
    name = "postgre-int-user"
    instance = google_sql_database_instance.instance5.name
    password = "Passw0rd!"
  } 

    /************* 6th db **************/
resource "google_sql_database" "database6" {
  name     = "postgres-waheed-qa-db"
  instance = google_sql_database_instance.instance6.name
}


resource "google_sql_database_instance" "instance6" {
  name             = "postgres-waheed-qa-instance"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}
resource "google_sql_user" "user6" {
    name = "postgre-qa-user"
    instance = google_sql_database_instance.instance6.name
    password = "Passw0rd!"
  } 