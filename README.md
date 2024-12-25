```markdown
# FlightAdminSQL

FlightAdminSQL is an advanced SQL project aimed at managing an airline operations database. The project includes comprehensive schema design, ensuring data integrity, executing complex queries, and controlling transactions to highlight proficiency in robust database management solutions for airline operations.

## Features

- **Schema Design**: Defines a clear and organized structure for storing airline operations data, including tables for airports, companies, customers, pilots, aircrafts, flights, crew, bookings, catering, payments, feedback, and frequent flyer programs.

- **Data Integrity**: Implements primary keys, unique constraints, and foreign keys to ensure data accuracy and consistency.

- **Complex Queries**: Demonstrates the ability to handle advanced SQL queries for reporting and analytics, such as joining multiple tables and filtering records based on specific conditions.

- **Transaction Control**: Utilizes SQL transaction controls to ensure that all data manipulations are processed reliably and any changes are committed or rolled back appropriately.

## Database Setup

### Enable Autocommit

```sql
SET AUTOCOMMIT ON;
```

### Create Tables

```sql
-- Example: Creating the 'AIRPORT' table
CREATE TABLE AIRPORT
(
    AIRPORTID INT PRIMARY KEY,
    AIRPORTNAME VARCHAR(35) NOT NULL,
    CITY VARCHAR(35) NOT NULL,
    COUNTRY VARCHAR(35) NOT NULL,
    LATITUDE INT NOT NULL,
    LONGITUDE INT NOT NULL
);
```

### Insert Data

```sql
-- Example: Inserting data into the 'AIRPORT' table
INSERT INTO AIRPORT VALUES (201, 'Heathrow', 'London', 'United Kingdom', 51.4700, -0.4543);
```

### Complex Queries

```sql
-- Example: Joining FLIGHTS, CUSTOMERS, and BOOKINGS to get detailed booking information
SELECT 
    F.FLIGHTID,
    F.ARRIVALTIME,
    F.DEPARTURETIME,
    C.FIRSTNAME,
    C.LASTNAME,
    C.EMAIL,
    B.BOOKINGDATE,
    B.BOOKINGTIME,
    B.SEATNUMBER,
    B.BOOKINGSTATUS
FROM 
    FLIGHTS F
JOIN 
    BOOKINGS B ON F.FLIGHTID = B.FLIGHTID
JOIN 
    CUSTOMERS C ON B.CUSTOMERID = C.CUSTOMERID;
```

### Schema Modifications

```sql
-- Example: Modifying the 'COMPANIES' table to enforce email format
ALTER TABLE COMPANIES
DROP COLUMN EMAIL;

ALTER TABLE COMPANIES
ADD EMAIL VARCHAR(255) NOT NULL
CONSTRAINT email_format CHECK (EMAIL ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
```

### Clean Up

```sql
-- Dropping all tables
DROP TABLE FREQFLYER, FEEDBACK, PAYMENTS, CATERING, BOOKINGS, CREW, FLIGHTS, AIRCRAFTS, PILOTS, CUSTOMERS, COMPANIES, AIRPORT, PORT;
```

