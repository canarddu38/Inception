#!/usr/bin/env python3

from http.server import HTTPServer, SimpleHTTPRequestHandler


class AlwaysIndexHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        try:
            with open("/var/www/html/index.html", "rb") as f:
                self.send_response(200)
                self.send_header("Content-type", "text/html")
                self.end_headers()
                self.wfile.write(f.read())
        except FileNotFoundError:
            self.send_error(404, "index.html not found")


def run(server_class=HTTPServer, handler_class=AlwaysIndexHandler):
    server_address = ('0.0.0.0', 8080)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()


run()
