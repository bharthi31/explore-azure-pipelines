#cs_lb --Connecting to CSVServer to both LB Servers
resource "citrixadc_csvserver" "demo_csvserver" {
  ipv46       = "20.0.0.5"
  name        = "demo_csvserver"
  port        = 80
  servicetype = "HTTP"
  # lbvserverbinding = citrixadc_lbvserver.blueLB.name
}

resource "citrixadc_lbvserver" {
  ipv46       = var.lb_ip
  name        = var.lbvs_name
  port        = 80
  servicetype = "HTTP"
}

resource "citrixadc_service" {
    lbvserver = citrixadc_lbvserver.blueLB.name
    name = var.backend_service_name
    ip = var.backend_service
    servicetype  = "HTTP"
    port = 80

}


#policy to based on that target lbvserver
resource "citrixadc_cspolicy" {
  csvserver       = citrixadc_csvserver.demo_csvserver.name
  # targetlbvserver = citrixadc_lbvserver.blueLB.name
  policyname      = var.cspolicy_name
  action          = citrixadc_csaction.blue_csaction.name
  rule            = format("HTTP.REQ.HOSTNAME.SERVER.EQ(\"demo-bg.webapp.com\") && HTTP.REQ.URL.PATH.SET_TEXT_MODE(IGNORECASE).STARTSWITH(\"/\") && sys.random.mul(100).lt(%s)", var.traffic_split_percentage)
  priority        = var.priority

  # Any change in the following id set will force recreation of the cs policy
  forcenew_id_set = [
    citrixadc_lbvserver.blueLB.id,
    citrixadc_csvserver.demo_csvserver.id,
  ]
}