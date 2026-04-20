all:
	mkdir -p /home/julcleme/data/mariadb
	mkdir -p /home/julcleme/data/wordpress
	mkdir -p /home/julcleme/data/backups
	docker compose -f srcs/docker-compose.yml up --build -d

stop:
	docker compose -f srcs/docker-compose.yml down

clean_volumes:
	docker compose -f srcs/docker-compose.yml down -v
clean:
	docker system prune -af

vclean: clean clean_volumes

.PHONY: vclean clean stop clean_volumes all