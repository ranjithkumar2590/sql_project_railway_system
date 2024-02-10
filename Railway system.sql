create database Railway_system;
drop database Railway_system;
use Railway_system;
create table Station_Table(Station_id int primary key,
 Station_name varchar(40),
 Location varchar(45)
 );
 insert into Station_Table(Station_id,Station_name,Location) values
 (01,'Chennai central','Chennai'),
 (02,'Coimbatore Junction','Coimbatore'),
 (03,'Erode Junction','Erode'),
 (04,'Thiruchirappalli Junction','Thiruchirappalli'),
 (05,'Madurai Junction','Madurai'),
 (06,'Karur Junction','Karur'),
 (07,'Salem Junction','Salem'),
 (08,'Dharmapuri Junction','Dharmapuri'),
 (09,'Tenkasi Junction','Tenkasi'),
 (10,'Chengalpattu Junction','Chengalpattu');
select*from Station_Table;

 -- train_table
 
create table Trains_Table(Train_id int primary key,
 Train_Name varchar(100),
 Capacity int,
 Type varchar(50)
);
insert into Trains_Table(Train_id,Train_Name,Capacity,Type) values
(101,'Chennai Express',750,'Express'),
(102,'Coimbatore Local',654,'Local'),
(103,'Erode Passenger',869,'Passenger'),
(104,'Tuticorin Express',736,'Express'),
(105,'Kanyakumari Express',893,'Express'),
(106,'Thiruchirappalli Passenger',547,'Passenger'),
(107,'Vellore Local',385,'Local'),
(108,'Madurai Superfast',746,'Superfast'),
(109,'Salem Express',649,'Express'),
(110,'Pallavan Express',454,'Express');
select*from Trains_Table;

-- Routes Table

Create table Routes_Table(
    RouteID INT PRIMARY KEY,
    DepartureStationID INT,
    ArrivalStationID INT,
    Distance INT,
    Duration TIME,
    FOREIGN KEY (DepartureStationID) REFERENCES Station_Table(Station_id),
    FOREIGN KEY (ArrivalStationID) REFERENCES Station_Table(Station_id));
insert into Routes_Table(RouteID, DepartureStationID, ArrivalStationID, Distance, Duration)values
(201,01,02,190,'04:30:00'),
(202,03,05,300,'03:15:00'),
(203,04,02,450,'03:45:00'),
(204,02,04,469,'05:20:00'),
(205,05,01,370,'03:00:00'),
(206,04,06,287,'01:35:00'),
(207,08,01,630,'02:18:00'),
(208,03,07,597,'05:55:00'),
(209,09,02,705,'08:48:00'),
(210,10,05,468,'09:32:00');
select*from Routes_Table;

-- Schedule Table

create table Schedule_Table(
    Schedule_ID INT PRIMARY KEY,
    Train_ID INT,
    RouteID INT,
    DepartureTime TIME,
    ArrivalTime TIME,
    DaysOfWeek VARCHAR(20),
    FOREIGN KEY (Train_ID) REFERENCES Trains_table(Train_ID),
    FOREIGN KEY (RouteID) REFERENCES Routes_table(RouteID)
);
INSERT INTO Schedule_Table (Schedule_ID, Train_ID, RouteID, DepartureTime, ArrivalTime, DaysOfWeek)
VALUES
    (11, 101, 201, '08:00:00', '12:30:00', 'Mon, Wed, Fri'),
    (12, 102, 202, '10:30:00', '13:45:00', 'Sun,Tue, Thu, Sat'),
    (13, 103, 203, '09:15:00', '12:00:00', 'Mon, Tue, Thu'),
    (14, 104, 204, '08:30:00', '12:50:00', 'Everyday'),
    (15, 105, 205, '11:30:00', '14:55:00', 'Tue, Thu, Sat'),
    (16, 106, 206, '01:25:00', '04:10:00', 'Mon,Wed, Thu, Sat'),
    (17, 107, 207, '08:20:00', '13:10:00', 'Tue, Wed,Thu, Fri'),
    (18, 108, 208, '04:35:00', '10:45:00', 'Everyday'),
    (19, 109, 209, '09:15:00', '14:00:00', 'Mon, Thu, Sat'),
    (20, 110, 210, '07:00:00', '11:30:00', 'Mon,Tue, Wed,Thu');
    select*from Schedule_Table;
    
    -- Ticket Table
    
    create table Tickets_Table(
    Ticket_ID INT PRIMARY KEY,
    PassengerName VARCHAR(255),
    Train_ID INT,
    Schedule_ID INT,
    SeatNumber INT,
    Price DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (Train_ID) REFERENCES Trains_table(Train_ID),
    FOREIGN KEY (Schedule_ID) REFERENCES Schedule_Table(Schedule_ID)
);
insert into Tickets_Table (Ticket_ID, PassengerName, Train_ID, Schedule_ID, SeatNumber, Price, Status)
VALUES
    (1, 'John Doe', 101, 14, 15, 50.00, 'Booked'),
    (2, 'Jane Smith', 102,12, 8, 30.00, 'Booked'), 
    (3, 'Alice Johnson', 103, 13, 22, 44.00, 'Canceled'),
	(4, 'Kumar', 104, 17, 10, 65.00, 'Booked'),
    (5, 'Aravind', 105, 15, 31, 70.00, 'Booked'), 
    (6, 'Gokul', 106, 16, 29, 160.00, 'Booked'),
	(7, 'Surya', 107, 11, 58, 50.00, 'Canceled'),
    (8, 'Raghul', 108, 18, 47, 130.00, 'Booked'), 
    (9, 'Naveen', 109, 19, 74, 110.00, 'Canceled'),
    (10, 'Praveen', 110, 20, 62, 44.00, 'Booked');
select*from Tickets_Table;
drop table Tickets_Table;

-- Users Table

create table Users_Table(User_ID INT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255),
    UserType VARCHAR(20)
);
INSERT INTO Users_Table (User_ID, Username, Password, UserType)
VALUES
    (1, 'john_doe', 'password123', 'passenger'),
    (2, 'jane_smith', 'securePass', 'passenger'),
    (3, 'Sathish', 'staffPass123', 'staff'),
    (4, 'Kumar', 'pass@123', 'passenger'),
    (5, 'Aravind', 'secure342', 'passenger'),
    (6, 'Abilash', 'staffPass234', 'staff'),
    (7, 'Praveen', 'word74421', 'passenger'),
    (8, 'Raghul', 'raghu3456', 'passenger'),
    (9, 'Vignesh', 'staffPass568', 'staff'),
    (10, 'Gokul', 'secure@3432', 'passenger');
    
select*from Users_Table;

-- Staff Table

CREATE TABLE Staff_table (
    Staff_ID INT PRIMARY KEY,
    User_ID INT,
    Role VARCHAR(255),
    FOREIGN KEY (User_ID) REFERENCES Users_Table(User_ID)
);

INSERT INTO Staff_table (Staff_ID, User_ID, Role)
VALUES
    (1, 3, 'Ticketing'),
    (2, 6, 'Maintenance'),
    (3, 9, 'Ticketing'); 
select*from Staff_table;

-- Retrieve all stations

SELECT * FROM Station_Table;

-- Find available trains between two stations on a specific date:

SELECT DISTINCT Trains_Table.Train_ID, Train_Name, DepartureTime, ArrivalTime
FROM Trains_Table
JOIN Schedule_Table ON Trains_Table.Train_ID = Schedule_Table.Train_ID
JOIN Routes_Table ON Schedule_Table.RouteID = Routes_Table.RouteID
WHERE Routes_Table.DepartureStationID =DepartureStationID
AND Routes_Table.ArrivalStationID =ArrivalStationID
AND Schedule_Table.DaysOfWeek LIKE '__%';

-- Retrieve details of a specific train schedule:

SELECT * FROM Schedule_Table WHERE Schedule_ID = schedule_ID;

-- Check seat availability for a specific train and schedule:

SELECT Trains_Table.Train_ID, Train_Name, Capacity - IFNULL(TicketCount, 0) AS AvailableSeats
FROM Trains_Table
JOIN Schedule_Table ON Trains_Table.Train_ID = Schedule_Table.Train_ID
LEFT JOIN (
    SELECT Schedule_ID, COUNT(Ticket_ID) AS TicketCount
    FROM Tickets_table
    GROUP BY Schedule_ID
) AS TicketCounts ON Schedule_Table.Schedule_ID = TicketCounts.Schedule_ID
LIMIT 0, 1000;


-- Retrieve all booked tickets for a specific passenger:

SELECT * FROM Tickets_Table WHERE PassengerName = passengerName AND Status = 'Booked';

-- Retrieve the total revenue for a specific train:

SELECT SUM(Price) AS TotalRevenue
FROM Tickets_Table
WHERE Train_ID = Train_ID AND Status = 'Booked';

-- List all staff members and their roles:

SELECT Users_Table.Username, Staff_table.Role
FROM Users_Table
JOIN Staff_table ON Users_Table.User_ID = Staff_Table.User_ID;












