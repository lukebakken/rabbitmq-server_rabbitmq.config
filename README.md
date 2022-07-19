```
$ openssl version
OpenSSL 1.1.1f  31 Mar 2020
```

Connection attempt output:

```
$ make openssl-connect
openssl s_client -connect localhost:5671 -no_tls1 -no_tls1_1 -no_tls1_2 -no_tls1_3 -CAfile "/home/bakkenl/development/lukebakken/rabbitmq-users-disable-sslv3-cWbj4Zfea6U/certs/ca_certificate.pem"
CONNECTED(00000003)
139869042566464:error:141E70BF:SSL routines:tls_construct_client_hello:no protocols available:../ssl/statem/statem_clnt.c:1112:
---
no peer certificate available
---
No client certificate CA names sent
---
SSL handshake has read 0 bytes and written 7 bytes
Verification: OK
---
New, (NONE), Cipher is (NONE)
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 0 (ok)
---
make: *** [Makefile:22: openssl-connect] Error 1
```
