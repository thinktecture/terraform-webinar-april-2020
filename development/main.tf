module "dev" {
  source = "../infrastructure"

  environment_name = "development"
  asp_size         = "S1"
  location         = "westeurope"
  tags = {
    live_demo = "true"
  }
}
