resource "fivetran_group" "group" {
    name = "Terraform"
}

resource "fivetran_destination" "dest" {
  group_id = fivetran_group.group.id
  service = "big_query"
  time_zone_offset = "+9"
  region = "GCP_US_EAST4"
  trust_certificates = "true"
  trust_fingerprints = "true"
  run_setup_tests = "true"

  config {
    project_id = var.project
    data_set_location = "US"
  }
}

resource "fivetran_connector" "gcs_weather" {
  group_id = fivetran_group.group.id
  service = "gcs"
  sync_frequency = 60
  paused = false
  pause_after_trial = false

  destination_schema {
    name  = "data_lake"
    table = "weather"
  }
 
  config {
    bucket    = var.weather_bucket
    pattern   = "weather_.+\\.csv"
    file_type = "csv"
  }
}

resource "fivetran_connector" "gcs_ine" {
  group_id = fivetran_group.group.id
  service = "gcs"
  sync_frequency = 60
  paused = false
  pause_after_trial = false

  destination_schema {
    name  = "data_lake"
    table = "ine"
  }
 
  config {
    bucket    = var.ine_bucket
    pattern   = "ine.csv"
    file_type = "csv"
  }
}

