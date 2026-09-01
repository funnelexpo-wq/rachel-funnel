# Static landing page → nginx
FROM nginx:1.27-alpine

# Replace the default server block with ours (gzip, caching, 404, hardening headers)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy ONLY the site. Meta/secret files never enter the image.
COPY public/ /usr/share/nginx/html

EXPOSE 80

# nginx:alpine already runs `nginx -g 'daemon off;'` as its default CMD.
