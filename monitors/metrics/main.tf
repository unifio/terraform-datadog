### Creates a New Datadog Generic Monitor
resource "datadog_monitor" "monitor" {
  count              = "${length(var.datadog_generic_monitors)}"
  name               = "${element(var.datadog_generic_monitors,count.index)} Monitor"
  type               = "${element(var.datadog_generic_monitors_types,count.index)}"
  message            = "${element(var.datadog_generic_monitors_messages,count.index)} Notify: ${join(" ",var.datadog_recipients)}"
  escalation_message = "${element(var.datadog_generic_monitors_escalation_messages,count.index)}"
  query              = "${element(var.datadog_generic_monitors_query,count.index)}"
  include_tags       = "${var.datadog_include_tags}"
  notify_no_data     = "${var.datadog_notify_no_data}"
  renotify_interval  = "${var.datadog_renotify_interval}"
  notify_audit       = "${var.datadog_notify_audit}"
  no_data_timeframe  = "${var.datadog_no_data_timeframe}"
  locked             = "${var.datadog_locked}"

  silenced {
    "*" = "${var.datadog_mute_until}"
  }

  tags {
    managed_by = "terraform"
  }

  thresholds = "${map("ok",element(split(",",element(var.datadog_generic_monitors_thresholds,count.index)),0),"critical",element(split(",",element(var.datadog_generic_monitors_thresholds,count.index)),1),"warning",element(split(",",element(var.datadog_generic_monitors_thresholds,count.index)),2))}"
}
