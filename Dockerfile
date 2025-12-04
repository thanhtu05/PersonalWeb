# Giai đoạn Runtime: Sử dụng Nginx nhẹ (Alpine Linux)
FROM nginx:alpine

# Xóa các file mẫu mặc định của Nginx để tránh xung đột
RUN rm -rf /usr/share/nginx/html/*

# --- TÙY CHỈNH CẤU HÌNH ĐỂ TRÁNH LỖI FAVICON TRONG LOG ---

# Dùng lệnh RUN để chỉnh sửa file cấu hình mặc định (default.conf)
# và thêm một 'location' block để xử lý yêu cầu favicon.ico
# Nó trả về mã 204 (No Content) ngay lập tức và tắt log cho yêu cầu này.
RUN echo '    location = /favicon.ico { log_not_found off; access_log off; return 204; }' >> /etc/nginx/conf.d/default.conf

# --- COPY MÃ NGUỒN CỦA BẠN ---

# COPY toàn bộ nội dung web tĩnh của bạn (HTML, CSS, JS, Images, etc.)
# từ thư mục gốc của dự án vào thư mục phục vụ web của Nginx
COPY . /usr/share/nginx/html

# Nginx lắng nghe trên port 80 mặc định
EXPOSE 80

# Lệnh chạy mặc định của Nginx
CMD ["nginx", "-g", "daemon off;"]