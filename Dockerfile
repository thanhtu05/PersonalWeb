# Giai đoạn Runtime: Sử dụng Tomcat và JDK 17
FROM tomcat:9.0-jdk17-temurin

# Xóa các ứng dụng demo mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# --- BƯỚC QUAN TRỌNG: COPY FILE WAR ---

# File .war của bạn phải nằm trong thư mục mà bạn chạy docker build
# Giả sử file WAR đã build của bạn có tên là 'my_app.war'
# THAY THẾ 'my_app.war' bằng tên file .war THỰC TẾ của dự án bạn muốn deploy.

COPY my_app.war /usr/local/tomcat/webapps/ROOT.war

# Port mặc định của Tomcat là 8080
EXPOSE 8080

# Tomcat sẽ tự động chạy khi container khởi động
CMD ["catalina.sh", "run"]