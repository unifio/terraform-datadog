### Generic Metric Variables.
variable "datadog_recipients" {
  type        = "list"
  description = "List of Datadog @notification recipients to alert when monitors are triggered"
}

variable "datadog_generic_monitors" {
  type        = "list"
  description = "The Generic Datadog Monitor Names to create"
}

variable "datadog_generic_monitors_types" {
  type        = "list"
  description = "The Generic Datadog Monitor Types for each monitor."
}

variable "datadog_generic_monitors_messages" {
  type        = "list"
  description = "The Generic Datadog Monitor messages for each monitor."
}

variable "datadog_generic_monitors_escalation_messages" {
  type        = "list"
  description = "The Generic Datadog Monitor messages for each monitor."
}

variable "datadog_generic_monitors_query" {
  type        = "list"
  description = "The Generic Datadog Monitor Queries for each monitor."
}

variable "datadog_generic_monitors_thresholds" {
  type        = "list"
  description = "The Generic Datadog Monitor thresholds for each monitor."
}

### Common Monitoring Options. 
# http://docs.datadoghq.com/api/#monitors

# Mute until is referenced as silenced in api docs. 
# Simplifying by muting all scopes.
variable "datadog_mute_until" {
  type        = "string"
  description = "POSIX EPOCH time to mute alert until. Defaults to 0 which is forever. "
  default     = 0
}

variable "datadog_notify_no_data" {
  type        = "string"
  description = "a boolean indicating whether this monitor will notify when data stops reporting. Defaults to true"
  default     = true
}

variable "datadog_new_host_delay" {
  type        = "string"
  description = "Time (in seconds) to allow a host to boot and applications to fully start before starting the evaluation of monitor results. Should be a non negative integer. Defaults to 300 seconds."
  default     = 300
}

variable "datadog_no_data_timeframe" {
  type        = "string"
  description = "The number of minutes before a monitor will notify when data stops reporting. Must be at least 1x the monitor timeframe for metric alerts or 2 minutes for service checks.Default: 1x timeframe for metric alerts, 2 minutes for service checks"
  default     = 2
}

variable "datadog_timeout_h" {
  type        = "string"
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Default: 0"
  default     = 0
}

variable "datadog_require_full_window" {
  type        = "string"
  description = "A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: False."
  default     = false
}

variable "datadog_renotify_interval" {
  type        = "string"
  description = "The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved. Default: 0"
  default     = 0
}

variable "datadog_escalation_message" {
  type        = "string"
  description = "A message to include with a re-notification. Supports the '@username' notification we allow elsewhere. Not applicable if renotify_interval is None. Default is none"
  default     = ""
}

variable "datadog_notify_audit" {
  type        = "string"
  description = "A boolean indicating whether tagged users will be notified on changes to this monitor. Default False."
  default     = false
}

variable "datadog_locked" {
  type        = "string"
  description = "a boolean indicating whether changes to to this monitor should be restricted to the creator or admins. Default False"
  default     = false
}

variable "datadog_include_tags" {
  type        = "string"
  description = "a boolean indicating whether notifications from this monitor will automatically insert its triggering tags into the title. Default True"
  default     = true
}

variable "datadog_metric_thresholds" {
  type        = "map"
  description = " a dictionary of thresholds by threshold type. Currently we have two threshold types for metric alerts: critical and warning. Critical is defined in the query, but can also be specified in this option. Warning threshold can only be specified using the thresholds option.Example: {'critical': 90, 'warning': 80}"

  default = {
    crictical = 90
    warning   = 80
  }
}

variable "datadog_service_thresholds" {
  type        = "map"
  description = "These options only apply to service checks and will be ignored for other monitor types. thresholds a dictionary of thresholds by status. Because service checks can have multiple thresholds, we don't define them directly in the query. Default: {'ok': 1, 'critical': 1, 'warning': 1}"

  default = {
    ok       = 1
    critical = 1
    warning  = 1
  }
}

variable "datadog_message" {
  type        = "string"
  description = "The message to include in a triggered alert for a monitoring test failure."
  default     = "failed test."
}

variable "datadog_endpoint_query_by" {
  type        = "list"
  description = "The tags to aggregate the endpoint query with. For instance host,url,instance. The default is url."

  default = [
    "url",
  ]
}

variable "datadog_endpoint_failures" {
  type        = "string"
  description = "Number of failures required before triggering alert. Defaults to 1"
  default     = 1
}
