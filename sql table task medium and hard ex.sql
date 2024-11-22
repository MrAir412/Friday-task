				-- Medium Tasks (10)
                
-- 1. Count the number of breakdowns for each vehicle.

select vehicle_registration, count(vehicle_registration) as 'Breakdowns per car' from breakdown group by vehicle_registration;

-- 2. Find members who own more than one vehicle.

select member.* from member right join vehicle on vehicle.member_id=member.member_id group by member.member_id;

-- select * from member where member_id in(select member_id from vehicle group by member_id having count(member_id)>1);

-- 3. Retrieve the total number of breakdowns handled by each engineer.

select engineer_id,count(engineer_id) as 'Breakdown reapired per engineer' from breakdown group by engineer_id;

-- 4. Group breakdowns by location and sort them by the total number of breakdowns in each location.

select breakdown_location ,count(vehicle_registration) as 'Amount of cars broken' from breakdown group by breakdown_location order by count(vehicle_registration) desc;

-- 5. List vehicles owned by members who are younger than 30 years.

select vehicle.*, member_age as 'Age of owner' from vehicle left join member on vehicle.member_id=member.member_id where member_age<'30' order by member_age;

-- 6. Retrieve all breakdowns and sort them by time in descending order.

select * from breakdown order by breakdown_time desc;

-- 7. Find all breakdowns for vehicles owned by members who live in New York.

select breakdown.*, member.member_location from breakdown join member join vehicle on breakdown.vehicle_registration=vehicle.vehicle_registration and vehicle.member_id=member.member_id where member_location='New york';

-- 8. Retrieve members who do not own any vehicles.

select member.* from member join vehicle on member.member_id=vehicle.member_id where vehicle_registration is null;

-- 9. Find breakdowns that occurred in the same city where the vehicle owner resides.

select breakdown.*, member.member_location from breakdown join member join vehicle on breakdown.vehicle_registration=vehicle.vehicle_registration and vehicle.member_id=member.member_id where member_location=breakdown_location;

-- 10. Retrieve the total number of breakdowns handled by each engineer during 2024.

select engineer_id,count(engineer_id) as 'Breakdown reapired per engineer' from breakdown where year(breakdown_date)='2024' group by engineer_id ;

				-- Difficult Tasks (10)


-- 1. Retrieve a list of members along with their vehicles using a join.

select * from member join vehicle on member.member_id=vehicle.member_id;

-- 2. Retrieve breakdown details along with the respective member details using a join.

select breakdown.*, member.* from breakdown join vehicle join member on breakdown.vehicle_registration=vehicle.vehicle_registration and vehicle.member_id=member.member_id;

-- 3. Find members who own a vehicle but have never experienced a breakdown.

select breakdown.*, member.* from vehicle join breakdown join member on breakdown.vehicle_registration=vehicle.vehicle_registration and vehicle.member_id=member.member_id and breakdown_date is null and engineer_id is null and breakdown_time is null and breakdown_location is null;

-- 4. Retrieve vehicles along with the count of their breakdowns using a join and group by.

select vehicle.vehicle_registration, count(*) from vehicle left join breakdown on vehicle.vehicle_registration=breakdown.vehicle_registration group by vehicle.vehicle_registration;

-- 5. Find members whose vehicles have broken down more than twice.

select member.*,count(breakdown.vehicle_registration) as 'How many times their car broke' from breakdown join member join vehicle on vehicle.vehicle_registration=breakdown.vehicle_registration and vehicle.member_id=member.member_id group by member.member_id having count(breakdown.vehicle_registration)>1;

-- 6. Retrieve breakdowns where multiple vehicles broke down on the same day.

select * from breakdown where breakdown_date in (select breakdown_date from breakdown group by breakdown_date having count(*)>1);

-- 7. Count the total breakdowns handled by each engineer and label those who handled more than 5

-- breakdowns as 'Expert' and others as 'Beginner' using a CASE expression.

select engineer.*, count(breakdown.engineer_id) as 'Breakdown reapired per engineer' ,
case
when count(breakdown.engineer_id)>5 then 'Expert'
when count(breakdown.engineer_id)<=5 then 'Beginner'
end as 'How good is the engineer?'
from breakdown join engineer on engineer.engineer_id=breakdown.engineer_id group by engineer.engineer_id;

-- 8. List all vehicles that have never had a breakdown using a subquery.

select * from vehicle where vehicle_registration not in (select vehicle_registration from breakdown);

-- 9. Find the average age of members whose vehicles have experienced at least one breakdown.

select avg(member.member_age) as 'Average age' from member join vehicle on member.member_id=vehicle.member_id where vehicle.vehicle_registration in(select vehicle_registration from breakdown);

-- 10. Retrieve the top 3 vehicles with the highest number of breakdowns, ordered by breakdown count.

select breakdown.vehicle_registration, count(breakdown.breakdown_id) as breakdown_count from breakdown group by vehicle_registration order by breakdown_count desc limit 3;
