package proyecto_gm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    // Datos de la conexión
    private static final String USERNAME = "root";
    private static final String PASSWORD = "sasasa";
    private static final String CONN_STRING = "jdbc:mysql://localhost:3306/gmingenieros";

    private static Connection conn = null;

    private ConexionBD() {
        // Constructor privado para evitar que se cree una instancia de esta clase
    }

    public static Connection getConnection() {
        if (conn == null) {
            try {
                // Carga el controlador de MySQL
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Crea la conexión a la base de datos
                conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
            } catch (ClassNotFoundException | SQLException e) {
                // Manejo de errores
                System.err.println("Error en la conexión: " + e.getMessage());
            }
        }
        return conn;
    }

    public static void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (SQLException e) {
                System.err.println("Error al cerra la conexión: " + e.getMessage());
            }
        }
    }
}
