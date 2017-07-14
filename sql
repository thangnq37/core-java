package DatabaseConnect;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class DataAccess {
	Connection cnn = null;
	Statement st= null;
	PreparedStatement pSt = null;
	CallableStatement cSt = null;
	ResultSet rs = null;
	ArrayList<Employee> arrayEmloyee = null;
	PreparedStatement prstm = null;
	
	public Connection getConnect(){
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			cnn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=EmployeeDB1; username=sa; password=12345678");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		return cnn;
		
	}
	//========================================================================================
	// ================================	STATEMENT ============================================
	/**
	 *  Insert way Statement
	 * @param e
	 */
	public void InsertEmployee(Employee e){
		try {
			st = (Statement) getConnect().createStatement();
			st.executeUpdate("INSERT INTO Employee Values('"+e.getName()+"','"+e.getPhone()+"',"+e.getAge()+")"); //"INSERT INTO Employee Values('"+e.getName()+"','"+e.getPhone()+"',"+e.getAge()+")");
		} catch (SQLException e2) {
			// TODO: handle exception
			System.out.println(e2.getErrorCode());
		}
	}
	
	/**
	 * Select way statement
	 * @return
	 */
	public ArrayList<Employee> GetListEmployee(){
		try{
			st = getConnect().createStatement();
  			rs = st.executeQuery("SELECT * FROM Employee");
			arrayEmloyee = new ArrayList<Employee>();
			while(rs.next()){
				Employee a = new Employee(rs.getString("Name"), rs.getString("Phone"),rs.getInt("Age"));
				arrayEmloyee.add(a);
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			if(st!=null){
				try {
					st.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}
			if(cnn != null){
				try {
					cnn.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}
		}
		
		return arrayEmloyee;
	}
	
	public void DeleteEmployee(String name){
		try{
			st = this.getConnect().createStatement();
			int i = st.executeUpdate("Delete from Employee where name ='"+name+"'");
			if(i==0){
				System.out.println("Delete not success");
			}else{
				System.out.println("Delete success");
			}
		}catch(SQLException e){
			System.out.println(e);
			System.out.println(e.getErrorCode());
		}finally{
			if(st!=null){
				try {
					st.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}
			if(cnn!=null){
				try {
					cnn.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}
		}
		
	}
	
	public void UpdateEmployee(String idName,String name, String phone, int age){
		String qry = "UPDATE Employee set name = '"+name+"', phone ='"+phone+"', age="+age+" WHERE name = '"+idName+"'";
		try {
			st = getConnect().createStatement();
			int i = st.executeUpdate(qry);
			if(i>0){
				System.out.println("Update success");
			}else{
				System.out.println("Update not success");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(st!=null){
				try {
					st.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}
			if(cnn!=null){
				try {
					cnn.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}
		}
		
	}
	
	
	//=================================================================================================
	//=============================== PREPARE STATEMENT ===============================================
	
	public void InsertPreEmp(Employee e){
		String qry="INSERT INTO Employee VALUES(?,?,?)";
		try{
			pSt = getConnect().prepareStatement(qry);
			pSt.setString(1, e.getName());
			pSt.setString(2, e.getPhone());
			pSt.setInt(3, e.getAge());
			int i = pSt.executeUpdate();
			getConnect().commit();
			if(i>0){
				System.out.println("Insert prepare statement success");
			}else
				System.out.println("Insert prepare statement not success");
		}catch(SQLException ex){
			System.out.println(ex);
		}finally{
			if(pSt!=null){
				try {
					pSt.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			if(cnn!=null){
				try {
					cnn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
		
	}
	
	public void DeletePreEmployee(String name){
		String qry = "DELETE FROM Employee WHERE name=?";
		try{
			pSt = getConnect().prepareStatement(qry);
			pSt.setString(1, name);
			int kq = pSt.executeUpdate();
			if(kq > 0){
				System.out.println("Delete success");
			}else{
				System.out.println("Delete not success");
			}
		}catch(SQLException e){
			System.out.println(e);
		}finally{
			if(pSt!=null){
				try {
					pSt.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			if(cnn!=null){
				try {
					cnn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
	}
	
	public void UpdatePreEmployee(String name,Employee e){
		String qry = "UPDATE Employee SET name=?, phone=?, age=? Where name = ?";
		try{
			pSt = getConnect().prepareStatement(qry);
			pSt.setString(1, e.getName());
			pSt.setString(2, e.getPhone());
			pSt.setInt(3, e.getAge());
			pSt.setString(4, name);
			int i =pSt.executeUpdate();
			if(i>0){
				System.out.println("Update prepare success");
			}else
				System.out.println("Update prepare not success");
		}catch(SQLException ex){
			System.out.println(ex);
		}finally{
			if(pSt!=null){
				try {
					pSt.close();
				} catch (Exception e2) {
					// TODO: handle exception
					
				}
			}
			if(cnn!=null){
				try {
					cnn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					
				}
			}
		}
	}
	
	public ArrayList<Employee> SelectPreEmployee(){
		String qry = "SELECT * FROM Employee";
		try{
			pSt = getConnect().prepareStatement(qry);
			rs =pSt.executeQuery();
			arrayEmloyee = new ArrayList<Employee>();
			while(rs.next()){
				arrayEmloyee.add(new Employee(rs.getString("name"), rs.getString("phone"), rs.getInt("age")));
			}
		}catch(SQLException ex){
			System.out.println(ex);
		}finally{
			if(pSt!=null){
				try {
					pSt.close();
				} catch (Exception e2) {
					// TODO: handle exception
					
				}
			}
			if(cnn!=null){
				try {
					cnn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					
				}
			}
		}
		return arrayEmloyee;
	}
	
	//==================================================================================================
	//=============================== CALLABLE STATEMENT ===============================================
	public void InsertCallEmployee(Employee e){
		try{
			cSt = getConnect().prepareCall("insert_employee(?,?,?)");
			cSt.setString(1, e.getName());
			cSt.setString(2, e.getPhone());
			cSt.setInt(0, e.getAge());
			int i = cSt.executeUpdate();
			if(i>0){
				System.out.println("Insert callable success");
			}else{
				System.out.println("Insert callable not success");
			}
		}catch(SQLException ex){
			System.out.println(ex);
		}finally{
			if(cSt!=null){
				try {
					cSt.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			if(cnn != null){
				try{
					cnn.close();
				}catch(SQLException ex){
					System.out.println(ex);
				}
			}
		}
		
	}
	
	public void DeleteCallEmployee(String name){
		try{
			cSt = getConnect().prepareCall("{call delete_employee(?)}");
			cSt.setString(1, name);
			int i = cSt.executeUpdate();
			if(i>0){
				System.out.println("Insert callable success");
			}else{
				System.out.println("Insert callable not success");
			}
		}catch(SQLException ex){
			System.out.println(ex);
		}finally{
			if(cSt!=null){
				try {
					cSt.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			if(cnn != null){
				try{
					cnn.close();
				}catch(SQLException ex){
					System.out.println(ex);
				}
			}
		}
	}
	//=======================================================================================
	
}
