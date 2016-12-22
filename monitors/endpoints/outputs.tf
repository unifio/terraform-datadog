# Output Variables

## Return ID of the Datadog monitor
output "datadog_monitor_id" {
  value = "${join(",",datadog_monitor.endpoint_http.*.id)}"
}
