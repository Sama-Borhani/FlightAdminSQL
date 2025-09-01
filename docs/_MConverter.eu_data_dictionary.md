| Name          | Data type   | Primary Key | Not null    | Unique | Foreign Key | Default value | Validation |
|---------------|-------------|-------------|-------------|--------|-------------|---------------|------------|
| BOOKINGID     | INT         | $$\sqrt{}$$ | $$\sqrt{}$$ |        |             |               |            |
| CUSTOMERID    | INT         |             | $$\sqrt{}$$ |        | $$\sqrt{}$$ |               |            |
| FLIGHTID      | INT         |             | $$\sqrt{}$$ |        | $$\sqrt{}$$ |               |            |
| BOOKINGDATE   | DATE        |             | $$\sqrt{}$$ |        |             |               |            |
| BOOKINGTIME   | INT         |             | $$\sqrt{}$$ |        |             |               |            |
| SEATNUMBER    | INT         |             | $$\sqrt{}$$ |        |             |               |            |
| BOOKINGSTATUS | VARCHAR(20) |             | $$\sqrt{}$$ |        |             |               |            |

AIRLINE RESERVATION APP

GROUP3

DATA DICTIONARIES

TABLES CHOSEN: BOOKINGS, CATERINGS, PAYMENTS, FEEDBACK

BOOKINGS

CATERING

| Name              | Data type    | Primary Key | Not null    | Unique | Foreign Key | Default value | Validation |
|-------------------|--------------|-------------|-------------|--------|-------------|---------------|------------|
| CUSTOMERID        | INT          | $$\sqrt{}$$ | $$\sqrt{}$$ |        |             |               |            |
| FLIGHTID          | INT          |             | $$\sqrt{}$$ |        | $$\sqrt{}$$ |               |            |
| CATERINGTYPE      | VARCHAR(50)  |             | $$\sqrt{}$$ |        |             |               |            |
| YEARSOFEXPERIENCE | INT          |             | $$\sqrt{}$$ |        |             |               |            |
| CATERINGDETAILS   | VARCHAR(300) |             | $$\sqrt{}$$ |        |             |               |            |
| PARENTCOMPANY     | VARCHAR(230) |             | $$\sqrt{}$$ |        |             |               |            |

PAYMENTS

| Name          | Data type   | Primary Key | Not null    | Unique | Foreign Key | Default value | Validation         |
|---------------|-------------|-------------|-------------|--------|-------------|---------------|--------------------|
| PAYMENTID     | INT         | $$\sqrt{}$$ | $$\sqrt{}$$ |        |             |               |                    |
| BOOKINGID     | INT         |             | $$\sqrt{}$$ |        | $$\sqrt{}$$ |               |                    |
| CUSTOMERID    | INT         |             | $$\sqrt{}$$ |        | $$\sqrt{}$$ |               |                    |
| PAYMENTDATE   | DATE        |             | $$\sqrt{}$$ |        |             |               |                    |
| PAYMENTAMOUNT | INT         |             | $$\sqrt{}$$ |        |             |               | PAYMENTAMOUBT \> 0 |
| PAYMENTMETHOD | VARCHAR(20) |             | $$\sqrt{}$$ |        |             |               |                    |

FEEDBACK

| Name            | Data type    | Primary Key | Not null | Unique | Foreign Key | Default value | Validation |
|-----------------|--------------|-------------|----------|--------|-------------|---------------|------------|
| FEEDBACKID      | INT          | $$\sqrt{}$$ |          |        |             |               |            |
| CUSTOMERID      | INT          |             |          |        | $$\sqrt{}$$ |               |            |
| FLIGHTID        | INT          |             |          |        | $$\sqrt{}$$ |               |            |
| CATERINGID      | INT          |             |          |        | $$\sqrt{}$$ |               |            |
| FEEDBACKTYPE    | VARCHAR(50)  |             |          |        |             |               |            |
| FEEDBACKDETAILS | VARCHAR(200) |             |          |        |             |               |            |
| FEEDBACKDATE    | DATE         |             |          |        |             |               |            |
