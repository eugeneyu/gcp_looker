view: requests {
  sql_table_name: `prod_cdn_Log.requests`
    ;;

  dimension: http_request {
    hidden: yes
    sql: ${TABLE}.httpRequest ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: jsonpayload_type_loadbalancerlogentry {
    hidden: yes
    sql: ${TABLE}.jsonpayload_type_loadbalancerlogentry ;;
  }

  dimension: log_name {
    type: string
    sql: ${TABLE}.logName ;;
  }

  dimension: operation {
    hidden: yes
    sql: ${TABLE}.operation ;;
  }

  dimension_group: receive_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.receiveTimestamp ;;
  }

  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension: source_location {
    hidden: yes
    sql: ${TABLE}.sourceLocation ;;
  }

  dimension: span_id {
    type: string
    sql: ${TABLE}.spanId ;;
  }

  dimension: text_payload {
    type: string
    sql: ${TABLE}.textPayload ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: trace {
    type: string
    sql: ${TABLE}.trace ;;
  }

  dimension: trace_sampled {
    type: yesno
    sql: ${TABLE}.traceSampled ;;
  }

  measure: count {
    type: count
    drill_fields: [log_name]
  }
}

view: requests__resource {
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: requests__resource__labels {
  dimension: backend_service_name {
    type: string
    sql: ${TABLE}.backend_service_name ;;
  }

  dimension: forwarding_rule_name {
    type: string
    sql: ${TABLE}.forwarding_rule_name ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: target_proxy_name {
    type: string
    sql: ${TABLE}.target_proxy_name ;;
  }

  dimension: url_map_name {
    type: string
    sql: ${TABLE}.url_map_name ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }
}

view: requests__jsonpayload_type_loadbalancerlogentry {
  dimension: _type {
    type: string
    sql: ${TABLE}._type ;;
  }

  dimension: cacheid {
    type: string
    sql: ${TABLE}.cacheid ;;
  }

  dimension: parentinsertid {
    type: string
    sql: ${TABLE}.parentinsertid ;;
  }

  dimension: statusdetails {
    type: string
    sql: ${TABLE}.statusdetails ;;
  }
}

view: requests__http_request {
  dimension: cache_fill_bytes {
    type: number
    sql: ${TABLE}.cacheFillBytes ;;
  }

  dimension: cache_hit {
    type: yesno
    sql: ${TABLE}.cacheHit ;;
  }

  dimension: cache_lookup {
    type: yesno
    sql: ${TABLE}.cacheLookup ;;
  }

  dimension: cache_validated_with_origin_server {
    type: yesno
    sql: ${TABLE}.cacheValidatedWithOriginServer ;;
  }

  dimension: latency {
    type: number
    sql: ${TABLE}.latency ;;
  }

  dimension: protocol {
    type: string
    sql: ${TABLE}.protocol ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: remote_ip {
    type: string
    sql: ${TABLE}.remoteIp ;;
  }

  dimension: request_method {
    type: string
    sql: ${TABLE}.requestMethod ;;
  }

  dimension: request_size {
    type: number
    sql: ${TABLE}.requestSize ;;
  }

  dimension: request_url {
    type: string
    sql: ${TABLE}.requestUrl ;;
  }

  dimension: response_size {
    type: number
    sql: ${TABLE}.responseSize ;;
  }

  dimension: server_ip {
    type: string
    sql: ${TABLE}.serverIp ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.userAgent ;;
  }

  measure:sum_resp_size{
    type:sum
    sql:${TABLE}.responseSize;;
  }

  measure:sum_cache_fill_bytes{
    type:sum
    sql:${TABLE}.cacheFillBytes;;
  }

  measure:50th_percentile_latency{
    type:percentile
    percentile: 50
    sql:${TABLE}.latency;;
  }

  measure:90th_percentile_latency{
    type:percentile
    percentile: 90
    sql:${TABLE}.latency;;
  }

  measure:99th_percentile_latency{
    type:percentile
    percentile: 99
    sql:${TABLE}.latency;;
  }
}

view: requests__source_location {
  dimension: file {
    type: string
    sql: ${TABLE}.file ;;
  }

  dimension: function {
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: line {
    type: number
    sql: ${TABLE}.line ;;
  }
}

view: requests__operation {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: first {
    type: yesno
    sql: ${TABLE}.first ;;
  }

  dimension: last {
    type: yesno
    sql: ${TABLE}.last ;;
  }

  dimension: producer {
    type: string
    sql: ${TABLE}.producer ;;
  }
}
