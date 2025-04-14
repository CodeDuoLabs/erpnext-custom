server {
    listen 80;
    server_name hr.codeduolabs.com;

    location / {
        proxy_pass http://localhost:8090;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # Optional: Logging for debugging
    access_log /var/log/nginx/hr.codeduolabs.com.access.log;
    error_log /var/log/nginx/hr.codeduolabs.com.error.log;
}
