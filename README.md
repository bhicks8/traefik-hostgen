Simple/small python script to scrape Traefik frontend Host: rules on a regular interval.
Useful to e.g. front with CoreDNS for automatic DNS registration of services.

## Usage
```
docker run -d -v $PWD:/traefik-config.json:/etc/traefik-config.json $PWD/hosts:/etc/traefik-hosts --restart=unless-stopped bhicks8/traefik-hostgen
```

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

Where:
 - Scan Interval refers to the number of seconds after which to poll the configured URL's
 - traefik_instances is an ordered list of Traefik API URL's that are accessible to the container. Note that entries discovered by one URL are *overwritten* by subsequent instances should the FQDN match.

## Outputs
### Files
 - /etc/traefik-hosts - Standard hosts file output. You probably want to expose this via a bindmount.
