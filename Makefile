.PHONY: all
all: clean config

.PHONY: config
config:
	sed -e 's|@@PWD@@|$(CURDIR)|' rabbitmq.conf.in > rabbitmq.conf
	sed -e 's|@@PWD@@|$(CURDIR)|' advanced.config.in > advanced.config

.PHONY: clean
clean:
	rm -f rabbitmq.conf
	rm -f advanced.config

.PHONY: openssl-connect
openssl-connect:
	openssl s_client -connect localhost:5671 -no_tls1 -no_tls1_1 -no_tls1_2 -no_tls1_3 -CAfile "$(CURDIR)/certs/ca_certificate.pem"
