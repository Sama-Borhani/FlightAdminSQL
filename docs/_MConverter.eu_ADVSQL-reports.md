**ADVANCED SQL REPORTS**

**Harleen's Tables:**

**1. BOOKINGS,**

**2. CATERINGS,**

**3. PAYMENTS,**

**4. FEEDBACK**

1.  \--CHECKING THE INFO OF THE CUSTOMER WHO RECENTLY BOOKED A FLIGHT
    AND THE FIRST CUSTOMER IN THE DATABASE

SELECT \*

FROM bookings

WHERE BOOKINGDATE = (SELECT MAX(BOOKINGDATE) FROM BOOKINGS) OR
BOOKINGDATE = (SELECT MIN(BOOKINGDATE) FROM BOOKINGS);

![A screenshot of a computer Description automatically
generated](media/image1.png){width="6.5in" height="1.632638888888889in"}

2.  \--CHECKING THE AVERAGE BOOKING SIZE OF THE WEBSITE ,LOWEST AND THE
    HIGHEST

SELECT AVG(PAYMENTAMOUNT) AS AVGBOOKING, MAX(PAYMENTAMOUNT) AS
HIGHESTBOOKING, MIN(PAYMENTAMOUNT) AS LOWESTBOOKING

FROM PAYMENTS;

![A screenshot of a computer Description automatically
generated](media/image2.png){width="6.5in"
height="1.2402777777777778in"}

3.  SHOWING TOTAL NUMBER OF CATERIINGS PER CATERINGTYPE

SELECT cateringtype ,COUNT(CATERINGID) NOOFCATERING

FROM catering

GROUP BY cateringtype;

![A screenshot of a computer Description automatically
generated](media/image3.png){width="5.674699256342957in"
height="3.0748950131233594in"}

4.  \--SHOW ALL THE INFO OF COMPANIES WHICH IS OWNED BY DRINKMASTER

SELECT \*

FROM CATERING

WHERE UPPER(parentcompany) = \'DRINK MASTER\'

ORDER BY cateringid;

![A screenshot of a computer Description automatically
generated](media/image4.png){width="6.5in"
height="2.0520833333333335in"}

5.  \--SELECTING ALL FLIGHT SERVICE WHICH HAS A NEGATIVE FEEDBACK FROM
    CUSTOMERS

SELECT \*

FROM feedback

WHERE UPPER(feedbacktype) = \'BAD\'

ORDER BY FLIGHTID;

![A screenshot of a computer Description automatically
generated](media/image5.png){width="6.5in"
height="1.7631944444444445in"}

6.  \--LIST OF CUSTOMERS WHO HAVE PAID MORE THAN AVERAGE FOR A BOOKING

SELECT CUSTOMERID

FROM payments

WHERE paymentamount \> (SELECT AVG(PAYMENTAMOUNT) FROM PAYMENTS );

![A screenshot of a computer Description automatically
generated](media/image6.png){width="5.397590769903762in"
height="3.884420384951881in"}

7.  SELECT FEEDBACKID

FROM feedback

WHERE feedbackid \> (SELECT FEEDBACKID FROM FEEDBACK WHERE FLIGHTID
=706)

GROUP BY FEEDBACKID;

![A screenshot of a computer Description automatically
generated](media/image7.png){width="4.421687445319335in"
height="3.707415791776028in"}

8.  \--DISPLAYING ALL THE CUSTOMER NO IN BOOKING AND PAYMENTS WITHOUT
    DUPLICATE .

SELECT CUSTOMERID

FROM BOOKINGS

UNION

SELECT CUSTOMERID

FROM PAYMENTS;

![A screenshot of a computer Description automatically
generated](media/image8.png){width="4.602410323709536in"
height="4.78090113735783in"}

**Sama's Tables:**

**1. FLIGHTS**

**2. AIRCRAFTS**

**3. AIRPORT**

**4. FREQFLYER**

1.  SELECTING THE MAX NUMBER OF SEATS MANUFACTURED BY ANY COMPANY
    BUILDING AN AIRCRAFT

SELECT MANUFACTURER, max(TOTALSEATS) as MAXCAPACITY

FROM AIRCRAFTS

GROUP BY manufacturer

ORDER BY manufacturer;

![A screenshot of a computer Description automatically
generated](media/image9.png){width="5.614458661417323in"
height="2.2067946194225723in"}

2.  DISPLAY ALL THE DETAILS FOR MANUFACTURED AIRCRAFT WHO ARE
    MANUFACTURED BEFORE Airbus A350 AND SHOWN THEM IN DECENDING ORDER OF
    MANUFACURE

SELECT \*

FROM aircrafts

WHERE YEAROFMANUFACTURE \< (SELECT YEAROFMANUFACTURE FROM AIRCRAFTS
WHERE aircrafttype =\'Airbus A350\')

ORDER BY aircrafts.yearofmanufacture DESC;

![A screenshot of a computer Description automatically
generated](media/image10.png){width="6.5in"
height="2.8944444444444444in"}

3.  DISPLAY ALL THE FLIGHTIDS WHOSE ARRIVAL TERMINAL IS GREATER THAN OR
    EQUAL TO THAT OF FLIGHT 703

SELECT FLIGHTID

FROM FLIGHTS

WHERE FLIGHTID \>= (SELECT FLIGHTID FROM FLIGHTS WHERE FLIGHTID=703)

ORDER BY FLIGHTID;

![A screenshot of a computer Description automatically
generated](media/image11.png){width="5.132530621172354in"
height="3.8707830271216097in"}

4.  DISPLAY ALL THE FLIGHTS WHO HAVE ARRIVED BEFORE FLIGHT 709 IN A
    ASCENDING ORDER

SELECT \*

FROM FLIGHTS

WHERE arrivaltime \< (SELECT ARRIVALTIME FROM FLIGHTS WHERE FLIGHTID =
709)

ORDER BY ARRIVALTIME;

![A screenshot of a computer Description automatically
generated](media/image12.png){width="6.5in"
height="2.1902777777777778in"}

5.  SELECTING COUNTRY HAVING MORE THAN ONE AIRPORT

SELECT COUNTRY,COUNT(airportid) AS TOTALNUMBEROFAIRPORTS

FROM AIRPORT

GROUP BY country

HAVING COUNT(AIRPORTID) \> 1;

![A screenshot of a computer Description automatically
generated](media/image13.png){width="5.469879702537183in"
height="2.5330314960629923in"}

6.  SELECTING AVERAGE POINTS IN EACH CATEGORY IN FREQUENCY FLYER

SELECT STATUS,ROUND(AVG(POINTS),2) AS AVERAGEPOINTS

FROM freqflyer

GROUP BY STATUS;

![A screenshot of a computer Description automatically
generated](media/image14.png){width="6.5in"
height="2.9784722222222224in"}

7.  SELECTING THE CUSTOMER WHO HAVE POINTS MORE THAN AVG OF THE WHOLE

SELECT CUSTOMERID , POINTS,STATUS

FROM freqflyer

WHERE points \> (SELECT AVG(POINTS) FROM FREQFLYER )

ORDER BY CUSTOMERID;

![A screenshot of a computer Description automatically
generated](media/image15.png){width="5.2168678915135605in"
height="3.7682950568678915in"}

8.  DISPLAY THE AIRPORT ID WHERE THE LATITUDE IS MAXIMUM

SELECT AIRPORTID AS HIGHESTAIRPORT,AIRPORTNAME

FROM AIRPORT

WHERE LATITUDE = (SELECT MAX(LATITUDE) FROM AIRPORT );

![A screenshot of a computer Description automatically
generated](media/image16.png){width="5.361445756780403in"
height="2.6016994750656166in"}

9.  LIST THE CUSTOMER WHO ARE NOT IN FREQUENT FLYER

SELECT CUSTOMERID

FROM customers

MINUS

SELECT customerid

FROM freqflyer;

![A screenshot of a computer Description automatically
generated](media/image17.png){width="5.276055336832896in"
height="2.975903324584427in"}

10. DISPLAY ALL THE CUSTOMERS AND THEIR POINTS COLLECTED IF THE CUSTOMER
    DOSENT HAVE ANY POINT DISPLAY 0

SELECT CUSTOMERID ,POINTS AS POINTS

FROM freqflyer

UNION

SELECT CUSTOMERID , 0 AS POINTS

FROM CUSTOMERS

ORDER BY CUSTOMERID;

![A screenshot of a computer Description automatically
generated](media/image18.png){width="5.325301837270342in"
height="4.409873140857393in"}

**Urman's Tables:**

**1. COMPANY**

**2. PILOTS**

**3. PORTS**

**4. CUSTOMER**

**5. CREW**

1.  DISPLAY ALL THE COMPANY NAMES WHO HAVE ID BETWEEN 305-309 EXCLUDING
    BOTH

SELECT COMPANYNAME

FROM COMPANIES

WHERE COMPANYID \> (SELECT COMPANYID FROM COMPANIES WHERE companyid=305)
AND

COMPANYID \< (SELECT COMPANYID FROM COMPANIES WHERE companyid=309);

![A screenshot of a computer Description automatically
generated](media/image19.png){width="6.5in" height="2.6875in"}

2.  DISPLAY ALL THE DETAILS OF THE COMPANY WHICH IS FIRST IN THE LIST
    ALPHABETICALLY

SELECT \*

FROM COMPANIES

WHERE COMPANYNAME =( SELECT MIN(COMPANYNAME) FROM COMPANIES);

![A screenshot of a computer Description automatically
generated](media/image20.png){width="6.5in"
height="1.6166666666666667in"}

3.  DISPLAY ALL COUNT OF ALL THE PORTS IN THE DATABASE WHOSE PORTCODE IS
    LESS THAN 1006

SELECT COUNT(PORTID) AS COUNTOFPORT

FROM PORT

WHERE portcode \<( SELECT PORTCODE FROM PORT WHERE PORTCODE = 1006);

![A screenshot of a computer Description automatically
generated](media/image21.png){width="6.5in"
height="2.0631944444444446in"}

4.  DISPLAY ALL THE PORTID WHO ARE NOT IN FLIGHT

SELECT PORTID

FROM PORT

MINUS

SELECT PORTID

FROM FLIGHTS;

![A screenshot of a computer Description automatically
generated](media/image22.png){width="5.361445756780403in"
height="2.8292935258092737in"}

\*\*there are no ports which are not in the flights table, all the ports
are used, so no inactive port.

5.  DISPLAYING THE AVERAGE NUMBER OF FLIGHTS FOR A PILOT

SELECT AVG(TOTALFLIGHTS) AS AVGFLYINGHOURS

FROM PILOTS;

![A screenshot of a computer Description automatically
generated](media/image23.png){width="5.650602580927384in"
height="2.262714348206474in"}

6.  SELECT THE PILOTS WHOSE TOTAL FLIGHT FALL UNDER AVERAGE OF THE WHOLE

SELECT PILOTID

FROM PILOTS

WHERE TOTALFLIGHTS \< (SELECT AVG(TOTALFLIGHTS) FROM PILOTS);

![A screenshot of a computer Description automatically
generated](media/image24.png){width="6.132530621172354in"
height="4.3327373140857395in"}

7.  DISPLAY THE CUSTOMERS WHO LIVE HAS HIGHEST CUSTOMERID

SELECT MAX(CUSTOMERID) AS MAXCUSTOMERID

FROM CUSTOMERS;

![A screenshot of a computer Description automatically
generated](media/image25.png){width="6.5in"
height="2.527083333333333in"}

8.  COUNT THR NUMBER OF CUSTOMER WHOSE ID IS MORE THAN THAT OF AVERAGE
    OF ALL

SELECT COUNT(CUSTOMERID) AS COUNTOFID

FROM customers

WHERE customerid \> (SELECT AVG(CUSTOMERID) FROM CUSTOMERS );

![A screenshot of a computer program Description automatically
generated](media/image26.png){width="6.5in"
height="2.0215277777777776in"}

9.  SELECT FLIGHT DETAILS WHICH WAS OPERATED BY PILOT ID 512,509 AND 515

SELECT \*

FROM FLIGHTS

WHERE PILOTID = (SELECT PILOTID FROM PILOTS WHERE PILOTID =512)

OR PILOTID = (SELECT PILOTID FROM PILOTS WHERE PILOTID =509)

OR PILOTID = (SELECT PILOTID FROM PILOTS WHERE PILOTID =515);

![A screenshot of a computer Description automatically
generated](media/image27.png){width="6.5in"
height="1.2243055555555555in"}

10. SELECT PILOTS WHO IS MOST EXPERIENCED IN THE DATABASE

SELECT PILOTID,FIRSTNAME \|\| LASTNAME AS PILOTFULLNAME,TOTALFLIGHTS

> FROM PILOTS

WHERE TOTALFLIGHTS = (SELECT MAX(TOTALFLIGHTS) FROM PILOTS );

![A screenshot of a computer program Description automatically
generated](media/image28.png){width="6.5in"
height="2.513888888888889in"}

11. DISPLAY PILOT INFO OF THE FLIGHTS WHICH ARE DELAYED OR CANCELLED

SELECT PILOTID

FROM FLIGHTS

WHERE UPPER(FLIGHTSTATUS) = \'DELAYED\' OR UPPER(FLIGHTSTATUS) =
\'CANCELLED\'

GROUP BY PILOTID

ORDER BY PILOTID;

![A screenshot of a computer Description automatically
generated](media/image29.png){width="5.457831364829397in"
height="3.336508092738408in"}

12. DISPLAY ALL THE CREWMEMBERS IN CREW AS WELL AS FLIGHTS INCLUDING ALL
    THE DUPLICATES

SELECT CREWID,flightattendant1 \|\| \',\' \|\| flightattendant2 \|\|
\',\' \|\|flightattendant3 AS CREWMEMBERS

FROM CREW

UNION ALL

SELECT CREWID, TO_CHAR(NULL)

FROM flights

GROUP BY CREWID

ORDER BY CREWID;![A screenshot of a computer Description automatically
generated](media/image30.png){width="5.771038932633421in"
height="5.012048337707786in"}

13. DISPLAY THE CREW ID WHICH HAS HIGHEST PILOTID

SELECT CREWID

FROM CREW

WHERE pilotid = (SELECT MAX(PILOTID) FROM CREW)

![A screenshot of a computer program Description automatically
generated](media/image31.png){width="5.263888888888889in"
height="2.5555555555555554in"}
