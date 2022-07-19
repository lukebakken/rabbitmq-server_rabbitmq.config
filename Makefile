rabbitmq.config:
	sed -e "s|@@PWD@@|$$PWD|" rabbitmq.config.in > rabbitmq.config

.PHONY: clean
clean:
	rm -f rabbitmq.config
