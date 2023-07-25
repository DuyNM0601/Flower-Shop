/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mydao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import mybasicobject.Order;
import mybasicobject.OrderDetail;
import mylib.DBUtils;

/**
 *
 * @author ASUS
 */
public class OrderDao {

    public static ArrayList<Order> getOrders(String email) {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && email != null) {
                String sql = "select OrderID,OrdDate,shipDate,Orders.status,Orders.accID as accID,email\n"
                        + "from Orders join Accounts on Orders.accID = Accounts.accID where email like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipDate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("accID");
                        Order order = new Order(orderID, orderDate, shipDate, status, accID);
                        list.add(order);
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

    public static ArrayList<Order> getOrders() {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,OrdDate,shipDate,status,accID\n"
                        + "from Orders";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipDate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("accID");
                        Order order = new Order(orderID, orderDate, shipDate, status, accID);
                        list.add(order);
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
    
    public static ArrayList<Order> getOrders(int id) {
        Connection cn=null;
        Order ord=null;
        ArrayList<Order> list=new ArrayList<>();
        try {
            cn=DBUtils.makeConnection();
            if (cn!=null) {
                String sql = "select o.OrderID,o.OrdDate,o.shipdate,o.status,o.AccID\n"
                        + "from dbo.Orders o\n"
                        + "join dbo.Accounts a on o.AccID=a.accID\n"
                        + "where o.OrderID=?";
                PreparedStatement pst=cn.prepareStatement(sql);
                pst.setInt(1,id);
                if (id==0) {
                    sql = "select o.OrderID,o.OrdDate,o.shipdate,o.status,o.AccID\n"
                        + "from dbo.Orders o\n"
                        + "join dbo.Accounts a on o.AccID=a.accID\n";
                    pst=cn.prepareStatement(sql);
                }
                ResultSet rs=pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int status = rs.getInt("status");
                        int accid = rs.getInt("AccID");
                        ord = new Order(orderID, orderDate, shipDate, status, accid);
                        list.add(ord);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn!=null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }


    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select DetailId,OrderID,PID,PName,price,imgPath,quantity\n"
                        + "from OrderDetails,Plants\n"
                        + "where OrderID= ? and OrderDetails.FID=Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int detailID = rs.getInt("DetailID");
                        int plantID = rs.getInt("PID");
                        String plantName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail orderdetail = new OrderDetail(detailID, orderID, plantID, plantName, price, imgPath, quantity);
                        list.add(orderdetail);
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

    public static Order getOrder(int orderID) {
        Order ord = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,OrdDate,shipDate,status,accID\n"
                        + "from Orders where OrderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipDate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("accID");
                        ord = new Order(orderID, orderDate, shipDate, status, accID);
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
        return ord;
    }

    public static boolean updateOrderStatus(int orderID, int status) throws SQLException {
        Connection cn = null;
        Order ord = null;
        boolean test = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Orders] set status = ? where OrderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderID);
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

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0;
                int orderid = 0;  //off autocomit
                //get account id by email
                String sql = "select accID\n"
                        + "from Accounts where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accid = rs.getInt("accID");
                }
                //insert a new order
                System.out.println("accountid: " + accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date: " + d);
                sql = "insert into Orders(OrdDate,status,accID)\n"
                        + "values (?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                //get order id that is the largest number
                sql = "select top 1 OrderID from Orders \n"
                        + "order by OrderID desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("orderID");
                }
                //insert a new order detail
                System.out.println("orderid: " + orderid);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert into OrderDetails(OrderID,FID,quantity)\n"
                            + "values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("khong chen order duoc");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static ArrayList<Order> getOrders(String from, String to) {
        Connection cn = null;
        Order ord = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,OrdDate,shipdate,Orders.status,Orders.accID\n"
                        + "from Orders join Accounts on Orders.accID=Accounts.accID\n"
                        + "where OrdDate between ? and ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, from);
                pst.setString(2, to);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int status = rs.getInt("status");
                        int accid = rs.getInt("accID");
                        ord = new Order(orderID, orderDate, shipDate, status, accid);
                        list.add(ord);
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
}
