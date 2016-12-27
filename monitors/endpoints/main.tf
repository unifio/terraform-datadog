### Creates a New Datadog Endpoint Monitor
resource "datadog_monitor" "endpoint_http" {
  count              = "${length(var.datadog_endpoints)}"
  name               = "${element(var.datadog_endpoints,count.index)} HTTP Endpoint Monitor"
  type               = "service check"
  message            = "${var.datadog_message} Notify: ${join(" ",var.datadog_recipients)}"
  escalation_message = "${var.datadog_escalation_message}"

  query        = "\"http.can_connect\".over(\"url:${element(var.datadog_endpoints,count.index)}\").by(${join(",",formatlist("%q",var.datadog_endpoint_query_by))}).last(${var.datadog_endpoint_failures}).count_by_status()"
  include_tags = "${var.datadog_include_tags}"

  notify_no_data    = "${var.datadog_notify_no_data}"
  renotify_interval = "${var.datadog_renotify_interval}"
  notify_audit      = "${var.datadog_notify_audit}"
  no_data_timeframe = "${var.datadog_no_data_timeframe}"
  locked            = "${var.datadog_locked}"

  silenced {
    "*" = "${var.datadog_mute_until}"
  }

  tags {
    managed_by = "terraform"
  }

  thresholds = "${var.datadog_service_thresholds}"
}
