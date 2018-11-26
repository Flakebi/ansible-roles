#!/usr/bin/env bash
printf "Content-type: text/html\n\n"

res=`grep '^http://' /etc/caddy/sites/services | cut -d/ -f3 | cut -d: -f1`
suffix=`printf "%s" "$res[0]" | cut -d. -f2-`

printf "<!DOCTYPE html>\n<html><body><ul>\n"
for service in $res; do
	printf "<li>"
	prefix=`printf "%s" "$service" | cut -d'.' -f1`
	printf '<a href="http://%s">%s</a>' "$service" "$prefix"
	printf "</li>\n"
done
printf "</ul></body></html>"
