/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mydao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mybasicobject.Category;
import mylib.DBUtils;

/**
 *
 * @author ASUS
 */
public class CategoryDao {

    public static ArrayList<Category> getCategories() {
        Connection cn = null;
        ArrayList<Category> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select CateID,CateName\n"
                        + "from dbo.Categories";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        Category cate = new Category(CateID, CateName);
                        list.add(cate);
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

    public static ArrayList<Category> getCategories(String name) {
        Connection cn = null;
        ArrayList<Category> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select CateID,CateName\n"
                        + "from dbo.Categories\n"
                        + "where CateName like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + name + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        Category cate = new Category(CateID, CateName);
                        list.add(cate);
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
