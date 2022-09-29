module "fr_payroll" {
  source = "../modules/payroll-app"
  app_region = "eu-west-3"
  ami = "ami-0493936afbe820b28"
}