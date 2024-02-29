package Utils;

import entity.User;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public static User createUser(User user) {
        final String CREATE_USER_QUERY = "INSERT INTO users (email, userName, password) VALUES (?, ?, ?);";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement preStmt = conn.prepareStatement(CREATE_USER_QUERY, Statement.RETURN_GENERATED_KEYS)) {

            preStmt.setString(1, user.getEmail());
            preStmt.setString(2, user.getUserName());
            preStmt.setString(3, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            preStmt.executeUpdate();

            try (ResultSet rs = preStmt.getGeneratedKeys()) {
                if (rs.next()) {
                    user.setId(rs.getInt(1));
                }
            }

            return user;

        } catch (SQLException ex) {
            System.out.println("Problem with creating User");
            ex.printStackTrace();
            throw new RuntimeException("Error with creating User", ex);
        }
    }

    public static User read(int userId) {
        final String SELECT_USER_BY_ID_QUERY = "SELECT * FROM users WHERE id = " + userId;

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement preStmt = conn.prepareStatement(SELECT_USER_BY_ID_QUERY);
             ResultSet resultSet = preStmt.executeQuery()) {

            User userToRead = new User();

            if (resultSet.next()) {
                userToRead.setId(resultSet.getInt("id"));
                userToRead.setEmail(resultSet.getString("email"));
                userToRead.setUserName(resultSet.getString("username"));
                userToRead.setPassword(resultSet.getString("password"));

                System.out.println("Loading data -possitive");
                return userToRead;
            } else {
                System.out.println("User with ID " + userId + " not found");
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Problem with loading data");
            return null;
        }
    }


    public static void update(User user) {
        String UPDATE_USER_QUERY = "UPDATE users SET email = ?, username = ?, password = ? WHERE id = ?;";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement preStmnt = conn.prepareStatement(UPDATE_USER_QUERY)) {

            preStmnt.setInt(4, user.getId());
            preStmnt.setString(1, user.getEmail());
            preStmnt.setString(2, user.getUserName());
            preStmnt.setString(3, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));

            preStmnt.executeUpdate();

            System.out.println("Update -complete");
        } catch (SQLException ex) {
            System.out.println("Problem with updating data");
            ex.printStackTrace();
        }
    }


    public static void delete(int userId) {
        String DELETE_USER_QUERY = "DELETE FROM users WHERE id = ?";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement preStmt = conn.prepareStatement(DELETE_USER_QUERY)) {

            preStmt.setInt(1, userId);

            preStmt.executeUpdate();
            System.out.println("User has been deleted");
        } catch (SQLException ex) {
            System.out.println("Problem with deleteing User");
            ex.printStackTrace();
        }
    }

    public static List<User> findAll() {
        String SELECT_ALL_USERS = "SELECT * FROM users;";
        List<User> allUsers = new ArrayList<>();


        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement preStmt = conn.prepareStatement(SELECT_ALL_USERS);
            ResultSet rs = preStmt.executeQuery();

            while (rs.next()) {
                User readUser = new User();
                readUser.setId(rs.getInt("id"));
                readUser.setEmail(rs.getString("email"));
                readUser.setUserName(rs.getString("username"));
                readUser.setPassword(rs.getString("password"));

                allUsers.add(readUser);
            }

            return allUsers;
        } catch (SQLException ex) {
            System.out.println("Problems with loading data");
            ex.printStackTrace();
        }

        return null;
    }

}
