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

.PHONY: start-rabbitmq
start-rabbitmq: config
	[ -f "$(CURDIR)/rabbitmq-server-generic-unix-3.10.6.tar.xz" ] || curl -LO https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.10.6/rabbitmq-server-generic-unix-3.10.6.tar.xz
	[ -d "$(CURDIR)/rabbitmq_server-3.10.6" ] || tar xf "$(CURDIR)/rabbitmq-server-generic-unix-3.10.6.tar.xz"
	RABBITMQ_CONFIG_FILE="$(CURDIR)/rabbitmq.conf" RABBITMQ_ADVANCED_CONFIG_FILE="$(CURDIR)/advanced.config" "$(CURDIR)/rabbitmq_server-3.10.6/sbin/rabbitmq-server"

.PHONY: openssl-connect
openssl-connect:
	openssl s_client -connect localhost:5671 -no_tls1 -no_tls1_1 -no_tls1_2 -no_tls1_3 -CAfile "$(CURDIR)/certs/ca_certificate.pem"
