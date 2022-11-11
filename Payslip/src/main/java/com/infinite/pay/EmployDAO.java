package com.infinite.pay;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
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
			leaveTable.setLossOfPay(no -3);		
		}
		else {
			leaveTable.setLossOfPay(0);
		}
		
		Transaction transaction = session.beginTransaction();
		session.save(leaveTable);
		transaction.commit();
		session.close();
		
		int emp = leaveTable.getEmpno();
		List<Employ> emplist = searchEmploy(emp);
		Employ record = emplist.get(0);
	

		record.setLeaveAvailable((record.getLeaveAvailable()-3));
		session = sessionFactory.openSession();
		Transaction transaction1 = session.beginTransaction();
		session.update(record);
		transaction1.commit();
		
		return "Leave Applyed....";
		
	}
	
	//SearchtoEmploy
	
	public List<Employ> searchEmploy(int empno){
		sessionFactory = SessionHelper.getSession();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Employ where empno = '"+empno+"'");
		List<Employ> emplist = query.list();
	    return emplist;	
	}
	
	//SearchtoLeave
	
	public List<LeaveTable> searchLeave(int empno){
		sessionFactory = SessionHelper.getSession();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from LeaveTable where empno = '"+empno+"'");
		List<LeaveTable> leavelist = query.list();
		return leavelist;
	}
	
	
	public double takeHome(double salary) {
		
		sessionFactory = SessionHelper.getSession();
		Session session = sessionFactory.openSession();
		LeaveTable leaveTable = new LeaveTable();
		Employ employ = new Employ();
		int month=11;
		int empno=4;
		Object ob = payslip(4, 11);
		long lop = (Long)ob;
		lop = lop - 3;
		double lossofpay = (salary/30.43) * lop;
		
		Query query =session.createQuery("from LeaveTable where empno=:empno AND (MONTH(leaveStartDate)=:month AND MONTH(leaveEndDate)=:month)").setParameter("empno", empno)
				.setParameter("month", month);
		
		List<LeaveTable> leavelist = query.list();
		
		LeaveTable lastRecord = leavelist.get(leavelist.size()-1);
		lastRecord.setLossOfPay(lossofpay);
	
		Transaction transaction = session.beginTransaction();
		session.update(lastRecord);
		transaction.commit();
//		leaveTable.setLossOfPay(lossofpay);
		
		List<Employ> emplist = searchEmploy(4);
		
		double ntp = emplist.get(0).getNetPay();
		
		double take = ntp - lossofpay;
		
		return  take;
	}
	public Object payslip(int empno,int month) {
		Employ employ = new Employ();
		LeaveTable leaveTable = new LeaveTable();
		sessionFactory = SessionHelper.getSession();
		Session session = sessionFactory.openSession();
		Query query=session.createQuery("select sum(noOfDays) from LeaveTable where empno=:empno AND (MONTH(leaveStartDate)=:month AND MONTH(leaveEndDate)=:month)").setParameter("empno", empno)
				.setParameter("month", month);
		List<Long> count = query.list();	
		

		return count.get(0);
	}
	
	
	
	
	
	//date
		public Date convertDate(java.util.Date dt) {
			java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
			return sqlDate;
		}
	

}
