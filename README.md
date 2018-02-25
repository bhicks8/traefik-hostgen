Simple/small python script to scrape Traefik frontend Host: rules on a regular interval.
Useful to e.g. front with CoreDNS for automatic DNS on containers

## Inputs
### Files
All configuration is performed through /etc/traefik-config.json which should follow the following syntax:
```json
{
	"scan_interval": 2,
	"traefik_instances": [{
		"url": "http://traefik:8080/api",
		"addresses": ["10.91.1.18", "10.91.2.18"]
	}]
}
```

## Outputs
### Files
 - /etc/traefik-hosts - Suggest you bind this to external storage via -v.
