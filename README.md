# -Pewlett-Hackard-Analysis-

# Analysis:
The data we are trying to determine is which of the current employees at Pwelett Hackard are eligible for retirement to determine what positions openings we will create based on this. In addition to this we also analyzed the data to find out how many employees and which ones are eligible for mentoring.

The data was initially only available in separate csv files. First, we built an ERD to understand the relationship between the data
![Challenge7](https://github.com/lrovira/-Pewlett-Hackard-Analysis-/blob/master/EmployeeDB.png)


The first step was to sort out the data by separating the employees that are eligible for retirement, this is easier said than done. Because it can't just be filtered the by their date of birth, we need to make sure that they're currently active employees meaning people that still hold a position in the company. To do this we must connect the employee names with their job titles in the table. In this process we need to make sure to filter the date range and look for positions whose `to_date` is still undetermined meaning they are currently active. We saved these results into a new table named “Employees Retiring”, after this we (join) this newly created table with titles once more, us the same `to_date` filter but goup by title and select both the title itself and the title count, we can either move these results into a new table or use them/extract them as is.

I then determined employees who are eligible to participate in a mentorship program. To be eligible to participate in the mentorship program




