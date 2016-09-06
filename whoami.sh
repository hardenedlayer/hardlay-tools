#!/bin/bash

API_PRIVATE_ENDPOINT="https://api.service.softlayer.com/rest/v3"
API_ENDPOINT=$API_PRIVATE_ENDPOINT
svc=$API_ENDPOINT/SoftLayer_Resource_Metadata
curl="curl -s"

hl_datacenter=`$curl $svc/Datacenter.txt`
hl_datacenter_id=`$curl $svc/DatacenterId.txt`
hl_domain=`$curl $svc/Domain.txt`
hl_hostname=`$curl $svc/Hostname.txt`
hl_id=`$curl $svc/Id.txt`
hl_provision_state=`$curl $svc/ProvisionState.txt`

hl_ip_addr_be=`$curl $svc/PrimaryBackendIpAddress.txt`
hl_ip_addr_fe=`$curl $svc/PrimaryIpAddress.txt`

hl_mac_addr_be=`$curl $svc/BackendMacAddresses.txt`
hl_mac_addr_fe=`$curl $svc/FrontendMacAddresses.txt`
hl_mac_addr_be=`echo "$hl_mac_addr_be" |grep '0='|cut -d= -f2|tr -d \'`
hl_mac_addr_fe=`echo "$hl_mac_addr_fe" |grep '0='|cut -d= -f2|tr -d \'`

hl_router_fe=`$curl $svc/Router/$hl_mac_addr_fe.txt`
hl_router_be=`$curl $svc/Router/$hl_mac_addr_be.txt`

hl_vlan_fe=`$curl $svc/Vlans/$hl_mac_addr_fe.txt`
hl_vlan_be=`$curl $svc/Vlans/$hl_mac_addr_be.txt`
hl_vlan_id_fe=`$curl $svc/VlanIds/$hl_mac_addr_fe.txt`
hl_vlan_id_be=`$curl $svc/VlanIds/$hl_mac_addr_be.txt`
hl_vlan_be=`echo "$hl_vlan_be" |grep '0='|cut -d= -f2|tr -d \'`
hl_vlan_fe=`echo "$hl_vlan_fe" |grep '0='|cut -d= -f2|tr -d \'`
hl_vlan_id_be=`echo "$hl_vlan_id_be" |grep '0='|cut -d= -f2|tr -d \'`
hl_vlan_id_fe=`echo "$hl_vlan_id_fe" |grep '0='|cut -d= -f2|tr -d \'`

set |grep hl_ > whoami.conf

