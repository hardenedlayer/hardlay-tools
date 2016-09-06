# HardenedLayer Tools

hardlay-tools is a toolset for self-service of softlayer instances.

## Features

* Get Self-Information for Compute Instance


## Install


## Usage

### Get Instance Information

It uses `Resource_Metadata` service which is working without API credential
so we can easily get basic information without configuration.

By adding this to post-install script, you can use `server_id` for automation.

```console
$ ./whoami.sh
$ cat whoami.conf
hl_datacenter=seo01
hl_datacenter_id=1555995
hl_domain=example.com
hl_hostname=superserver
hl_id=20000000
hl_ip_addr_be=10.100.0.100
hl_ip_addr_fe=172.16.100.200
hl_mac_addr_be=00:00:00:00:00:09
hl_mac_addr_fe=00:00:00:00:00:0b
hl_provision_state=COMPLETE
hl_router_be=bcr01.seo01
hl_router_fe=fcr01.seo01
hl_vlan_be=700
hl_vlan_fe=700
hl_vlan_id_be=1000005
hl_vlan_id_fe=1000003
$ 
```



## Credits



