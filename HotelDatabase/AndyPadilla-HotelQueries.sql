-- Makesure we use the right database before entering data
USE HotelDB;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT
	Guest.Name,
    RoomReservations.RoomNumber,
    Reservations.StartDate,
    Reservations.EndDate
FROM Reservations
INNER JOIN Guest ON Reservations.GuestId = Guest.GuestID
INNER JOIN RoomReservations ON Reservations.ReservationId = RoomReservations.ReservationId
WHERE Reservations.EndDate BETWEEN '2023-07-01' AND '2023-07-31';
-- Expected Results (Name, RoomNumber, Start, End)
-- Andy Padilla,205,2023-06-28,2023-07-02
-- Walter Holaway,204,2023-07-13,2023-07-14
-- Wilfred Vise,401,2023-07-18,2023-07-21
-- Bettyann Seery,303,2023-07-28,2023-07-29

-- 2.Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT 
	Guest.Name,
    RoomReservations.RoomNumber,
    Reservations.StartDate,
    Reservations.EndDate
FROM RoomAmenity
INNER JOIN RoomReservations ON RoomAmenity.RoomNumber = RoomReservations.RoomNumber
INNER JOIN Reservations ON  RoomReservations.ReservationId = Reservations.ReservationId 
INNER JOIN Guest ON Reservations.GuestId = Guest.GuestID
WHERE RoomAmenity.AmenityId = 4;
-- Expected Results (Name, RoomNumber, Start, End)
-- Karie Yang,201,2023-03-06,2023-03-07
-- Bettyann Seery,203,2023-02-05,2023-02-10
-- Karie Yang,203,2023-09-13,2023-09-15
-- Andy Padilla,205,2023-06-28,2023-07-02
-- Wilfred Vise,207,2023-04-23,2023-04-24
-- Walter Holaway,301,2023-04-09,2023-04-13
-- Mark Simmer,301,2023-11-22,2023-11-25
-- Bettyann Seery,303,2023-07-28,2023-07-29
-- Duane Cullison,305,2023-02-22,2023-02-24
-- Bettyann Seery,305,2023-08-30,2023-09-01
-- Andy Padilla,307,2023-03-17,2023-03-20

-- 3.Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
SELECT
	Guest.Name,
    RoomReservations.RoomNumber,
    Reservations.Adults + Reservations.Children AS NumberOfPeople,
    Reservations.StartDate
FROM Guest
INNER JOIN Reservations ON Guest.GuestId = Reservations.GuestId
INNER JOIN RoomReservations ON Reservations.ReservationId = RoomReservations.ReservationId
WHERE Guest.Name = 'Mack Simmer';
-- Expected Results using Mack Simmer (Name, RoomNumber, NumberOf People, startDate)
-- Mack Simmer,308,1,2023-02-02
-- Mack Simmer,208,2,2023-09-16
-- Mack Simmer,206,2,2023-11-22
-- Mack Simmer,301,4,2023-11-22

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT
	Room.RoomNumber,
    RoomReservations.ReservationId,
    Reservations.TotalRoomCost
FROM Room
LEFT JOIN RoomReservations ON Room.RoomNumber = RoomReservations.RoomNumber
LEFT JOIN Reservations ON RoomReservations.ReservationId = Reservations.ReservationId;
-- Expected Results(roomNumber,ReservationId,totalroomcost)
-- 205,15,699.96
-- 206,12,599.96
-- 206,23,449.97
-- 207,10,174.99
-- 208,13,599.96
-- 208,20,149.99
-- 305,3,349.98
-- 305,19,349.98
-- 306,NULL,NULL
-- 307,5,524.97
-- 308,1,299.98
-- 201,4,199.99
-- 202,7,349.98
-- 203,2,999.95
-- 203,21,399.98
-- 204,16,184.99
-- 301,9,799.96
-- 301,24,599.97
-- 302,6,924.95
-- 302,25,699.96
-- 303,18,199.99
-- 304,14,184.99
-- 401,11,1199.97
-- 401,17,1259.97
-- 401,22,1199.97
-- 402,NULL,NULL

-- 5.Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
SELECT
	RoomReservations.RoomNumber
FROM Reservations
INNER JOIN RoomReservations ON Reservations.ReservationId = RoomReservations.ReservationId
WHERE ((Reservations.StartDate BETWEEN '2023-04-01' AND '2023-04-30') OR (Reservations.EndDate BETWEEN '2023-04-01' AND '2023-04-30')) AND (Reservations.Adults + Reservations.Children >= 3);
-- Expected Results(RoomNumber)
-- Empty as no reservations meet the criteria

-- 6.Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's name.
SELECT
	Guest.Name,
    COUNT(Reservations.GuestId) NumberOfReservation
FROM Guest
INNER JOIN Reservations ON Guest.GuestId = Reservations.GuestId
GROUP BY Guest.Name
ORDER BY COUNT(Reservations.GuestId) DESC, Guest.Name;
-- Expected Results (Name, Number of reservations)
-- Mack Simmer,4
-- Bettyann Seery,3
-- Andy Padilla,2
-- Aurore Lipton,2
-- Duane Cullison,2
-- Joleen Tison,2
-- Karie Yang,2
-- Maritza Tilton,2
-- Walter Holaway,2
-- Wilfred Vise,2
-- Zachery Luechtefeld,1    

-- 7.Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT
	Guest.Name,
    Guest.Address,
    Guest.Phone
FROM Guest
WHERE Phone = '3775070974';
-- Expected Results (name, address, phoneNumber) using 3775070974 as the phone number
-- Aurore Lipton, 762 Wild Rose Street, 3775070974
