#!/usr/bin/env python3
from pathlib import Path
import http.server
import socketserver
import os

currentDir = Path.cwd()

containsIndex = False
collected_files: list[Path] = []
for f in currentDir.iterdir():
    if f.is_file():
        collected_files.append(f)
        if f.name == 'index.html':
            containsIndex = True
            break

if not containsIndex:
    indexFile = currentDir / "index.html"
    with open(indexFile, 'w') as f:
        f.write("<div style=\"text-align:center\">")
        for img in collected_files:
            f.write(f"<img src=\"{img.name}\">")
        f.write("</div>")

os.chdir(currentDir)
handler = http.server.SimpleHTTPRequestHandler
httpd = socketserver.TCPServer(("", 8000), handler)
print("server started at http://127.0.0.1:8000")
try:
    httpd.serve_forever()
except KeyboardInterrupt:
    print("\n服务器已停止")
finally:
    httpd.server_close()
