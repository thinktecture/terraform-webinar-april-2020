module "staging" {
  source = "../infrastructure"

  environment_name = "staging"
  asp_size         = "S2"
  location         = "westeurope"
  tags = {
    live_demo = "true"
  }
}
