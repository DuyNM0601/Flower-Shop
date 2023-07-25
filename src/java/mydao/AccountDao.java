/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mydao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import mybasicobject.Account;
import mylib.DBUtils;

/**
 *
 * @author ASUS
 */
public class AccountDao {

    //ham nay de lay 1 dong trong bang tblUser
    //dua vao userid, pwd
    public static Account getAccount(String email, String password) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select [accID],[email],[password],[fullname],[status],[phone],[role]\n"
                        + "from Accounts\n"
                        + "where [status]=1 and [email] = ? and [password] = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    int Status = rs.getInt("status");
                    String Phone = rs.getString("phone");
                    int Role = rs.getInt("role");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }

    public static Account getAccount(String token) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select accID,email,password,fullname,status,phone,role\n"
                        + "from Accounts where token = ?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, token);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    int Status = rs.getInt("status");
                    String Phone = rs.getString("phone");
                    int Role = rs.getInt("role");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }

    public static ArrayList<Account> getAccounts(String name) throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [accID],[email],[password],[fullname],[status],[phone],[role]\n"
                        + "from Accounts\n"
                        + "where [fullname] = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                if (name.equals("")) {
                    sql = "select [accID],[email],[password],[fullname],[status],[phone],[role]\n"
                        + "from Accounts";
                    pst=cn.prepareStatement(sql);
                }
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int accID = rs.getInt("accID");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String fullname = rs.getString("fullname");
                        int status = rs.getInt("status");
                        String phone = rs.getString("phone");
                        int role = rs.getInt("role");
                        Account a = new Account(accID, email, password, fullname, status, phone, role);
                        list.add(a);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    public static ArrayList<Account> getAccounts1() throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [accID],[email],[password],[fullname],[status],[phone],[role]\n"
                        + "from Accounts\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int accID = rs.getInt("accID");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String fullname = rs.getString("fullname");
                        int status = rs.getInt("status");
                        String phone = rs.getString("phone");
                        int role = rs.getInt("role");
                        Account a = new Account(accID, email, password, fullname, status, phone, role);
                        list.add(a);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static boolean updateAccountStatus(String email, int Status) throws SQLException {
        Connection cn = null;
        boolean test = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Accounts] set status = ? where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Status);
                pst.setString(2, email);
                int rowsUpdated = pst.executeUpdate();
                if (rowsUpdated > 0) {
                    test = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }
        return test;
    }

    public static boolean updateAccount(String email, String newPassword, String newFullname, String newPhone) throws SQLException {
        Connection cn = null;
        Account acc = null;
        boolean test = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Accounts] set [password] = ?, [fullname] = ?, [phone] = ?\n"
                        + "where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newPassword);
                pst.setString(2, newFullname);
                pst.setString(3, newPhone);
                pst.setString(4, email);
                int rowsUpdated = pst.executeUpdate();
                if (rowsUpdated > 0) {
                    test = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }
        return test;
    }

    public static boolean updateAccount1(String email, String newFullname, String newPhone) throws SQLException {
        Connection cn = null;
        Account acc = null;
        boolean test = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Accounts] set [fullname] = ?, [phone] = ?\n"
                        + "where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newFullname);
                pst.setString(2, newPhone);
                pst.setString(3, email);
                int rowsUpdated = pst.executeUpdate();
                if (rowsUpdated > 0) {
                    test = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }
        return test;
    }

    public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newStatus, int newRole) {
        Connection cn = null;
        boolean test = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "insert Accounts(email,password,fullname,phone,status,role)\n"
                        + "values (?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, newEmail);
                pst.setString(2, newPassword);
                pst.setString(3, newFullname);
                pst.setString(4, newPhone);
                pst.setInt(5, newStatus);
                pst.setInt(6, newRole);
                int rowsInsert = pst.executeUpdate();
                if (rowsInsert > 0) {
                    test = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return test;
    }

    public static boolean updateToken(String token, String email) throws SQLException {
        Connection cn = null;
        Account acc = null;
        boolean test = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Accounts set token = ?\n"
                        + "where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                pst.setString(2, email);
                int rowsUpdated = pst.executeUpdate();
                if (rowsUpdated > 0) {
                    test = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }
        return test;
    }

    public static String randomtoken() {
        int length = 8;
        Random random = new Random();
        StringBuilder builder = new StringBuilder();

        for (int i = 0; i < length; i++) {
            char c;
            if (random.nextBoolean()) {
                // Sinh ký tự chữ ngẫu nhiên
                c = (char) (random.nextInt(26) + 'a');
            } else {
                // Sinh số ngẫu nhiên
                c = (char) (random.nextInt(10) + '0');
            }
            builder.append(c);
        }
        String randomString = builder.toString();
        return randomString;
    }

}
