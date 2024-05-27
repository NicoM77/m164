-- Dispatcher Table
CREATE TABLE Dispatcher (
    DispatcherID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    CityID INT, -- Reference to City table
    PhoneNumber VARCHAR(20),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Driver Table
CREATE TABLE Driver (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    CityID INT, -- Reference to City table
    PhoneNumber VARCHAR(20),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Bus Table
CREATE TABLE Bus (
    BusID INT AUTO_INCREMENT PRIMARY KEY,
    VehicleBrand VARCHAR(255),
    LicensePlate VARCHAR(20), 
    Mileage INT,
    CityID INT, -- Reference to City table
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Location Table
CREATE TABLE Location (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255),
    CityID INT, -- Reference to City table
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Tour Table
CREATE TABLE Tour (
    TourID INT AUTO_INCREMENT PRIMARY KEY,
    BusID INT,
    DriverID INT,
    CustomerID INT,
    DispatcherID INT,
    FOREIGN KEY (BusID) REFERENCES Bus(BusID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (DispatcherID) REFERENCES Dispatcher(DispatcherID)
);

-- Tour_Location Table
CREATE TABLE Tour_Location (
    TourID INT,
    LocationID INT,
    DepartureTime TIME,
    ArrivalTime TIME,
    PRIMARY KEY (TourID, LocationID),
    FOREIGN KEY (TourID) REFERENCES Tour(TourID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    CityID INT, -- Reference to City table
    AccountNumber VARCHAR(255),
    PhoneNumber VARCHAR(20),
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- City Table
CREATE TABLE City (
    CityID INT AUTO_INCREMENT PRIMARY KEY,
    CityName VARCHAR(255),
    ZIPCode VARCHAR(20) -- Adding ZIPCode column
);
