#!/usr/bin/ruby
require "rubygems"
require "zabbixapi"

zabbix_server = "http://54/zabbix/api_jsonrpc.php"

####################################
File.readlines("zabbixhosts_eu").each {|host|
list = host.split()
hostname=list[0]

zbx = ZabbixApi.connect(
  :url => "#{zabbix_server}",
  :user => 't',
  :password => '@'
)

zbx.templates.mass_add(
  :hosts_id => [zbx.hosts.get_id(:host => "#{hostname}")],
  :templates_id => [10001,10155,10156,10158,10162,10178]
)
}
