# Bind9 DNS server

Image includes:
- bind9 (service)
- rsyslog (service)
- nano text editor
- ping 
- nslookup

Bind9 configuration files stored are in **/bind-data** folder

# Docker-compose example

```
version: "3"

services: 
    dns1:
        image: nov7/bind9:latest
        hostname: dns-server
        ports:
            - 53:53/udp
            - 53:53/tcp
        volumes:
             - ./bind:/bind-data
        tty: true
```

# Logging:
- named.conf:
```
#...
include "/etc/bind/named.conf.logs";
```
- named.conf.logs (example)
```
logging {
	channel stdout {
		syslog daemon;
		print-time yes;
		print-category yes;
		print-severity yes;
		severity info;
	};
	category queries {stdout;};
};
```
