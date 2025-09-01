AIRLINE RESERVATION APP

DATA SCRIPT

TABLES CHOSEN: BOOKINGS, CATERINGS, PAYMENTS, FEEDBACK

Data script for the chosen tables:

**\-- Insert data into BOOKINGS table**

**INSERT ALL**

**INTO BOOKINGS VALUES (901, 401, 701, \'2024-01-01\', 1000, 1,
\'Confirmed\')**

**INTO BOOKINGS VALUES (902, 402, 702, \'2024-01-02\', 1100, 2,
\'Confirmed\')**

**INTO BOOKINGS VALUES (903, 403, 703, \'2024-01-03\', 1200, 3,
\'Cancelled\')**

**INTO BOOKINGS VALUES (904, 404, 704, \'2024-01-04\', 1300, 4,
\'Confirmed\')**

**INTO BOOKINGS VALUES (905, 405, 705, \'2024-01-05\', 1400, 5,
\'Confirmed\')**

**INTO BOOKINGS VALUES (906, 406, 706, \'2024-01-06\', 1500, 6,
\'Confirmed\')**

**INTO BOOKINGS VALUES (907, 407, 707, \'2024-01-07\', 1600, 7,
\'Cancelled\')**

**INTO BOOKINGS VALUES (908, 408, 708, \'2024-01-08\', 1700, 8,
\'Confirmed\')**

**INTO BOOKINGS VALUES (909, 409, 709, \'2024-01-09\', 1800, 9,
\'Confirmed\')**

**INTO BOOKINGS VALUES (910, 410, 710, \'2024-01-10\', 1900, 10,
\'Confirmed\')**

**INTO BOOKINGS VALUES (911, 411, 711, \'2024-01-11\', 2000, 11,
\'Cancelled\')**

**INTO BOOKINGS VALUES (912, 412, 712, \'2024-01-12\', 2100, 12,
\'Confirmed\')**

**INTO BOOKINGS VALUES (913, 413, 713, \'2024-01-13\', 2200, 13,
\'Confirmed\')**

**INTO BOOKINGS VALUES (914, 414, 714, \'2024-01-14\', 2300, 14,
\'Confirmed\')**

**INTO BOOKINGS VALUES (915, 415, 715, \'2024-01-15\', 100, 15,
\'Cancelled\')**

**INTO BOOKINGS VALUES (916, 416, 716, \'2024-01-16\', 200, 16,
\'Confirmed\')**

**INTO BOOKINGS VALUES (917, 417, 717, \'2024-01-17\', 300, 17,
\'Confirmed\')**

**INTO BOOKINGS VALUES (918, 418, 718, \'2024-01-18\', 400, 18,
\'Cancelled\')**

**INTO BOOKINGS VALUES (919, 419, 719, \'2024-01-19\', 500, 19,
\'Confirmed\')**

**INTO BOOKINGS VALUES (920, 420, 720, \'2024-01-20\', 600, 20,
\'Confirmed\')**

**SELECT \* FROM DUAL;**

**COMMIT;**

**\-- Insert data into CATERING table**

**INSERT ALL**

**INTO CATERING VALUES (801, 701, \'Meal\', 5, \'Special meal for
Business class passengers\', \'Food Express\')**

**INTO CATERING VALUES (802, 702, \'Beverage\', 3, \'Standard beverage
service for Economy class passengers\', \'Drink Master\')**

**INTO CATERING VALUES (803, 703, \'Snack\', 4, \'Snack box service for
all passengers\', \'Snackify\')**

**INTO CATERING VALUES (804, 704, \'Meal\', 6, \'Gourmet meal service
for First class passengers\', \'Gourmet Delights\')**

**INTO CATERING VALUES (805, 705, \'Beverage\', 2, \'Premium beverage
service for Business class passengers\', \'Drink Master\')**

**INTO CATERING VALUES (806, 706, \'Snack\', 3, \'Light snack service
for Economy class passengers\', \'Snackify\')**

**INTO CATERING VALUES (807, 707, \'Meal\', 4, \'Standard meal service
for all passengers\', \'Food Express\')**

**INTO CATERING VALUES (808, 708, \'Beverage\', 5, \'Customized beverage
service for First class passengers\', \'Drink Master\')**

**INTO CATERING VALUES (809, 709, \'Snack\', 3, \'Snack box service for
all passengers\', \'Snackify\')**

**INTO CATERING VALUES (810, 710, \'Meal\', 6, \'Gourmet meal service
for Business class passengers\', \'Gourmet Delights\')**

**INTO CATERING VALUES (811, 711, \'Beverage\', 4, \'Standard beverage
service for Economy class passengers\', \'Drink Master\')**

**INTO CATERING VALUES (812, 712, \'Snack\', 2, \'Light snack service
for all passengers\', \'Snackify\')**

**INTO CATERING VALUES (813, 713, \'Meal\', 3, \'Standard meal service
for all passengers\', \'Food Express\')**

**INTO CATERING VALUES (814, 714, \'Beverage\', 5, \'Premium beverage
service for First class passengers\', \'Drink Master\')**

**INTO CATERING VALUES (815, 715, \'Snack\', 4, \'Snack box service for
Economy class passengers\', \'Snackify\')**

**INTO CATERING VALUES (816, 716, \'Meal\', 6, \'Gourmet meal service
for Business class passengers\', \'Gourmet Delights\')**

**INTO CATERING VALUES (817, 717, \'Beverage\', 3, \'Standard beverage
service for all passengers\', \'Drink Master\')**

**INTO CATERING VALUES (818, 718, \'Snack\', 2, \'Light snack service
for Economy class passengers\', \'Snackify\')**

**INTO CATERING VALUES (819, 719, \'Meal\', 4, \'Standard meal service
for all passengers\', \'Food Express\')**

**INTO CATERING VALUES (820, 720, \'Beverage\', 5, \'Premium beverage
service for First class passengers\', \'Drink Master\')**

**SELECT \* FROM DUAL;**

**COMMIT;**

**\-- Insert data into PAYMENTS table**

**INSERT ALL**

**INTO PAYMENTS VALUES (1001, 901, 401, \'2024-01-01\', 150, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1002, 902, 402, \'2024-01-02\', 200, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1003, 903, 403, \'2024-01-03\', 100, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1004, 904, 404, \'2024-01-04\', 250, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1005, 905, 405, \'2024-01-05\', 180, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1006, 906, 406, \'2024-01-06\', 220, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1007, 907, 407, \'2024-01-07\', 120, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1008, 908, 408, \'2024-01-08\', 270, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1009, 909, 409, \'2024-01-09\', 190, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1010, 910, 410, \'2024-01-10\', 300, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1011, 911, 411, \'2024-01-11\', 130, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1012, 912, 412, \'2024-01-12\', 280, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1013, 913, 413, \'2024-01-13\', 210, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1014, 914, 414, \'2024-01-14\', 320, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1015, 915, 415, \'2024-01-15\', 140, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1016, 916, 416, \'2024-01-16\', 350, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1017, 917, 417, \'2024-01-17\', 230, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1018, 918, 418, \'2024-01-18\', 380, \'Debit
Card\')**

**INTO PAYMENTS VALUES (1019, 919, 419, \'2024-01-19\', 260, \'Credit
Card\')**

**INTO PAYMENTS VALUES (1020, 920, 420, \'2024-01-20\', 400, \'Debit
Card\')**

**SELECT \* FROM DUAL;**

**COMMIT;**

**\-- Insert data into FEEDBACK table**

**INSERT ALL**

**INTO FEEDBACK VALUES (1111, 401, 701, 801, \'GOOD\', \'The flight
experience was excellent. The crew was very professional.\', SYSDATE)**

**INTO FEEDBACK VALUES (1112, 402, 702, 802, \'BAD\', \'Unfortunately,
the flight was delayed, causing inconvenience.\', SYSDATE)**

**INTO FEEDBACK VALUES (1113, 403, 703, 803, \'GOOD\', \'Had to cancel
my flight due to personal reasons.\', SYSDATE)**

**INTO FEEDBACK VALUES (1114, 404, 704, 804, \'GOOD\', \'The flight was
smooth, and the service was good.\', SYSDATE)**

**INTO FEEDBACK VALUES (1115, 405, 705, 805, \'GOOD\', \'Great
experience overall. The seats were comfortable.\', SYSDATE)**

**INTO FEEDBACK VALUES (1116, 406, 706, 806, \'BAD\', \'Flight delay
made me miss my connecting flight.\', SYSDATE)**

**INTO FEEDBACK VALUES (1117, 407, 707, 807, \'BAD\', \'Unfortunately,
my flight got cancelled last minute.\', SYSDATE)**

**INTO FEEDBACK VALUES (1118, 408, 708, 808, \'GOOD\', \'Excellent
service from the crew.\', SYSDATE)**

**INTO FEEDBACK VALUES (1119, 409, 709, 809, \'GOOD\', \'The flight was
on time, and the staff was friendly.\', SYSDATE)**

**INTO FEEDBACK VALUES (1120, 410, 710, 810, \'GOOD\', \'No complaints.
Everything went smoothly.\', SYSDATE)**

**INTO FEEDBACK VALUES (1121, 411, 711, 811, \'BAD\', \'Flight
cancellation without prior notice.\', SYSDATE)**

**INTO FEEDBACK VALUES (1122, 412, 712, 812, \'GOOD\', \'Comfortable
seats and good in-flight entertainment.\', SYSDATE)**

**INTO FEEDBACK VALUES (1123, 413, 713, 813, \'GOOD\', \'Smooth flight
experience.\', SYSDATE)**

**INTO FEEDBACK VALUES (1124, 414, 714, 814, \'GOOD\', \'Good service
overall. Enjoyed the journey.\', SYSDATE)**

**INTO FEEDBACK VALUES (1125, 415, 715, 815, \'BAD\', \'Flight
cancellation caused inconvenience.\', SYSDATE)**

**INTO FEEDBACK VALUES (1126, 416, 716, 816, \'GOOD\', \'Flight
attendants were helpful and attentive.\', SYSDATE)**

**INTO FEEDBACK VALUES (1127, 417, 717, 817, \'GOOD\', \'No complaints.
The flight was as expected.\', SYSDATE)**

**INTO FEEDBACK VALUES (1128, 418, 718, 818, \'BAD\', \'Last-minute
cancellation was disappointing.\', SYSDATE)**

**INTO FEEDBACK VALUES (1129, 419, 719, 819, \'GOOD\', \'Pleasant
journey overall.\', SYSDATE)**

**INTO FEEDBACK VALUES (1130, 420, 720, 820, \'GOOD\', \'Satisfied with
the service provided.\', SYSDATE)**

**SELECT \* FROM DUAL;**

**COMMIT;**
