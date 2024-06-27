# nginx/Dockerfile

FROM nginx:alpine

# Copy nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Expose ports 80 and 443
EXPOSE 80 443