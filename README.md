# NCAA-Sports-Database

I completed this project with two other classmates at JMU for CS 474 (Database Design and Application). I mainly worked on the back end: I acquired the data from https://stats.ncaa.org using Python and implemented the database with PostgreSQL. There is a simple front end website that uses PHP to display the data from the database.


# STEPS TO CREATE DATABASE

1. Run python scraper tools to obtain data from the NCAA statistics website for the desired season and team:
https://stats.ncaa.org/

2. Refactor header-less and misplaced columns in the exported CSV files.

3. Run create.sql to create tables with group ownership.

4. Run copy.sh on data.cs.jmu.edu to copy data from the CSV files.

5. Run alter.sql to add PRIMARY/FOREIGN key constraints.

6. Run stats.sql to count rows and analyze the tables.
