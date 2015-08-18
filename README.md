# Airlines-Survey-ASP.NET

-This single page survey project collects the info from the user and inputs it into the database. The program will try to select
a table called survey with the following rows:
FlightNumber VARCHAR(10)
FlightDate VARCHAR(10)
FriendStaff VARCHAR(10)
SpaceLuggage VARCHAR(10)
Comfort VARCHAR(10)
Cleanliness VARCHAR(10)
Noise VARCHAR(10) 

If it doesn't find the database an exception is thrown and it creates a table for you. Keep mind that in the real world a table should not be created in case of an exception and just an error message should be displayed.

