module "prod" {
  source = "../infrastructure"

  environment_name = "production"
  asp_size         = "S2"
  location         = "westeurope"
  tags = {
    live_demo     = "true"
    is_production = "true"
  }
}
