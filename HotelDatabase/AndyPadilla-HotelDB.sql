-- Destroy database if it exists in order to start from scratch
DROP DATABASE IF EXISTS HotelDB;

CREATE DATABASE HotelDB;

-- Make sure we're using the right database before we add to it
USE HotelDB;

CREATE TABLE Guest (
	`GuestId` INT PRIMARY KEY,
    `Name` VARCHAR(50) NOT NULL,
    `Address` VARCHAR(100) NOT NULL,
    `City` VARCHAR(25) NOT NULL,
    `State` VARCHAR(2) NOT NULL,
    `ZipCode` VARCHAR(5) NOT NULL,
    `Phone` VARCHAR(10) NOT NULL
);

CREATE TABLE RoomType (
	`RoomTypeId` INT PRIMARY KEY,
	`RoomType` VARCHAR(6) NOT NULL,
    `StandardOccupancy` INT NOT NULL,
    `MaximumOccupancy` INT NOT NULL,
    `ExtraPerson` DECIMAL(4,2) NULL
);

CREATE TABLE AmenityType (
	`AmenityId` INT PRIMARY KEY,
	`AmenityType` VARCHAR(12) NOT NULL
);

CREATE TABLE Reservations (
	`ReservationId` INT PRIMARY KEY,
	`GuestId` INT NOT NULL,
    FOREIGN KEY fk_Guest_Id (GuestId)
		REFERENCES Guest(GuestId),
	`Adults` INT NOT NULL,
    `Children` INT NOT NULL,
    `StartDate` DATE NOT NULL,
    `EndDate` DATE NOT NULL,
    `TotalRoomCost` DECIMAL(7,2) NOT NULL
);

CREATE TABLE Room (
	`RoomNumber` INT PRIMARY KEY,
    `RoomTypeId` INT NOT NULL,
    FOREIGN KEY fk_Room_Type_Id (RoomTypeId)
		REFERENCES RoomType(RoomTypeId),
	`ADAAccessible` BOOLEAN NOT NULL,
    `BasePrice` DECIMAL(7,2) NOT NULL
);

CREATE TABLE RoomAmenity (
	`RoomNumber` INT NOT NULL,
    `AmenityId` INT NOT NULL,
    PRIMARY KEY pk_RoomAmenity (RoomNumber, AmenityId),
    FOREIGN KEY fk_RoomAmenity_Room(RoomNumber)
		REFERENCES Room(RoomNumber),
	FOREIGN KEY fk_RoomAmenity_Amenity(AmenityId)
		REFERENCES AmenityType(AmenityId)
);

CREATE TABLE RoomReservations(
	`RoomNumber` INT NOT NULL,
    `ReservationId` INT NOT NULL,
    PRIMARY KEY pk_RoomReservations(RoomNumber, ReservationId),
    FOREIGN KEY fk_RoomReservations_Room (RoomNumber)
		REFERENCES Room(RoomNumber),
    FOREIGN KEY fk_RoomReservations_Reservation (ReservationId)
		REFERENCES Reservations(ReservationId)
);