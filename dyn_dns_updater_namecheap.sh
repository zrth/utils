#!/bin/bash
# updated dyn dns, works with namecheap
# replace host if you want to set a A reccord for a subdomain
# spring 2016 



host='@' # subdomain
domain='domain.tld'
password=':)'

echo "starting dyndns" | logger

ip=`curl ifconfig.co 2>/dev/null`

if [[ ! $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
echo "bad!"
echo "bad ip returned" | logger
exit
fi


request="https://dynamicdns.park-your-domain.com/update?host=${host}&domain=${domain}&password=${password}&ip=${ip}"

echo $request | logger
curl $request 1> /dev/null 2>&1 | logger
