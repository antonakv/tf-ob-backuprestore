# backup/restore an installation

## Intro

This manual is dedicated to perform Terraform Enterprise instance backup/restore 

Tested on Mac OS X.

## Requirements

- curl recent version installed
[Curl installation manual](https://macappstore.org/curl/)

- git installed
[Git installation manual](https://git-scm.com/download/mac)

## Preparation 
- Clone git repository. 

```bash
git clone https://github.com/antonakv/tf-ob-backuprestore.git
```

Expected command output looks like this:

```bash
Cloning into 'tf-ob-backuprestore'...
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (12/12), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 12 (delta 1), reused 3 (delta 0), pack-reused 0
Receiving objects: 100% (12/12), done.
Resolving deltas: 100% (1/1), done.
```

- Change folder to tf-ob-backup

```bash
cd tf-ob-backuprestore
```

- Follow the manual to get Backup API token: [Authentication](https://www.terraform.io/enterprise/admin/infrastructure/backup-restore#authentication)

- Edit script backup.sh

Replace TOKEN variable in scripts with backup token value get on the previous step

Replace https://192.168.56.33.nip.io with actual Terraform Enterprise instance URL

- Run backup.sh

Expected output

```
$ ./backup.sh 
Note: Unnecessary use of -X or --request, POST is already inferred.
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 192.168.56.33...
* TCP_NODELAY set
* Connected to 192.168.56.33.nip.io (192.168.56.33) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/cert.pem
  CApath: none
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
} [234 bytes data]
* TLSv1.2 (IN), TLS handshake, Server hello (2):
{ [108 bytes data]
* TLSv1.2 (IN), TLS handshake, Certificate (11):
{ [1101 bytes data]
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
{ [300 bytes data]
* TLSv1.2 (IN), TLS handshake, Server finished (14):
{ [4 bytes data]
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
} [37 bytes data]
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
} [1 bytes data]
* TLSv1.2 (OUT), TLS handshake, Finished (20):
} [16 bytes data]
* TLSv1.2 (IN), TLS change cipher, Change cipher spec (1):
{ [1 bytes data]
* TLSv1.2 (IN), TLS handshake, Finished (20):
{ [16 bytes data]
* SSL connection using TLSv1.2 / ECDHE-RSA-AES256-GCM-SHA384
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: C=NL; L=AMS; O=HC; CN=192.168.56.33.nip.io
*  start date: Feb  1 10:53:08 2022 GMT
*  expire date: Feb  1 10:53:08 2023 GMT
*  issuer: C=NL; L=AMS; O=HC; CN=192.168.56.33.nip.io
*  SSL certificate verify result: self signed certificate (18), continuing anyway.
> POST /_backup/api/v1/backup HTTP/1.1
> Host: 192.168.56.33.nip.io
> User-Agent: curl/7.64.1
> Accept: */*
> Authorization: Bearer 7oAArDQ2tzSSyirzRj2GPPSTDTHQCWz8
> Content-Length: 44
> Content-Type: application/x-www-form-urlencoded
> 
} [44 bytes data]
* upload completely sent off: 44 out of 44 bytes
< HTTP/1.1 200 OK
< Server: nginx
< Date: Tue, 01 Feb 2022 14:05:57 GMT
< Content-Type: text/plain; charset=utf-8
< Transfer-Encoding: chunked
< Connection: keep-alive
< 
{ [4006 bytes data]
100 74016    0 73972  100    44  99692     59 --:--:-- --:--:-- --:--:-- 99617
* Connection #0 to host 192.168.56.33.nip.io left intact
* Closing connection 0

```

- Prepare New Terraform Enterprise installation

- Follow the manual to get Backup API token from the New Terraform installation. URL: [Authentication](https://www.terraform.io/enterprise/admin/infrastructure/backup-restore#authentication)

- Edit script restore.sh

Replace TOKEN variable in scripts with backup token value get on the previous step

Replace https://192.168.56.33.nip.io with actual Terraform Enterprise instance URL

- Run restore.sh script

```
$ ./restore.sh 
Note: Unnecessary use of -X or --request, POST is already inferred.
*   Trying 192.168.56.33...
* TCP_NODELAY set
* Connected to 192.168.56.33.nip.io (192.168.56.33) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/cert.pem
  CApath: none
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES256-GCM-SHA384
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: C=NL; L=AMS; O=HC; CN=192.168.56.33.nip.io
*  start date: Feb  1 10:53:08 2022 GMT
*  expire date: Feb  1 10:53:08 2023 GMT
*  issuer: C=NL; L=AMS; O=HC; CN=192.168.56.33.nip.io
*  SSL certificate verify result: self signed certificate (18), continuing anyway.
> POST /_backup/api/v1/restore HTTP/1.1
> Host: 192.168.56.33.nip.io
> User-Agent: curl/7.64.1
> Accept: */*
> Authorization: Bearer 7oAArDQ2tzSSyirzRj2GPPSTDTHQCWz8
> Content-Length: 74385
> Content-Type: multipart/form-data; boundary=------------------------8bf618fa59afde33
> Expect: 100-continue
> 
< HTTP/1.1 100 Continue
* We are completely uploaded and fine
< HTTP/1.1 200 OK
< Server: nginx
< Date: Tue, 01 Feb 2022 14:06:42 GMT
< Content-Type: text/plain; charset=utf-8
< Content-Length: 30
< Connection: keep-alive
< 
snapshot applied successfully
* Connection #0 to host 192.168.56.33.nip.io left intact
* Closing connection 0
```

- Restart the Terraform Enterprise on new instance. Manual: [Restarting Terraform Enterprise](https://support.hashicorp.com/hc/en-us/articles/360047602093-Restarting-Terraform-Enterprise)
