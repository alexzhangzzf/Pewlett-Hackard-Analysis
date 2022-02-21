# Pewlett Hackard Analysis
## Overview 
Pewlett Hackard is planning for upcoming retirement also known as “silver tsunami”. We help Pewlett Hackard to build a database for retiring employees and future hiring using SQL database. We have determined the number of retiring employees within each department for each title and identified employees for mentorship program which will allow experienced employees stepping back into a part-time role instead of retiring completely so they can mentor the newly hired employees.
## Results
### Analysis method 
- We create tables to show current employees who are retiring per title (employees who were born between year 1952 and 1955) and current employees eligible for mentorship program (employees who were born in 1965). 
### Major findings
- In Pewlett Hackard, there are 72,458 employees who will be retiring soon out of the total current employees which is 240,124. The company will face an issue of approximately one third of the employees retiring soon.
- The breakdown of the number of retiring employees for each role is in table 1. The positions with the most people retiring are senior engineers (25,916) and senior staff (24,926). Position with the least people leaving is manager, which are only two. <br/>
    Table 1. Retiring employees per title <br/>
    ![retiring employees per title](/Resources/retiring_titles.png)<br/>
-  A mentor eligibility table was created to show the current employees who are eligible to mentor new hires to help with the potential employee shortage in the future. We choose employees who are born in 1965 as the selection criteria, so they will retire about ten years later than the retiring employees in retiring table. There are 1,549 employees who is eligible for the mentor program
-  Comparing the number of retiring employees with mentors (72,458 versus 1,549), there are approximately 50 times more potential new hires than mentors, which will be problematic.
## Summary
### Summary of overarching questions 
- There are 72,458 employees who will retire soon in the future, so 72,458 roles for all seven different titles will need to be filled in as the “silver tsunami” begins. Number of each role is shown in retiring_title table.
- There are 72,458 roles need to be filled and 1549 potential eligible mentors in the company, which is approximately 50 to 1 ratio, meaning that each mentor will need to train and mentor at least 50 new hires for their position. It will be a great burden for mentors to take on this much responsibility. In conclusion, there aren’t enough qualified, retired ready employees overall within the company to mentor the next generation of Pewlett Hackard employees.
### Recommandations 
- To further analyze the discrepancy, tables with roles required for each departments for retirees and mentors are created as shown in mentor_breakdown (table 2) and retiree_breakdown (table 3). The breakdown of the number of roles to be filled and mentors available within each department is summarized in both tables, which will give each department a general information about which role will be understaffed in the future. <br/>
Table 2. mentor breakdown <br/>
![mentor breakdown](/Resources/mentor_breakdown.png)<br/>
Table 3. retiree breakdown <br/>
![retiree breakdown](/Resources/retiree_breakdown.png)<br/>
- Taking the department of customer service as an example, there will be enough qualified mentors to train new employees for positions such as technique leader, engineer and senior engineer since one mentor should be able to train about 10 new hires. However, for positions like senior staff and staff, there will be significant more new hires than mentors who are capable of training them. 
- Using the breakdown tables, each department can design specific solutions for each position based on the demand for new hires and shortage of mentors. Some recommendations for solutions include promoting people from within the company and providing compensation to encourage more retirees to become mentors.



