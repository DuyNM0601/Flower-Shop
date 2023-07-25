/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mybasicobject;

import java.util.ArrayList;
import java.util.Random;
import mydao.AccountDao;
import mydao.OrderDao;
/**
 *
 * @author ASUS
 */
public class testConnection {
    public static void main(String[] args) throws Exception {
        //test login
        Account acc = AccountDao.getAccount("admin@gmail.com", "admin");
        if (acc!=null) {
            if (acc.getRole()==1) 
                System.out.println("i am an admin ");
            else
                System.out.println("i am a user");
        }
        else System.out.println("login fail");
        
        //Test the first challenge
//        ArrayList<Account> list = AccountDao.getAccounts();
//        for (Account account : list) {
//            System.out.println(account.getAccID() + ", " + account.getEmail() + ", " + account.getPassword() + ", " + account.getFullname());
//        }
        
        //Test the second challenge
//        if (AccountDao.updateAccountStatus("test@gmail.com", 0)) 
//            System.out.println("Update status successfully");
//        else
//            System.out.println("Can't update status");
//        
        //Test the third challenge
//        if (AccountDao.updateAccount("test@gmail.com", "test","test","123456")) 
//            System.out.println("Updated profile");
//        else
//            System.out.println("Update profile fail");

    //Test the fourth challenge
//        if (AccountDao.insertAccount("test2@gmail.com", "222222", "Chi Pheo", "123123123", 1, 0)) 
//            System.out.println("Added new account");
//        else
//            System.out.println("Insert a new account fail");
    }
}
