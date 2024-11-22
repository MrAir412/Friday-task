-- tasks!
		-- 		Task 3: Perform Queries
        
-- 1. Retrieve the first 5 members from the Member table.

select * from member limit 5;

-- 2. Retrieve 5 members starting from the 6th row.

select * from member limit 5 offset 5;

-- 3. List members who are older than 30 years.

select * from member where member_age>30;

-- 4. Find members who live in either New York or Los Angeles.

select * from member where member_location='New York' or member_location='Los Angeles';

-- 5. Retrieve all vehicles where the make is either 'Toyota' or 'Honda'.

select * from vehicle where vehicle_make='Toyota' or vehicle_make='Honda';

-- 6. Find members whose age is between 25 and 40 years.

select * from member where member_age>=25 and member_age<=40;

-- 7. List vehicles whose registration number starts with the letter 'A'.

select * from vehicle where vehicle_registration like 'A%';

-- 8. Find vehicles where the model ends with the number '5'.

select * from vehicle where vehicle_model like '%5';

-- 9. List all engineers and order them alphabetically by their last name.

select * from engineer order by last_name asc;

-- 10. Retrieve all members and order them by age in descending order.

select * from member order by member_age desc;

-- 11. Count the total number of members in the Member table.

select count(*) as 'Total number of members' from member;

-- 12. Retrieve all breakdowns that occurred in the year 2024.

select * from breakdown where year(breakdown_date)='2024';

-- 13. Find breakdowns for vehicles with the registration 'ABC1234' or 'XYZ5678'.

select * from breakdown where vehicle_registration='ABC1234' or vehicle_registration='XYZ5678';

-- 14. List all vehicles with the make 'Ford'.

select * from vehicle where vehicle_make='Ford';

-- 15. Find members whose first name starts with the letter 'J'.

select * from member where first_name like 'j%';

-- 16. Retrieve breakdowns that occurred before September 1, 2024.

select * from breakdown where breakdown_date<'2024-09-01';

-- 17. List members whose last name contains 'son'.

select * from member where last_name like '%son%';

-- 18. Find breakdowns that occurred in locations containing 'New'.

select * from breakdown where breakdown_location like '%new%';

-- 19. Retrieve the youngest member in the Member table.

select * from member order by member_age asc limit 1 ;

-- 20. Retrieve the oldest member in the Member table.

select * from member order by member_age desc limit 1 ;

-- 21. Find vehicles owned by members who live in Los Angeles.

select vehicle.* from vehicle left join member on vehicle.member_id=member.member_id where member_location='Los Angeles';

-- use table.* for the data in a singular table

-- 22. Retrieve all breakdowns handled by engineer with ID 1.

select * from breakdown where engineer_id='1';

-- 23. List all members who are younger than 35 years.

select * from member where member_age<'35';

-- 24. Find members who live in either Phoenix or Houston.

select * from member where member_location='Phoenix' or member_location='Houston';

-- 25. Retrieve vehicles where the model is either 'Civic' or 'Mustang'.

select * from vehicle where vehicle_model='civic' or vehicle_model='mustang';

-- 26. List members whose first name contains the letter 'a'.

select * from member where first_name like '%a%';

-- 27. Retrieve breakdowns that occurred between August 1, 2024, and August 31, 2024.

select * from breakdown where breakdown_date>'2024-08-1' and breakdown_date<'2024-08-31';

-- 28. Find members whose age is not between 20 and 40 years.

select * from member where member_age>40 or member_age<20;

-- 29. List breakdowns that occurred after October 1, 2024.

select * from breakdown where breakdown_date>'2024-10-01';

-- 30. Retrieve the top 3 oldest members from the Member table

select * from member order by member_age desc limit 3;
