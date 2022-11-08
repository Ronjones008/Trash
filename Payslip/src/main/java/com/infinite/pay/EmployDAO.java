package com.infinite.pay;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class EmployDAO {
	
	SessionFactory sessionFactory;
	
	//AddEmploy
	
	public String addEmploy(Employ employ) {
	    sessionFactory = SessionHelper.getSession();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Employ.class);
		double  sal = employ.getSalary() ;
		double hra = (sal*0.02);
		employ.setHra(hra);
		double da= (sal*0.0125);
		employ.setDa(da);
		double ta = (sal*0.0095);
		employ.setTa(ta);
		double tax = (sal*0.0023);
		employ.setTax(tax);
		double pf = (sal*0.03);
		employ.setPf(pf);
		double gross = sal + hra + da + ta;
		employ.setGross(gross);
		double netpay = gross - tax - pf;
		employ.setNetPay(netpay);
		employ.setLeaveAvailable(16);
		Transaction transaction = session.beginTransaction();
		session.save(employ);
		transaction.commit();
		session.close();
		return "Employ Added...";
	}
	
	//Apply Leave 
	
	public String applyLeave(LeaveTable leaveTable) {
		sessionFactory = SessionHelper.getSession();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(LeaveTable.class);
		
		long sdate = leaveTable.getLeaveStartDate().getTime();
		long edate = leaveTable.getLeaveEndDate().getTime();
		
		long diff =  edate - sdate;
		long m = diff/(1000*24*60*60);
		int days=(int)m;
		days=days+1;
		
		leaveTable.setNoOfDays(days);
	
		int no = leaveTable.getNoOfDays();
		if(no > 3) {
			leaveTable.setLossOfPay( no - 3 );
		}
		else {
			leaveTable.setLossOfPay(0);
		}
		
		Transaction transaction = session.beginTransaction();
		session.save(leaveTable);
		transaction.commit();
		session.close();
		return "Leave Applyed....";
		
	}
	

	
	//date
		public Date convertDate(java.util.Date dt) {
			java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
			return sqlDate;
		}
	

}
