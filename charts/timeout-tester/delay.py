import http.server
import ssl
import time
import json
import os


class DelayHandler(http.server.BaseHTTPRequestHandler):
    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        request_json = json.loads(post_data)
        request_uid = request_json.get("request", {}).get("uid", "unknown")
        
        delay = int(os.getenv('DELAY_SECONDS', '10'))
        print(f"Intercepted request. Sleeping for {delay}s...")
        time.sleep(delay)
        
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        
        # A standard 'Allowed' response for K8s Admission
        response = {
            "apiVersion": "admission.k8s.io/v1",
            "kind": "AdmissionReview",
            "response": {
                "uid": request_uid,
                "allowed": True
            }
        }
        try:
            self.wfile.write(json.dumps(response).encode())
        except BrokenPipeError:
            print("Client disconnected before response could be sent (Timeout triggered!)")

# Load TLS from the volume mounts
context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
context.load_cert_chain('/etc/webhook/certs/tls.crt', '/etc/webhook/certs/tls.key')

server = http.server.HTTPServer(('0.0.0.0', 8443), DelayHandler)
server.socket = context.wrap_socket(server.socket, server_side=True)
print("Delay Webhook listening on 8443...")
server.serve_forever()
