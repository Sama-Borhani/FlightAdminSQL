SET AUTOCOMMIT ON;


CREATE TABLE PORT
( 
    PORTID INT PRIMARY KEY,
    PORTCODE INT UNIQUE
);

CREATE TABLE AIRPORT
(
    AIRPORTID INT PRIMARY KEY,
    AIRPORTNAME VARCHAR(35) NOT NULL,
    CITY VARCHAR(35) NOT NULL,
    COUNTRY VARCHAR(35) NOT NULL,
    LATITUDE INT NOT NULL,
    LONGTITUDE INT NOT NULL
);


CREATE TABLE COMPANIES
(
    COMPANYID INT PRIMARY KEY,
    COMPANYNAME VARCHAR(35) NOT NULL,
    HEADQUATERS VARCHAR(35) NOT NULL,
    AGENTNAME VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(20) NOT NULL,
    CONTACTNUMBER INT NOT NULL
);

CREATE TABLE CUSTOMERS
(
    CUSTOMERID INT PRIMARY KEY,
    FIRSTNAME VARCHAR(35) NOT NULL,
    LASTNAME VARCHAR(35) NOT NULL,
    EMAIL VARCHAR(35) NOT NULL,
    PHONE INT NOT NULL,
    ADDRESS VARCHAR(35) NOT NULL
);

CREATE TABLE PILOTS
(
    PILOTID INT PRIMARY KEY,
    FIRSTNAME VARCHAR(35) NOT NULL,
    LASTNAME VARCHAR(35) NOT NULL,
    EMAIL VARCHAR(35) NOT NULL,
    PHONE INT NOT NULL,
    ADDRESS VARCHAR(35) NOT NULL,
    STAUTS VARCHAR(20) NOT NULL,
    EDUCATION VARCHAR(20) NOT NULL,
    TOTALFLIGHTS INT NOT NULL,
    LICENSETYPE VARCHAR(20) NOT NULL,
    LICENSENUMBER INT UNIQUE 
);

CREATE TABLE AIRCRAFTS
(
    AIRCRAFTID INT PRIMARY KEY,
    COMPANYID INT,
    AIRCRAFTTYPE VARCHAR(35) NOT NULL,
    MANUFACTURER VARCHAR(35) NOT NULL,
    MODELNO VARCHAR(35) NOT NULL,
    TOTALSEATS INT,
    YEAROFMANUFACTURE INT NOT NULL,
    LASTMAINTAINCE DATE NOT NULL,
    CONSTRAINT COMPANY_CHK_FK FOREIGN KEY(COMPANYID) REFERENCES COMPANIES(COMPANYID),
    CONSTRAINT SEATS_TOTAL CHECK (TOTALSEATS > 0)
);

CREATE TABLE FLIGHTS
(
    FLIGHTID INT PRIMARY KEY,
    AIRCRAFTID INT,
    PILOTID INT,
    DEPATUREAIRPORTID INT,
    ARRIVALAIRPORTID INT,
    PORTID INT,
    CREWID INT,
    COMPANYID INT,
    ARRIVALTERMINAL INT NOT NULL,
    DEPATURETERMINAL INT NOT NULL,
    GATE INT NOT NULL,
    ARRIVALTIME INT NOT NULL,
    DEPARTURETIME INT NOT NULL,
    FLIGHTSTATUS VARCHAR(20) NOT NULL,
    CONSTRAINT AIRC_CHK_FK FOREIGN KEY (AIRCRAFTID) REFERENCES AIRCRAFTS(AIRCRAFTID),
    CONSTRAINT PI_CHK_FK FOREIGN KEY (PILOTID) REFERENCES PILOTS(PILOTID),
    CONSTRAINT D_PORT_FK FOREIGN KEY (DEPATUREAIRPORTID) REFERENCES AIRPORT(AIRPORTID),
    CONSTRAINT A_PORT_FK FOREIGN KEY (ARRIVALAIRPORTID) REFERENCES AIRPORT(AIRPORTID),
    CONSTRAINT PO_CHK_FK FOREIGN KEY (PORTID) REFERENCES PORT(PORTID),
    CONSTRAINT COMP_CHK_FK FOREIGN KEY (COMPANYID) REFERENCES COMPANIES(COMPANYID)
);

CREATE TABLE CREW
(
    CREWID INT PRIMARY KEY,
    FLIGHTID INT,
    PILOTID INT,
    FLIGHTATTENDANT1 VARCHAR(35),
    FLIGHTATTENDANT2 VARCHAR(35),
    FLIGHTATTENDANT3 VARCHAR(35),
    CONSTRAINT PILOTS_TO_CHK_FK FOREIGN KEY (PILOTID) REFERENCES PILOTS(PILOTID),
    CONSTRAINT FLIFHTS_TO_CHK_FK FOREIGN KEY (FLIGHTID) REFERENCES FLIGHTS(FLIGHTID)
);

CREATE TABLE BOOKINGS
(
    BOOKINGID INT PRIMARY KEY,
    CUSTOMERID INT,
    FLIGHTID INT,
    BOOKINGDATE DATE,
    BOOKINGTIME INT,
    SEATNUMBER INT NOT NULL,
    BOOKINGSTATUS VARCHAR(20) NOT NULL,
    CONSTRAINT CUTOMERSCHK_FK FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID),
    CONSTRAINT FLIGHT_CHK_FK FOREIGN KEY (FLIGHTID) REFERENCES FLIGHTS(FLIGHTID)
);

CREATE TABLE CATERING
(
    CATERINGID INT PRIMARY KEY,
    FLIGHTID INT,
    CATERINGTYPE VARCHAR(50) NOT NULL,
    YEARSOFEXPERINCE INT NOT NULL,
    CATERINGDETAILS VARCHAR(300) NOT NULL,
    PARENTCOMPANY VARCHAR(230) NOT NULL,
    CONSTRAINT CATER_CHK_FK FOREIGN KEY (FLIGHTID) REFERENCES FLIGHTS(FLIGHTID)
);

CREATE TABLE PAYMENTS
(
    PAYMENTID INT PRIMARY KEY,
    BOOKINGID INT,
    CUSTOMERID INT,
    PAYMENTDATE DATE NOT NULL,
    PAYMENTAMOUNT INT NOT NULL,
    PAYMENTMETHOD VARCHAR(20) NOT NULL,
    CONSTRAINT CHK_AMOUNT CHECK (PAYMENTAMOUNT > 0),
    CONSTRAINT BOOKINGS_CHK_FK FOREIGN KEY (BOOKINGID) REFERENCES BOOKINGS(BOOKINGID),
    CONSTRAINT CONSUMER_CHK_FK FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
);

CREATE TABLE FEEDBACK
(
    FEEDBACKID INT PRIMARY KEY,
    CUSTOMERID INT,
    FLIGHTID INT,
    CATERINGID INT,
    FEEDBACKTYPE VARCHAR(50),
    FEEDBACK_DETAILS VARCHAR(200),
    FEEDBACK_DATE DATE,
    CONSTRAINT CUTOMER_AND_CHK_FK FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID),
    CONSTRAINT FLIGHT_AND_CHK_FK FOREIGN KEY (FLIGHTID) REFERENCES FLIGHTS(FLIGHTID),
    CONSTRAINT CATERING_AND_CHK_FK FOREIGN KEY (CATERINGID) REFERENCES CATERING(CATERINGID)
);

CREATE TABLE FREQFLYER
(
    PROGRAMID INT PRIMARY KEY,
    CUSTOMERID INT,
    POINTS INT DEFAULT 0,
    STATUS VARCHAR(20) NOT NULL,
    CONSTRAINT CHK_POINT CHECK(POINTS > 0),
    CONSTRAINTS CUSTOMER_CHK_FK FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
);

-- Insert data into PORT table
INSERT ALL  
   INTO PORT VALUES(101, 1001)
   INTO PORT VALUES(102, 1002)
   INTO PORT VALUES(103, 1003)
   INTO PORT VALUES(104, 1004)
   INTO PORT VALUES(105, 1005)
   INTO PORT VALUES(106, 1006)
   INTO PORT VALUES(107, 1007)
   INTO PORT VALUES(108, 1008)
   INTO PORT VALUES(109, 1009)
   INTO PORT VALUES(110, 1010)
   INTO PORT VALUES(111, 1011)
   INTO PORT VALUES(112, 1012)
   INTO PORT VALUES(113, 1013)
   INTO PORT VALUES(114, 1014)
   INTO PORT VALUES(115, 1015)
   INTO PORT VALUES(116, 1016)
   INTO PORT VALUES(117, 1017)
   INTO PORT VALUES(118, 1018)
   INTO PORT VALUES(119, 1019)
   INTO PORT VALUES(120, 1020)
SELECT * FROM DUAL;
COMMIT;


-- Insert data into AIRPORT table
INSERT ALL
    INTO AIRPORT VALUES (201, 'Heathrow', 'London', 'United Kingdom', 51.4700, -0.4543)
    INTO AIRPORT VALUES (202, 'John F. Kennedy Intrntl', 'New York City', 'United States', 40.6413, -73.7781)
    INTO AIRPORT VALUES (203, 'Los Angeles Intrntl', 'Los Angeles', 'United States', 33.9416, -118.4085)
    INTO AIRPORT VALUES (204, 'Beijing Capital Intrntl', 'Beijing', 'China', 40.0799, 116.6031)
    INTO AIRPORT VALUES (205, 'Dubai Intrntl ', 'Dubai', 'United Arab Emirates', 25.2532, 55.3657)
    INTO AIRPORT VALUES (206, 'Charles de Gaulle ', 'Paris', 'France', 49.0034, 2.5735)
    INTO AIRPORT VALUES (207, 'Tokyo Haneda', 'Tokyo', 'Japan', 35.5533, 139.7811)
    INTO AIRPORT VALUES (208, 'O Hare Intrntl', 'Chicago', 'United States', 41.9742, -87.9073)
    INTO AIRPORT VALUES (209, 'Singapore Changi', 'Singapore', 'Singapore', 1.3644, 103.9915)
    INTO AIRPORT VALUES (210, 'Sydney Kingsford Smith', 'Sydney', 'Australia', -33.9399, 151.1753)
    INTO AIRPORT VALUES (211, 'Denver Intrntl', 'Denver', 'United States', 39.8561, -104.6737)
    INTO AIRPORT VALUES (212, 'Frankfurt', 'Frankfurt', 'Germany', 50.0333, 8.5706)
    INTO AIRPORT VALUES (213, 'Hong Kong Intrntl', 'Hong Kong', 'Hong Kong', 22.3080, 113.9185)
    INTO AIRPORT VALUES (214, 'Indira Gandhi Intrntl', 'Delhi', 'India', 28.5562, 77.1000)
    INTO AIRPORT VALUES (215, 'Madrid-Barajas Adolfo Suárez', 'Madrid', 'Spain', 40.4940, -3.5675)
    INTO AIRPORT VALUES (216, 'Toronto Pearson Intrntl', 'Toronto', 'Canada', 43.6777, -79.6248)
    INTO AIRPORT VALUES (217, 'Incheon Intrntl', 'Seoul', 'South Korea', 37.4602, 126.4407)
    INTO AIRPORT VALUES (218, 'Dallas/Fort Worth Intrntl', 'Dallas/Fort Worth', 'United States', 32.8998, -97.0403)
    INTO AIRPORT VALUES (219, 'Suvarnabhumi', 'Bangkok', 'Thailand', 13.6923, 100.7501)
    INTO AIRPORT VALUES (220, 'Seattle-Tacoma Intrntl', 'Seattle', 'United States', 47.4502, -122.3088)
SELECT * FROM DUAL;
COMMIT;


-- Insert data into COMPANIES table
INSERT ALL
    INTO COMPANIES VALUES (301, 'Delta Air Lines', 'Atlanta, Georgia', 'John Doe', 'j.doe@delta.com', 1234567890)
    INTO COMPANIES VALUES (302, 'American Airlines', 'Fort Worth, Texas', 'Jane Smith', 'j.smith@aa.com', 9876543210)
    INTO COMPANIES VALUES (303, 'United Airlines', 'Chicago, Illinois', 'Mike Johnson', 'm.johnson@united.com', 1357924680)
    INTO COMPANIES VALUES (304, 'Lufthansa', 'Cologne, Germany', 'Sarah Brown', 's.brown@luft.com', 2468013579)
    INTO COMPANIES VALUES (305, 'British Airways', 'London, United Kingdom', 'David Wilson', 'd.wilson@ba.com', 9870123456)
    INTO COMPANIES VALUES (306, 'Emirates', 'Dubai, United Arab Emirates', 'Emily Davis', 'e.davis@emirates.com', 3210987654)
    INTO COMPANIES VALUES (307, 'Qantas', 'Sydney, Australia', 'Michael Smith', 'm.smith@qantas.com', 6543210987)
    INTO COMPANIES VALUES (308, 'Singapore Airlines', 'Singapore', 'Sophia Johnson', 's.johnson@seair.com', 9871234560)
    INTO COMPANIES VALUES (309, 'Air France', 'Paris, France', 'Daniel Martin', 'd.martin@france.com', 2468901357)
    INTO COMPANIES VALUES (310, 'Cathay Pacific', 'Hong Kong', 'Olivia White', 'o.white@cpaci.com', 9876543210)
    INTO COMPANIES VALUES (311, 'Lufthansa Cargo', 'Cologne, Germany', 'James Brown', 'j.brown@luft.com', 3210987654)
    INTO COMPANIES VALUES (312, 'Southwest Airlines', 'Dallas, Texas', 'Jessica Taylor', 'j.taylor@sw.com', 6543210987)
    INTO COMPANIES VALUES (313, 'KLM Royal Dutch Airlines', 'Amsterdam, Netherlands', 'William Martinez', 'w.martinez@klm.com', 1234567890)
    INTO COMPANIES VALUES (314, 'Turkish Airlines', 'Istanbul, Turkey', 'Lily Jones', 'l.jones@thy.com', 4567890123)
    INTO COMPANIES VALUES (315, 'Qatar Airways', 'Doha, Qatar', 'Noah Wilson', 'n.wilson@qa.com', 7890123456)
    INTO COMPANIES VALUES (316, 'Etihad Airways', 'Abu Dhabi, United Arab Emirates', 'Ava Garcia', 'a.garcia@etihad.com', 8901234567)
    INTO COMPANIES VALUES (317, 'Virgin Atlantic', 'Crawley, United Kingdom', 'Logan Brown', 'l.brown@virgina.com', 9012345678)
    INTO COMPANIES VALUES (318, 'Alaska Airlines', 'Seattle, Washington', 'Ethan Thomas', 'e.thomas@alask.com', 3456789012)
    INTO COMPANIES VALUES (319, 'JetBlue Airways', 'Long Island City, New York', 'Avery Wilson', 'a.wilson@jetb.com', 4567890123)
    INTO COMPANIES VALUES (320, 'ANA All Nippon Airways', 'Tokyo, Japan', 'Mia Johnson', 'm.johnson@ana.co', 5678901234)
SELECT * FROM DUAL;
COMMIT;


-- Insert data into CUSTOMERS table
INSERT ALL 
    INTO CUSTOMERS VALUES (401, 'John', 'Doe', 'john.doe@example.com', 1234567890, '123 Main St, Anytown, USA')
    INTO CUSTOMERS VALUES (402, 'Jane', 'Smith', 'jane.smith@example.com', 9876543210, '456 Oak St, Anytown, USA')
    INTO CUSTOMERS VALUES (403, 'Michael', 'Johnson', 'michael.johnson@example.com', 2468013579, '789 Elm St, Anytown, USA')
    INTO CUSTOMERS VALUES (404, 'Sarah', 'Brown', 'sarah.brown@example.com', 1357924680, '321 Pine St, Anytown, USA')
    INTO CUSTOMERS VALUES (405, 'David', 'Wilson', 'david.wilson@example.com', 2468013579, '654 Maple St, Anytown, USA')
    INTO CUSTOMERS VALUES (406, 'Emily', 'Davis', 'emily.davis@example.com', 1234567890, '987 Cedar St, Anytown, USA')
    INTO CUSTOMERS VALUES (407, 'Michael', 'Smith', 'michael.smith@example.com', 9876543210, '147 Birch St, Anytown, USA')
    INTO CUSTOMERS VALUES (408, 'Sophia', 'Johnson', 'sophia.johnson@example.com', 2468013579, '258 Fir St, Anytown, USA')
    INTO CUSTOMERS VALUES (409, 'Daniel', 'Martin', 'daniel.martin@example.com', 1357924680, '369 Spruce St, Anytown, USA')
    INTO CUSTOMERS VALUES (410, 'Olivia', 'White', 'olivia.white@example.com', 9876543210, '789 Pine St, Anytown, USA')
    INTO CUSTOMERS VALUES (411, 'James', 'Brown', 'james.brown@example.com', 2468013579, '951 Oak St, Anytown, USA')
    INTO CUSTOMERS VALUES (412, 'Jessica', 'Taylor', 'jessica.taylor@example.com', 1234567890, '357 Cedar St, Anytown, USA')
    INTO CUSTOMERS VALUES (413, 'William', 'Martinez', 'william.martinez@example.com', 9876543210, '456 Birch St, Anytown, USA')
    INTO CUSTOMERS VALUES (414, 'Lily', 'Jones', 'lily.jones@example.com', 2468013579, '852 Maple St, Anytown, USA')
    INTO CUSTOMERS VALUES (415, 'Noah', 'Wilson', 'noah.wilson@example.com', 1357924680, '753 Spruce St, Anytown, USA')
    INTO CUSTOMERS VALUES (416, 'Ava', 'Garcia', 'ava.garcia@example.com', 9876543210, '654 Fir St, Anytown, USA')
    INTO CUSTOMERS VALUES (417, 'Logan', 'Brown', 'logan.brown@example.com', 2468013579, '951 Elm St, Anytown, USA')
    INTO CUSTOMERS VALUES (418, 'Ethan', 'Thomas', 'ethan.thomas@example.com', 1234567890, '357 Cedar St, Anytown, USA')
    INTO CUSTOMERS VALUES (419, 'Avery', 'Wilson', 'avery.wilson@example.com', 9876543210, '456 Oak St, Anytown, USA')
    INTO CUSTOMERS VALUES (420, 'Mia', 'Johnson', 'mia.johnson@example.com', 2468013579, '852 Pine St, Anytown, USA')
    INTO CUSTOMERS VALUES ('421', 'SHON ', 'JOHN', 'johnapple@example.com', '1663546354', '125 forser frest, St clair , USA')
SELECT * FROM DUAL;
COMMIT;


-- Insert data into PILOTS table
INSERT ALL 
    INTO PILOTS VALUES (501, 'John', 'Doe', 'john.doe@pilots.com', 1234567890, '123 Main St, Anytown, USA', 'Active', 'Bachelor', 500, 'Commercial', 123456789)
    INTO PILOTS VALUES (502, 'Jane', 'Smith', 'jane.smith@pilots.com', 9876543210, '456 Oak St, Anytown, USA', 'Active', 'Bachelor', 600, 'Commercial', 987654321)
    INTO PILOTS VALUES (503, 'Michael', 'Johnson', 'michael.johnson@pilots.com', 2468013579, '789 Elm St, Anytown, USA', 'Active', 'Bachelor', 700, 'Commercial', 246801355)
    INTO PILOTS VALUES (504, 'Sarah', 'Brown', 'sarah.brown@pilots.com', 1357924680, '321 Pine St, Anytown, USA', 'Active', 'Bachelor', 800, 'Commercial', 135792468)
    INTO PILOTS VALUES (505, 'David', 'Wilson', 'david.wilson@pilots.com', 2468013579, '654 Maple St, Anytown, USA', 'Active', 'Bachelor', 900, 'Commercial', 246801354)
    INTO PILOTS VALUES (506, 'Emily', 'Davis', 'emily.davis@pilots.com', 1234567890, '987 Cedar St, Anytown, USA', 'Active', 'Bachelor', 1000, 'Commercial', 123456709)
    INTO PILOTS VALUES (507, 'Michael', 'Smith', 'michael.smith@pilots.com', 9876543210, '147 Birch St, Anytown, USA', 'Active', 'Bachelor', 1100, 'Commercial', 987650321)
    INTO PILOTS VALUES (508, 'Sophia', 'Johnson', 'sophia.johnson@pilots.com', 2468013579, '258 Fir St, Anytown, USA', 'Active', 'Bachelor', 1200, 'Commercial', 246801257)
    INTO PILOTS VALUES (509, 'Daniel', 'Martin', 'daniel.martin@pilots.com', 1357924680, '369 Spruce St, Anytown, USA', 'Active', 'Bachelor', 1300, 'Commercial', 135792268)
    INTO PILOTS VALUES (510, 'Olivia', 'White', 'olivia.white@pilots.com', 9876543210, '789 Pine St, Anytown, USA', 'Active', 'Bachelor', 1400, 'Commercial', 987654320)
    INTO PILOTS VALUES (511, 'James', 'Brown', 'james.brown@pilots.com', 2468013579, '951 Oak St, Anytown, USA', 'Active', 'Bachelor', 1500, 'Commercial', 246800357)
    INTO PILOTS VALUES (512, 'Jessica', 'Taylor', 'jessica.taylor@pilots.com', 1234567890, '357 Cedar St, Anytown, USA', 'Active', 'Bachelor', 1600, 'Commercial', 103456789)
    INTO PILOTS VALUES (513, 'William', 'Martinez', 'william.martinez@pilots.com', 9876543210, '456 Birch St, Anytown, USA', 'Active', 'Bachelor', 1700, 'Commercial', 907654321)
    INTO PILOTS VALUES (514, 'Lily', 'Jones', 'lily.jones@pilots.com', 2468013579, '852 Maple St, Anytown, USA', 'Active', 'Bachelor', 1800, 'Commercial', 246901357)
    INTO PILOTS VALUES (515, 'Noah', 'Wilson', 'noah.wilson@pilots.com', 1357924680, '753 Spruce St, Anytown, USA', 'Active', 'Bachelor', 1900, 'Commercial', 177792468)
    INTO PILOTS VALUES (516, 'Ava', 'Garcia', 'ava.garcia@pilots.com', 9876543210, '654 Fir St, Anytown, USA', 'Active', 'Bachelor', 2000, 'Commercial', 980654321)
    INTO PILOTS VALUES (517, 'Logan', 'Brown', 'logan.brown@pilots.com', 2468013579, '951 Elm St, Anytown, USA', 'Active', 'Bachelor', 2100, 'Commercial', 299801357)
    INTO PILOTS VALUES (518, 'Ethan', 'Thomas', 'ethan.thomas@pilots.com', 1234567890, '357 Cedar St, Anytown, USA', 'Active', 'Bachelor', 2200, 'Commercial', 125544389)
    INTO PILOTS VALUES (519, 'Avery', 'Wilson', 'avery.wilson@pilots.com', 9876543210, '456 Oak St, Anytown, USA', 'Active', 'Bachelor', 2300, 'Commercial', 987604321)
    INTO PILOTS VALUES (520, 'Mia', 'Johnson', 'mia.johnson@pilots.com', 2468013579, '852 Pine St, Anytown, USA', 'Active', 'Bachelor', 2400, 'Commercial', 267801357)
SELECT * FROM DUAL;
COMMIT;    
    
-- Insert data into AIRCRAFTS table
INSERT ALL 
    INTO AIRCRAFTS VALUES (601, 301, 'Boeing 737', 'Boeing', '737-800', 180, 2010, '2023-02-15')
    INTO AIRCRAFTS VALUES (602, 302, 'Airbus A320', 'Airbus', 'A320neo', 150, 2015, '2023-01-20')
    INTO AIRCRAFTS VALUES (603, 303, 'Boeing 777', 'Boeing', '777-300ER', 350, 2018, '2023-03-10')
    INTO AIRCRAFTS VALUES (604, 304, 'Airbus A350', 'Airbus', 'A350-900', 300, 2019, '2023-04-25')
    INTO AIRCRAFTS VALUES (605, 305, 'Boeing 787', 'Boeing', '787-9', 250, 2016, '2023-06-30')
    INTO AIRCRAFTS VALUES (606, 306, 'Embraer E190', 'Embraer', 'E190-E2', 110, 2017, '2023-08-12')
    INTO AIRCRAFTS VALUES (607, 307, 'Boeing 747', 'Boeing', '747-8', 400, 2014, '2023-09-05')
    INTO AIRCRAFTS VALUES (608, 308, 'Airbus A380', 'Airbus', 'A380-800', 500, 2013, '2023-11-18')
    INTO AIRCRAFTS VALUES (609, 309, 'Boeing 737', 'Boeing', '737 MAX 8', 200, 2020, '2023-10-01')
    INTO AIRCRAFTS VALUES (610, 310, 'Airbus A330', 'Airbus', 'A330-900neo', 280, 2021, '2023-12-20')
    INTO AIRCRAFTS VALUES (611, 311, 'Boeing 757', 'Boeing', '757-200', 220, 2008, '2023-02-28')
    INTO AIRCRAFTS VALUES (612, 312, 'Airbus A321', 'Airbus', 'A321neo', 200, 2012, '2023-03-15')
    INTO AIRCRAFTS VALUES (613, 313, 'Embraer E195', 'Embraer', 'E195-E2', 120, 2019, '2023-05-20')
    INTO AIRCRAFTS VALUES (614, 314, 'Boeing 767', 'Boeing', '767-300ER', 290, 2011, '2023-06-10')
    INTO AIRCRAFTS VALUES (615, 315, 'Airbus A340', 'Airbus', 'A340-600', 320, 2006, '2023-08-30')
    INTO AIRCRAFTS VALUES (616, 316, 'Boeing 777', 'Boeing', '777-200LR', 360, 2007, '2023-09-15')
    INTO AIRCRAFTS VALUES (617, 317, 'Airbus A319', 'Airbus', 'A319neo', 160, 2022, '2023-11-05')
    INTO AIRCRAFTS VALUES (618, 318, 'Embraer E175', 'Embraer', 'E175-E2', 130, 2020, '2023-10-25')
    INTO AIRCRAFTS VALUES (619, 319, 'Boeing 737', 'Boeing', '737-700', 150, 2010, '2023-12-05')
    INTO AIRCRAFTS VALUES (620, 320, 'Airbus A380', 'Airbus', 'A380plus', 520, 2019, '2023-07-01')
SELECT * FROM DUAL;
COMMIT;    
    
-- Insert data into FLIGHTS table
INSERT ALL 
    INTO FLIGHTS VALUES (701, 601, 501, 201, 202, 101, 801, 301, 1, 2, 3, 15.30, 10.00, 'On Time')
    INTO FLIGHTS VALUES (702, 602, 502, 202, 203, 102, 802, 302, 2, 3, 4, 18.45, 13.15, 'Delayed')
    INTO FLIGHTS VALUES (703, 603, 503, 203, 204, 103, 803, 303, 3, 4, 5, 22.00, 16.30, 'On Time')
    INTO FLIGHTS VALUES (704, 604, 504, 204, 205, 104, 804, 304, 4, 5, 6, 02.15, 20.45, 'Cancelled')
    INTO FLIGHTS VALUES (705, 605, 505, 205, 206, 105, 805, 305, 5, 6, 7, 05.30, 01.00, 'On Time')
    INTO FLIGHTS VALUES (706, 606, 506, 206, 207, 106, 806, 306, 1, 2, 8, 09.45, 05.15, 'Delayed')
    INTO FLIGHTS VALUES (707, 607, 507, 207, 208, 107, 807, 307, 2, 3, 9, 12.00, 07.30, 'On Time')
    INTO FLIGHTS VALUES (708, 608, 508, 208, 209, 108, 808, 308, 3, 4, 10, 15.15, 10.45, 'On Time')
    INTO FLIGHTS VALUES (709, 609, 509, 209, 210, 109, 809, 309, 4, 5, 11, 18.30, 14.00, 'Delayed')
    INTO FLIGHTS VALUES (710, 610, 510, 210, 211, 110, 810, 310, 5, 6, 12, 21.45, 17.15, 'On Time')
    INTO FLIGHTS VALUES (711, 611, 511, 211, 212, 111, 811, 311, 1, 2, 13, 01.00, 20.30, 'On Time')
    INTO FLIGHTS VALUES (712, 612, 512, 212, 213, 112, 812, 312, 2, 3, 14, 04.15, 23.45, 'Delayed')
    INTO FLIGHTS VALUES (713, 613, 513, 213, 214, 113, 813, 313, 3, 4, 15, 07.30, 03.00, 'On Time')
    INTO FLIGHTS VALUES (714, 614, 514, 214, 215, 114, 814, 314, 4, 5, 16, 10.45, 06.15, 'On Time')
    INTO FLIGHTS VALUES (715, 615, 515, 215, 216, 115, 815, 315, 5, 6, 17, 14.00, 09.30, 'Delayed')
    INTO FLIGHTS VALUES (716, 616, 516, 216, 217, 116, 816, 316, 1, 2, 18, 17.15, 12.45, 'On Time')
    INTO FLIGHTS VALUES (717, 617, 517, 217, 218, 117, 817, 317, 2, 3, 19, 20.30, 16.00, 'On Time')
    INTO FLIGHTS VALUES (718, 618, 518, 218, 219, 118, 818, 318, 3, 4, 20, 23.45, 19.15, 'Delayed')
    INTO FLIGHTS VALUES (719, 619, 519, 219, 220, 119, 819, 319, 4, 5, 21, 03.00, 22.30, 'On Time')
    INTO FLIGHTS VALUES (720, 620, 520, 220, 201, 120, 820, 320, 5, 6, 22, 06.15, 01.45, 'On Time')
SELECT * FROM DUAL;
COMMIT;    
    
-- Insert data into CREW table
INSERT ALL 
    INTO CREW VALUES (801, 701, 501, 'Amy Johnson', 'Chris Wilson', 'Emma Brown')
    INTO CREW VALUES (802, 702, 502, 'Grace Martinez', 'Jack Davis', 'Sophie Taylor')
    INTO CREW VALUES (803, 703, 503, 'Ella Garcia', 'Joshua Rodriguez', 'Lily Hernandez')
    INTO CREW VALUES (804, 704, 504, 'Charlotte Jones', 'Lucas Martin', 'Mia Martinez')
    INTO CREW VALUES (805, 705, 505, 'Ethan White', 'Amelia Anderson', 'Daniel Wilson')
    INTO CREW VALUES (806, 706, 506, 'Olivia Taylor', 'William Moore', 'Chloe Jackson')
    INTO CREW VALUES (807, 707, 507, 'James Taylor', 'Emily Taylor', 'Benjamin Brown')
    INTO CREW VALUES (808, 708, 508, 'Alexander Harris', 'Ella Wilson', 'Noah White')
    INTO CREW VALUES (809, 709, 509, 'Lucy Garcia', 'Ryan Anderson', 'Ethan Robinson')
    INTO CREW VALUES (810, 710, 510, 'Ella Wilson', 'Oliver White', 'Ava Brown')
    INTO CREW VALUES (811, 711, 511, 'Sophia Anderson', 'Owen Moore', 'Isabella Harris')
    INTO CREW VALUES (812, 712, 512, 'Mason Martinez', 'Harper Johnson', 'Jacob Jones')
    INTO CREW VALUES (813, 713, 513, 'Thomas Taylor', 'Liam Brown', 'Zoe Moore')
    INTO CREW VALUES (814, 714, 514, 'Aiden White', 'Charlotte Thomas', 'William Johnson')
    INTO CREW VALUES (815, 715, 515, 'Grace Wilson', 'Michael Garcia', 'Mia Anderson')
    INTO CREW VALUES (816, 716, 516, 'Liam Johnson', 'Sophie White', 'Mason Brown')
    INTO CREW VALUES (817, 717, 517, 'Charlotte Taylor', 'Lucas Thomas', 'Lily Martinez')
    INTO CREW VALUES (818, 718, 518, 'Ella Johnson', 'Ethan Garcia', 'Olivia White')
    INTO CREW VALUES (819, 719, 519, 'Oliver Anderson', 'Ava Robinson', 'James Brown')
    INTO CREW VALUES (820, 720, 520, 'Sophie Johnson', 'Benjamin Moore', 'Chloe Thomas')
SELECT * FROM DUAL;
COMMIT;    
    
-- Insert data into BOOKINGS table
INSERT ALL 
    INTO BOOKINGS VALUES (901, 401, 701, '2024-01-01', 1000, 1, 'Confirmed')
    INTO BOOKINGS VALUES (902, 402, 702, '2024-01-02', 1100, 2, 'Confirmed')
    INTO BOOKINGS VALUES (903, 403, 703, '2024-01-03', 1200, 3, 'Cancelled')
    INTO BOOKINGS VALUES (904, 404, 704, '2024-01-04', 1300, 4, 'Confirmed')
    INTO BOOKINGS VALUES (905, 405, 705, '2024-01-05', 1400, 5, 'Confirmed')
    INTO BOOKINGS VALUES (906, 406, 706, '2024-01-06', 1500, 6, 'Confirmed')
    INTO BOOKINGS VALUES (907, 407, 707, '2024-01-07', 1600, 7, 'Cancelled')
    INTO BOOKINGS VALUES (908, 408, 708, '2024-01-08', 1700, 8, 'Confirmed')
    INTO BOOKINGS VALUES (909, 409, 709, '2024-01-09', 1800, 9, 'Confirmed')
    INTO BOOKINGS VALUES (910, 410, 710, '2024-01-10', 1900, 10, 'Confirmed')
    INTO BOOKINGS VALUES (911, 411, 711, '2024-01-11', 2000, 11, 'Cancelled')
    INTO BOOKINGS VALUES (912, 412, 712, '2024-01-12', 2100, 12, 'Confirmed')
    INTO BOOKINGS VALUES (913, 413, 713, '2024-01-13', 2200, 13, 'Confirmed')
    INTO BOOKINGS VALUES (914, 414, 714, '2024-01-14', 2300, 14, 'Confirmed')
    INTO BOOKINGS VALUES (915, 415, 715, '2024-01-15', 100, 15, 'Cancelled')
    INTO BOOKINGS VALUES (916, 416, 716, '2024-01-16', 200, 16, 'Confirmed')
    INTO BOOKINGS VALUES (917, 417, 717, '2024-01-17', 300, 17, 'Confirmed')
    INTO BOOKINGS VALUES (918, 418, 718, '2024-01-18', 400, 18, 'Cancelled')
    INTO BOOKINGS VALUES (919, 419, 719, '2024-01-19', 500, 19, 'Confirmed')
    INTO BOOKINGS VALUES (920, 420, 720, '2024-01-20', 600, 20, 'Confirmed')
SELECT * FROM DUAL;
COMMIT;    
    
    
-- Insert data into CATERING table
INSERT ALL
    INTO CATERING VALUES (801, 701, 'Meal', 5, 'Special meal for Business class passengers', 'Food Express')
    INTO CATERING VALUES (802, 702, 'Beverage', 3, 'Standard beverage service for Economy class passengers', 'Drink Master')
    INTO CATERING VALUES (803, 703, 'Snack', 4, 'Snack box service for all passengers', 'Snackify')
    INTO CATERING VALUES (804, 704, 'Meal', 6, 'Gourmet meal service for First class passengers', 'Gourmet Delights')
    INTO CATERING VALUES (805, 705, 'Beverage', 2, 'Premium beverage service for Business class passengers', 'Drink Master')
    INTO CATERING VALUES (806, 706, 'Snack', 3, 'Light snack service for Economy class passengers', 'Snackify')
    INTO CATERING VALUES (807, 707, 'Meal', 4, 'Standard meal service for all passengers', 'Food Express')
    INTO CATERING VALUES (808, 708, 'Beverage', 5, 'Customized beverage service for First class passengers', 'Drink Master')
    INTO CATERING VALUES (809, 709, 'Snack', 3, 'Snack box service for all passengers', 'Snackify')
    INTO CATERING VALUES (810, 710, 'Meal', 6, 'Gourmet meal service for Business class passengers', 'Gourmet Delights')
    INTO CATERING VALUES (811, 711, 'Beverage', 4, 'Standard beverage service for Economy class passengers', 'Drink Master')
    INTO CATERING VALUES (812, 712, 'Snack', 2, 'Light snack service for all passengers', 'Snackify')
    INTO CATERING VALUES (813, 713, 'Meal', 3, 'Standard meal service for all passengers', 'Food Express')
    INTO CATERING VALUES (814, 714, 'Beverage', 5, 'Premium beverage service for First class passengers', 'Drink Master')
    INTO CATERING VALUES (815, 715, 'Snack', 4, 'Snack box service for Economy class passengers', 'Snackify')
    INTO CATERING VALUES (816, 716, 'Meal', 6, 'Gourmet meal service for Business class passengers', 'Gourmet Delights')
    INTO CATERING VALUES (817, 717, 'Beverage', 3, 'Standard beverage service for all passengers', 'Drink Master')
    INTO CATERING VALUES (818, 718, 'Snack', 2, 'Light snack service for Economy class passengers', 'Snackify')
    INTO CATERING VALUES (819, 719, 'Meal', 4, 'Standard meal service for all passengers', 'Food Express')
    INTO CATERING VALUES (820, 720, 'Beverage', 5, 'Premium beverage service for First class passengers', 'Drink Master')
   SELECT * FROM DUAL;
COMMIT;    
    
     

-- Insert data into PAYMENTS table
INSERT ALL 
    INTO PAYMENTS VALUES (1001, 901, 401, '2024-01-01', 150, 'Credit Card')
    INTO PAYMENTS VALUES (1002, 902, 402, '2024-01-02', 200, 'Debit Card')
    INTO PAYMENTS VALUES (1003, 903, 403, '2024-01-03', 100, 'Credit Card')
    INTO PAYMENTS VALUES (1004, 904, 404, '2024-01-04', 250, 'Debit Card')
    INTO PAYMENTS VALUES (1005, 905, 405, '2024-01-05', 180, 'Credit Card')
    INTO PAYMENTS VALUES (1006, 906, 406, '2024-01-06', 220, 'Debit Card')
    INTO PAYMENTS VALUES (1007, 907, 407, '2024-01-07', 120, 'Credit Card')
    INTO PAYMENTS VALUES (1008, 908, 408, '2024-01-08', 270, 'Debit Card')
    INTO PAYMENTS VALUES (1009, 909, 409, '2024-01-09', 190, 'Credit Card')
    INTO PAYMENTS VALUES (1010, 910, 410, '2024-01-10', 300, 'Debit Card')
    INTO PAYMENTS VALUES (1011, 911, 411, '2024-01-11', 130, 'Credit Card')
    INTO PAYMENTS VALUES (1012, 912, 412, '2024-01-12', 280, 'Debit Card')
    INTO PAYMENTS VALUES (1013, 913, 413, '2024-01-13', 210, 'Credit Card')
    INTO PAYMENTS VALUES (1014, 914, 414, '2024-01-14', 320, 'Debit Card')
    INTO PAYMENTS VALUES (1015, 915, 415, '2024-01-15', 140, 'Credit Card')
    INTO PAYMENTS VALUES (1016, 916, 416, '2024-01-16', 350, 'Debit Card')
    INTO PAYMENTS VALUES (1017, 917, 417, '2024-01-17', 230, 'Credit Card')
    INTO PAYMENTS VALUES (1018, 918, 418, '2024-01-18', 380, 'Debit Card')
    INTO PAYMENTS VALUES (1019, 919, 419, '2024-01-19', 260, 'Credit Card')
    INTO PAYMENTS VALUES (1020, 920, 420, '2024-01-20', 400, 'Debit Card')
   SELECT * FROM DUAL;
COMMIT;    

-- Insert data into FEEDBACK table
INSERT ALL 
    INTO FEEDBACK VALUES (1111, 401, 701, 801, 'GOOD', 'The flight experience was excellent. The crew was very professional.', SYSDATE)
    INTO FEEDBACK VALUES (1112, 402, 702, 802, 'BAD', 'Unfortunately, the flight was delayed, causing inconvenience.', SYSDATE)
    INTO FEEDBACK VALUES (1113, 403, 703, 803, 'GOOD', 'Had to cancel my flight due to personal reasons.', SYSDATE)
    INTO FEEDBACK VALUES (1114, 404, 704, 804, 'GOOD', 'The flight was smooth, and the service was good.', SYSDATE)
    INTO FEEDBACK VALUES (1115, 405, 705, 805, 'GOOD', 'Great experience overall. The seats were comfortable.', SYSDATE)
    INTO FEEDBACK VALUES (1116, 406, 706, 806, 'BAD', 'Flight delay made me miss my connecting flight.', SYSDATE)
    INTO FEEDBACK VALUES (1117, 407, 707, 807, 'BAD', 'Unfortunately, my flight got cancelled last minute.', SYSDATE)
    INTO FEEDBACK VALUES (1118, 408, 708, 808, 'GOOD', 'Excellent service from the crew.', SYSDATE)
    INTO FEEDBACK VALUES (1119, 409, 709, 809, 'GOOD', 'The flight was on time, and the staff was friendly.', SYSDATE)
    INTO FEEDBACK VALUES (1120, 410, 710, 810, 'GOOD', 'No complaints. Everything went smoothly.', SYSDATE)
    INTO FEEDBACK VALUES (1121, 411, 711, 811, 'BAD', 'Flight cancellation without prior notice.', SYSDATE)
    INTO FEEDBACK VALUES (1122, 412, 712, 812, 'GOOD', 'Comfortable seats and good in-flight entertainment.', SYSDATE)
    INTO FEEDBACK VALUES (1123, 413, 713, 813, 'GOOD', 'Smooth flight experience.', SYSDATE)
    INTO FEEDBACK VALUES (1124, 414, 714, 814, 'GOOD', 'Good service overall. Enjoyed the journey.', SYSDATE)
    INTO FEEDBACK VALUES (1125, 415, 715, 815, 'BAD', 'Flight cancellation caused inconvenience.', SYSDATE)
    INTO FEEDBACK VALUES (1126, 416, 716, 816, 'GOOD', 'Flight attendants were helpful and attentive.', SYSDATE)
    INTO FEEDBACK VALUES (1127, 417, 717, 817, 'GOOD', 'No complaints. The flight was as expected.', SYSDATE)
    INTO FEEDBACK VALUES (1128, 418, 718, 818, 'BAD', 'Last-minute cancellation was disappointing.', SYSDATE)
    INTO FEEDBACK VALUES (1129, 419, 719, 819, 'GOOD', 'Pleasant journey overall.', SYSDATE)
    INTO FEEDBACK VALUES (1130, 420, 720, 820, 'GOOD', 'Satisfied with the service provided.', SYSDATE)
SELECT * FROM DUAL;
COMMIT;



-- Insert data into FREQFLYER table
INSERT ALL 
    INTO FREQFLYER VALUES (2001, 401, 5000, 'Gold')
    INTO FREQFLYER VALUES (2002, 402, 3000, 'Silver')
    INTO FREQFLYER VALUES (2003, 403, 2000, 'Silver')
    INTO FREQFLYER VALUES (2004, 404, 4500, 'Gold')
    INTO FREQFLYER VALUES (2005, 405, 3500, 'Silver')
    INTO FREQFLYER VALUES (2006, 406, 1500, 'Regular')
    INTO FREQFLYER VALUES (2007, 407, 4000, 'Gold')
    INTO FREQFLYER VALUES (2008, 408, 2800, 'Silver')
    INTO FREQFLYER VALUES (2009, 409, 2200, 'Silver')
    INTO FREQFLYER VALUES (2010, 410, 5000, 'Gold')
    INTO FREQFLYER VALUES (2011, 411, 3200, 'Silver')
    INTO FREQFLYER VALUES (2012, 412, 1800, 'Regular')
    INTO FREQFLYER VALUES (2013, 413, 4100, 'Gold')
    INTO FREQFLYER VALUES (2014, 414, 2500, 'Silver')
    INTO FREQFLYER VALUES (2015, 415, 1900, 'Silver')
    INTO FREQFLYER VALUES (2016, 416, 4800, 'Gold')
    INTO FREQFLYER VALUES (2017, 417, 3800, 'Silver')
    INTO FREQFLYER VALUES (2018, 418, 1200, 'Regular')
    INTO FREQFLYER VALUES (2019, 419, 4200, 'Gold')
    INTO FREQFLYER VALUES (2020, 420, 3000, 'Silver')
SELECT * FROM DUAL;
COMMIT;

--Harleen
--CHECKING THE INFO OF THE CUSTOMER WHO RECENTLY BOOKED A FLIGHT AND THE FIRST CUSTOMER IN THE DATABASE
SELECT * 
FROM bookings  
WHERE BOOKINGDATE = (SELECT MAX(BOOKINGDATE) FROM BOOKINGS) OR BOOKINGDATE = (SELECT MIN(BOOKINGDATE) FROM BOOKINGS);

--CHECKING THE AVERAGE BOOKING SIZE OF THE WEBSITE ,LOWEST AND THE HIGHEST
SELECT AVG(PAYMENTAMOUNT) AS AVGBOOKING, MAX(PAYMENTAMOUNT) AS HIGHESTBOOKING, MIN(PAYMENTAMOUNT) AS LOWESTBOOKING 
FROM PAYMENTS;

--SHOWING TOTAL NUMBER OF CATERIINGS PER CATERINGTYPE 
SELECT cateringtype ,COUNT(CATERINGID) NOOFCATERING
FROM catering
GROUP BY cateringtype;

--SHOW ALL THE INFO OF COMPANIES WHICH IS OWNED BY DRINKMASTER
SELECT *
FROM CATERING
WHERE UPPER(parentcompany) = 'DRINK MASTER'
ORDER BY  cateringid;

--SELECTING ALL FLIGHT SERVICE WHIICH HAS A NEGAITIVE FEEDBACK FROM CUSTOMERS
SELECT *
FROM feedback
WHERE UPPER(feedbacktype) = 'BAD'
ORDER BY FLIGHTID;

--LIST OF CUSTOMERS WHO HAVE PAID MORE THAN AVERAGE FOR A BOOKING 
SELECT CUSTOMERID
FROM payments
WHERE paymentamount > (SELECT AVG(PAYMENTAMOUNT) FROM PAYMENTS );


--DISPLAY ALL THE FEEDBACKID WHO ARE GREATER THAN THAT OF FLIGHT 706
SELECT FEEDBACKID
FROM feedback
WHERE feedbackid > (SELECT FEEDBACKID FROM FEEDBACK WHERE FLIGHTID =706)
GROUP BY FEEDBACKID
;
--DISPLAYING ALL THE CUSTOMER NO IN BOOKING AND PAYMENTS WITHOUT DUPLICATE 
SELECT CUSTOMERID
FROM BOOKINGS
UNION
SELECT CUSTOMERID
FROM PAYMENTS;