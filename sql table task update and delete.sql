UPDATE Engineer
SET First_name = 'Alex', Last_name = 'Johnson'
WHERE engineer_id = 2;

UPDATE Engineer
SET First_name = 'Emma', Last_name = 'Miller'
WHERE engineer_id = 3;

UPDATE Engineer
SET First_name = 'Sophia', Last_name = 'Anderson'
WHERE engineer_id = 4;

select * from engineer;

DELETE FROM Breakdown
WHERE breakdown_id = 1;

DELETE FROM Breakdown
WHERE breakdown_id = 5;

select * from breakdown;