# Sử dụng Nginx làm web server
FROM nginx:alpine

# Xóa file cấu hình mặc định của Nginx
RUN rm -rf /etc/nginx/conf.d/*

# Tạo file cấu hình Nginx đơn giản để phục vụ web tĩnh
# Đây là một ví dụ đơn giản, bạn có thể cần file nginx.conf riêng nếu muốn cấu hình phức tạp
RUN echo 'server { listen 80; root /usr/share/nginx/html; index index.html; }' > /etc/nginx/conf.d/default.conf

# Xóa các file mặc định của Nginx
RUN rm -rf /usr/share/nginx/html/*

# COPY toàn bộ nội dung web của bạn (index.html, projects.html, css/, images/, js/)
# từ thư mục gốc của dự án vào thư mục phục vụ web của Nginx
COPY . /usr/share/nginx/html

# Nginx lắng nghe trên port 80 mặc định
EXPOSE 80

# Nginx tự động chạy
CMD ["nginx", "-g", "daemon off;"]