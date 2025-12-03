# Giai đoạn 1: Build ứng dụng (Sử dụng image maven ổn định)
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app

# Copy toàn bộ mã nguồn
COPY . .

# Chạy lệnh Maven để tạo file .war (Bỏ qua kiểm thử)
RUN mvn clean package -DskipTests

# Giai đoạn 2: Tạo Image Runtime với Tomcat
FROM tomcat:9.0-jdk17-temurin

# Xóa các ứng dụng demo mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file .war đã build vào thư mục webapps của Tomcat
# Nó sẽ được triển khai thành ứng dụng ROOT (đường dẫn /)
# Thay WAR_FILE_NAME.war bằng tên file .war thực tế của bạn
COPY --from=build /app/target/WAR_FILE_NAME.war /usr/local/tomcat/webapps/ROOT.war

# Port mặc định của Tomcat là 8080
EXPOSE 8080

# Tomcat sẽ tự động chạy khi container khởi động
CMD ["catalina.sh", "run"]