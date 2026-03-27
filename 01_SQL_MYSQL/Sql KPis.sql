CREATE VIEW loan_full_data AS select * from finance_1_cleaned Join finance_2_cleaned on finance_1_cleaned.id=finance_2_cleaned.id;

-- 1.Year wise loan amount Stats
SELECT 
    `Issued Year` AS loan_year,
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_loan_amount,
    AVG(loan_amnt) AS average_loan_amount
FROM finance_1_cleaned
GROUP BY `Issued Year`
ORDER BY loan_year;


-- 2.Grade and sub grade wise revol_bal
select
       grade,
       sub_grade,
       COUNT(finance_1_cleaned.id) AS total_loans,
       SUM(finance_2_cleaned.revol_bal) AS total_revolving_balance
from finance_1_cleaned 
join finance_2_cleaned on finance_1_cleaned.id=finance_2_cleaned.id
GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;


-- 3.Total Payment for Verified Status Vs Total Payment for Non Verified Status
Select 
	verification_status ,
     COUNT(*) AS total_loans,
    Sum(total_pymnt) As Total_Payment 
from finance_1_cleaned 
join finance_2_cleaned on finance_1_cleaned.id=finance_2_cleaned.id 
group by verification_status;


-- 4.State wise and last_credit_pull_d wise loan status
select 
     addr_state AS State,
     last_credit_pull_d,
     COUNT(*) AS total_loans,
     loan_status
from finance_1_cleaned 
join finance_2_cleaned on finance_1_cleaned.id=finance_2_cleaned.id 
group by addr_state, last_credit_pull_d,loan_status
order by addr_state, last_credit_pull_d,loan_status;


-- 5.Home ownership Vs last payment date stats
select 
      home_ownership,
      last_pymnt_d AS Last_Payment_Date,
	  COUNT(*) AS total_loans,
	  SUM(total_pymnt) AS total_payment
from finance_1_cleaned 
join finance_2_cleaned on finance_1_cleaned.id=finance_2_cleaned.id 
group by home_ownership, last_pymnt_d
order by home_ownership,last_pymnt_d;


-- 6. Total Payments vs Total Funded Amount
Select 
      member_id,
      Sum(total_pymnt) AS Total_Received,
      sum(funded_amnt) AS Total_Funded_Amount
from finance_1_cleaned 
join finance_2_cleaned on finance_1_cleaned.id=finance_2_cleaned.id 
group by total_pymnt,funded_amnt,member_id;


-- 7. Top 5 states by total payments
Select 
      addr_state AS State,
      Sum(total_pymnt) AS Total_Payment,
      COUNT(*) AS total_loans
from finance_1_cleaned 
join finance_2_cleaned on finance_1_cleaned.id=finance_2_cleaned.id 
group by addr_state
order by Total_Payment desc
limit 5;


-- 8. State-wise Repayment Efficiency
select 
      addr_state AS State,
      SUM(funded_amnt) AS Total_Funded,
      SUM(total_pymnt) AS Total_Paid,
      round(sum(total_pymnt)/sum(funded_amnt)*100,2) AS Repayment_Efficiency_Percent
from finance_1_cleaned 
join finance_2_cleaned on finance_1_cleaned.id=finance_2_cleaned.id 
group by State
order by Repayment_Efficiency_Percent desc;
      

-- 9. Year-wise Average Interest Rate 
Select 
	`Issued Year` AS Issue_Year,
    round(Avg(Interest_rate),2) As Avg_Interest_Rate 
from finance_1_cleaned 
group by `Issued Year`
order by `Issued Year`;


-- 10. Year-wise Loan Count and Average Funded Amount
select 
     `Issued Year` AS Issue_Year,
	  COUNT(id) AS total_loans,
      Round(avg(funded_amnt),2)
from finance_1_cleaned 
group by `Issued Year`
order by `Issued Year`;

     
      





