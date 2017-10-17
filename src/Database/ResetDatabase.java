package Database;

import org.apache.ibatis.jdbc.ScriptRunner;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResetDatabase {

    private static String getWorkingDir() {
        return System.getProperty("user.dir");
    }

    private static Connection getConnection(Boolean useDefaultDb) {
        try {
            if (useDefaultDb) {
                return DriverManager.getConnection(
                        "jdbc:mysql://"
                                + System.getenv("DATABASE_HOST") + ":"
                                + System.getenv("DATABASE_PORT") + "/"
                                + System.getenv("DATABASE_NAME") + "?useSSL=false&serverTimezone=GMT",
                        System.getenv("DATABASE_USER"),
                        System.getenv("DATABASE_PASSWORD"));
            } else {
                return DriverManager.getConnection(
                        "jdbc:mysql://"
                                + System.getenv("DATABASE_HOST") + ":"
                                + System.getenv("DATABASE_PORT") + "/?useSSL=false&serverTimezone=GMT",
                        System.getenv("DATABASE_USER"),
                        System.getenv("DATABASE_PASSWORD"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static void executeSql(String sqlFilePath) {
        try (InputStreamReader file = new InputStreamReader(new FileInputStream(sqlFilePath))) {
            ScriptRunner runner = new ScriptRunner(getConnection(true));
            runner.runScript(file);
            runner.closeConnection();
            file.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void deleteDatabase() {
        try {
            PreparedStatement deleteStatement = getConnection(false)
                    .prepareStatement("DROP database " + System.getenv("DATABASE_NAME"));
            deleteStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void createDatabase() {
        try {
            PreparedStatement createStatement = getConnection(false)
                    .prepareStatement("CREATE database " + System.getenv("DATABASE_NAME"));
            createStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        //Wipe database
        deleteDatabase();
        System.out.println("Deleted database ...");

        //Create new
        createDatabase();
        System.out.println("Create new database ...");

        //Run script
        String sqlFilePath = getWorkingDir() + "/src/Database/sql.sql";
        executeSql(sqlFilePath);
        System.out.println("Sql script done!");
    }

}
