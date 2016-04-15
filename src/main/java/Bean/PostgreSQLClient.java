package Bean;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class PostgreSQLClient {

    public PostgreSQLClient() {
        try {
            initialize();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }

    /**
     * Grab text from PostgreSQL
     *
     * @return List of Strings of text from PostgreSQL
     * @throws Exception
     */
    public int addAccount(Account bean) throws Exception {
        String sql = "INSERT INTO Account (phoneNum,password,fname,lname) VALUES (?,?,?,?)";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);

            statement.setString(1, bean.getPhoneNum());
            statement.setString(2, bean.getPass());
            statement.setString(3, bean.getFname());
            statement.setString(4, bean.getLname());
            statement.addBatch();

            int[] rows = statement.executeBatch();
            connection.commit();

            return rows.length;
        } catch (SQLException e) {
            SQLException next = e.getNextException();

            if (next != null) {
                throw next;
            }

            throw e;
        } finally {
            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
    }

    public int addManager(Manager bean) throws Exception {
        String sql = "INSERT INTO Managers (idCandidates,username,password,fname,lname) VALUES (?,?,?,?,?)";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);

            statement.setInt(1, bean.getIdCandidates());
            statement.setString(2, bean.getUname());
            statement.setString(3, bean.getPassword());
            statement.setString(4, bean.getFname());
            statement.setString(5, bean.getLname());
            statement.addBatch();

            int[] rows = statement.executeBatch();
            connection.commit();

            return rows.length;
        } catch (SQLException e) {
            SQLException next = e.getNextException();

            if (next != null) {
                throw next;
            }

            throw e;
        } finally {
            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
    }

    public int deleteAll() throws Exception {
        String sql = "DELETE FROM posts WHERE TRUE";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            return statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
    }

    private static Connection getConnection() throws Exception {
        Map<String, String> env = System.getenv();

        if (env.containsKey("VCAP_SERVICES")) {
            // we are running on cloud foundry, let's grab the service details from vcap_services
            JSONParser parser = new JSONParser();
            JSONObject vcap = (JSONObject) parser.parse(env.get("VCAP_SERVICES"));
            JSONObject service = null;

            // We don't know exactly what the service is called, but it will contain "postgresql"
            for (Object key : vcap.keySet()) {
                String keyStr = (String) key;
                if (keyStr.toLowerCase().contains("postgresql")) {
                    service = (JSONObject) ((JSONArray) vcap.get(keyStr)).get(0);
                    break;
                }
            }

            if (service != null) {
                JSONObject creds = (JSONObject) service.get("credentials");
                String name = (String) creds.get("name");
                String host = (String) creds.get("host");
                Long port = (Long) creds.get("port");
                String user = (String) creds.get("user");
                String password = (String) creds.get("password");

                String url = "jdbc:postgresql://" + host + ":" + port + "/" + name;

                return DriverManager.getConnection(url, user, password);
            }
        }

        throw new Exception("No PostgreSQL service URL found. Make sure you have bound the correct services to your app.");
    }

    private void initialize() throws Exception {
        String sql = "CREATE TABLE IF NOT EXISTS Account("
                + "phoneNum varchar(20) primary key, "
                + "password varchar(20), "
                + "fname varchar(10), "
                + "lname varchar(10) "
                + ");";
        createTables(sql);
        sql = "CREATE TABLE IF NOT EXISTS Candidates("
                + "idCandidates int primary key, "
                + "fname varchar(10), "
                + "lname varchar(10) "
                + ");";
        createTables(sql);
        sql = "CREATE TABLE IF NOT EXISTS Subscription ("
                + "phoneNum varchar(20) references Account(phoneNum), "
                + "idCandidates int references Candidates(idCandidates), "
                + "fname varchar(10), "
                + "lname varchar(10) "
                + ");";
        createTables(sql);
        sql = "CREATE TABLE IF NOT EXISTS Managers ("
                + "idManagers serial primary key, "
                + "idCandidates int references Candidates(idCandidates), "
                + "username varchar(10), "
                + "password varchar(10), "
                + "fname varchar(10), "
                + "lname varchar(10) "
                + ");";
        createTables(sql);
        /*
        sql = "CREATE TABLE IF NOT EXISTS Alerts ("
                + "idAlerts serial primary key, "
                + "idCandidates int references Managers(idCandidates), "
                + "idManagers  int references Managers(idManagers), "
                + "message text "
                + ");";
        createTables(sql);
         */
        insertCandidates();
    }

    private void createTables(String sql) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
    }

    private int insertCandidates() throws Exception {
        String sql = "INSERT INTO Candidates (idCandidates,fname,lname) VALUES (?,?,?);";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            statement.setInt(1, 1);
            statement.setString(2, "Rodrigo");
            statement.setString(3, "Duterte");
            statement.addBatch();
            statement.setInt(1, 2);
            statement.setString(2, "Jejomar");
            statement.setString(3, "Binay");
            statement.addBatch();
            statement.setInt(1, 3);
            statement.setString(2, "Miriam");
            statement.setString(3, "Santiago");
            statement.addBatch();
            statement.setInt(1, 4);
            statement.setString(2, "Grace");
            statement.setString(3, "Poe");
            statement.addBatch();
            statement.setInt(1, 5);
            statement.setString(2, "Mar");
            statement.setString(3, "Roxas");
            statement.addBatch();
            int[] rows = statement.executeBatch();
            connection.commit();
            return rows.length;
        } catch (SQLException e) {
            SQLException next = e.getNextException();

            if (next != null) {
                throw next;
            }
            throw e;
        } finally {
            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
    }

    public int insertAlert(Alerts bean) throws Exception {
        String sql = "INSERT INTO Alerts (idCandidates,idManagers,messages) VALUES (?,?,?);";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);

            statement.setInt(1, bean.getIdCandidates());
            statement.setInt(2, bean.getIdManagers());
            statement.setString(3, bean.getMessage());

            statement.addBatch();

            int[] rows = statement.executeBatch();
            connection.commit();

            return rows.length;
        } catch (SQLException e) {
            SQLException next = e.getNextException();

            if (next != null) {
                throw next;
            }

            throw e;
        } finally {
            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
    }

    public ArrayList<Candidate> getAllCandidates() throws Exception {
        String sql = "SELECT * FROM Candidates;";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet results = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            results = statement.executeQuery();
            ArrayList<Candidate> beans = new ArrayList<>();
            while (results.next()) {
                Candidate bean = new Candidate();
                bean.setIdCandidate(results.getInt("idCandidates"));
                bean.setFname(results.getString("fname"));
                bean.setLname(results.getString("lname"));
                beans.add(bean);
            }

            return beans;
        } finally {
            if (results != null) {
                results.close();
            }

            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
    }

    public int insertSubscribe(int idCandidate, String phoneNum) throws Exception {
        String sql = "INSERT INTO Account (idCandidates,phoneNum) VALUES (?,?)";
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            statement.setInt(1, idCandidate);
            statement.setString(2, phoneNum);
            statement.addBatch();

            int[] rows = statement.executeBatch();
            connection.commit();

            return rows.length;
        } catch (SQLException e) {
            SQLException next = e.getNextException();

            if (next != null) {
                throw next;
            }

            throw e;
        } finally {
            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
    }

    /*
    public Alerts getAlerts(String phoneNum) throws Exception {
        String sql = "select a.* from alerts a, account_has_candidates ac where ac.idCandidates = a.idCandidates and ac.phoneNum = ?;";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet results = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            statement.setString(1, phoneNum);
            results = statement.executeQuery();
            ArrayList<Alerts> beans = new ArrayList<>();
            while (results.next()) {

            }
            return beans;
            connection.commit();

        } catch (SQLException e) {
            SQLException next = e.getNextException();

            if (next != null) {
                throw next;
            }

            throw e;
        } finally {
            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }
     */
    public Account AloginCheck(Account bean, PrintWriter out) throws Exception {
        String sql = "SELECT * FROM Account where phoneNum = ? and password = ?;";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet results = null;

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, bean.getPhoneNum());
            statement.setString(2, bean.getPass());
            results = statement.executeQuery();
            //out.println("hello2");
            Account a = new Account();

            while (results.next()) {
                a.setFname(results.getString("fname"));
                a.setLname(results.getString("lname"));
                a.setPhoneNum(results.getString("phoneNum"));
            }

            return a;

        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            if (results != null) {
                results.close();
            }

            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }

        }
        return null;
    }

    public Manager MloginCheck(Manager bean, PrintWriter out) throws Exception {
        String sql = "SELECT * FROM Managers where username = ? and password = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet results = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, bean.getUname());
            statement.setString(2, bean.getPassword());
            results = statement.executeQuery();
            Manager a = new Manager();
			while (results.next()) {
            a.setFname(results.getString("fname"));
            a.setLname(results.getString("lname"));
            a.setIdCandidates(results.getInt("idCandidates"));
            a.setIdManager(results.getInt("idManagers"));
			System.out.println(a.getFname());
			}
            System.out.println(a.getFname());
            return a;
        } finally {
            if (results != null) {
                results.close();
            }

            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
            //return null;
        }
    }
}
