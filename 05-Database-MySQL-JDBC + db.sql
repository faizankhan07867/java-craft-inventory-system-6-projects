CREATE DATABASE craftdb;
USE craftdb;
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DOUBLE,
    stock INT
);
INSERT INTO products VALUES (101, 'Terracotta Vase', 899, 15);





import java.sql.*;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/craftdb";
        String user = "root";
        String pass = "yourpassword";  // Apna MySQL password daal dena

        try {
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM products");

            System.out.println("ID  Name                 Price    Stock");
            while (rs.next()) {
                System.out.printf("%d   %-20s ₹%.2f   %d%n",
                    rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getInt("stock"));
            }
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
