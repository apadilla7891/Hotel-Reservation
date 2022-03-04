-- Makesure we use the right database before entering data
USE HotelDB;

INSERT INTO Guest(`GuestId`, `Name`, `Address`, `City`, `State`, `ZipCode`, `Phone`) VALUES
	(1, 'Andy Padilla', '123 Main St', 'Manhattan', 'NY', '11234', '1234567890'),
    (2, 'Mack Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '2915530508'),
    (3, 'Bettyann Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '4782779632'),
    (4, 'Duane Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '3084940198'),
    (5, 'Karie Yang', '9378 W. Augusta Ave', 'West Deptford', 'NJ', '08096', '2147300298'),
    (6, 'Aurore Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '3775070974'),
    (7, 'Zachery Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '8144852615'),
    (8, 'Jeremiah Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '2794910960'),
    (9, 'Walter Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '4463966785'),
    (10, 'Wilfred Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '8347271001'),
    (11, 'Maritza Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '4463516860'),
    (12, 'Joleen Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '2318932755');

INSERT INTO RoomType (`RoomTypeId`,`RoomType`, `StandardOccupancy`, `MaximumOccupancy`, `ExtraPerson`) VALUES
	(1,'Single', 2, 2, NULL),
    (2,'Double', 2, 4, 10),
    (3,'Suite', 3, 8, 20);
    
INSERT INTO AmenityType(`AmenityId`, `AmenityType`) VALUES
	(1,'Microwave'),
    (2,'Oven'),
    (3,'Refrigerator'),
    (4,'Jacuzzi');
    
INSERT INTO Reservations(`ReservationId`, `GuestId`,`Adults`, `Children`, `StartDate`, `EndDate`, `TotalRoomCost`) VALUES
	(1,2,1,0,'2023-02-02','2023-02-04', 299.98),
    (2,3,2,1,'2023-02-05','2023-02-10', 999.95),
    (3,4,2,0,'2023-02-22','2023-02-24', 349.98),
    (4,5,2,2,'2023-03-06','2023-03-07', 199.99),
    (5,1,1,1,'2023-03-17','2023-03-20', 524.97),
    (6,6,3,0,'2023-03-18','2023-03-23', 924.95),
    (7,7,2,2,'2023-03-29','2023-03-31', 349.98),
    (8,8,2,0,'2023-03-31','2023-04-05', 874.95),
    (9,9,1,0,'2023-04-09','2023-04-13', 799.96),
    (10,10,1,1,'2023-04-23','2023-04-24', 174.99),
    (11,11,2,4,'2023-05-30','2023-06-02', 1199.97),
    (12,12,2,0,'2023-06-10','2023-06-14', 599.96),
    (13,12,1,0,'2023-06-10','2023-06-14', 599.96),
    (14,6,3,0,'2023-06-17','2023-06-18', 184.99),
    (15,1,2,0,'2023-06-28','2023-07-02', 699.96),
    (16,9,3,1,'2023-07-13','2023-07-14', 184.99),
    (17,10,4,2,'2023-07-18','2023-07-21', 1259.97),
    (18,3,2,1,'2023-07-28','2023-07-29', 199.99),
    (19,3,1,0,'2023-08-30','2023-09-01', 349.98),
    (20,2,2,0,'2023-09-16','2023-09-17', 149.99),
    (21,5,2,2,'2023-09-13','2023-09-15', 399.98),
    (22,4,2,2,'2023-11-22','2023-11-25', 1199.97),
    (23,2,2,0,'2023-11-22','2023-11-25', 449.97),
    (24,2,2,2,'2023-11-22','2023-11-25', 599.97),
    (25,11,2,0,'2023-12-24','2023-12-28', 699.96);
    
INSERT INTO Room (`RoomNumber`, `RoomTypeId`, `ADAAccessible`, `BasePrice`) VALUES
	(201,2,0,199.99),
    (202,2,1,174.99),
    (203,2,0,199.99),
    (204,2,1,174.99),
    (205,1,0,174.99),
    (206,1,1,149.99),
    (207,1,0,174.99),
    (208,1,1,149.99),
    (301,2,0,199.99),
    (302,2,1,174.99),
    (303,2,0,199.99),
    (304,2,1,174.99),
    (305,1,0,174.99),
    (306,1,1,149.99),
    (307,1,0,174.99),
    (308,1,1,149.99),
    (401,3,1,399.99),
    (402,3,1,399.99);
    
INSERT INTO RoomAmenity(`RoomNumber`, `AmenityId`) VALUES
	(201,1),
    (201,4),
    (202,3),
    (203,1),
    (203,4),
    (204,3),
    (205,1),
    (205,3),
    (205,4),
    (206,1),
    (206,3),
    (207,1),
    (207,3),
    (207,4),
    (208,1),
    (208,3),
    (301,1),
    (301,4),
    (302,3),
    (303,1),
    (303,4),
    (304,3),
    (305,1),
    (305,3),
    (305,4),
    (306,1),
    (306,3),
    (307,1),
    (307,3),
    (307,4),
    (308,1),
    (308,3),
    (401,1),
    (401,2),
    (401,3),
    (402,1),
    (402,2),
    (402,3);
    
INSERT INTO RoomReservations(`RoomNumber`,`ReservationId`) VALUES
	(308,1),
    (203,2),
    (305,3),
    (201,4),
    (307,5),
    (302,6),
    (202,7),
    (304,8),
    (301,9),
    (207,10),
    (401,11),
    (206,12),
    (208,13),
    (304,14),
    (205,15),
    (204,16),
    (401,17),
    (303,18),
    (305,19),
    (208,20),
    (203,21),
    (401,22),
    (206,23),
    (301,24),
    (302,25);
    
-- Delete Jeremiah Pendergrass and his reservations from records. First from foreign keys and then guest table
-- Delete room and reservation link first
DELETE FROM RoomReservations
WHERE ReservationId = 8;

-- Delete reservation data for guest
DELETE FROM Reservations
WHERE GuestId = 8;

-- Finally delete the guest from the database
DELETE FROM Guest
WHERE GuestId = 8;

-- checks to see that data stored correctly/ deletion occured
-- SELECT *
-- FROM Guest;

-- SELECT *
-- FROM RoomType;

-- SELECT *
-- FROM AmenityType;

-- SELECT *
-- FROM Reservations;

-- SELECT *
-- FROM Room;

-- SELECT *
-- FROM RoomAmenity;

-- SELECT *
-- FROM RoomReservations;