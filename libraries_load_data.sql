/*This script creates three tables (pls_fy2018_libraries, pls_fy2017_libraries, pls_fy2016_libraries) for 
public library survey data for the fiscal years 2018, 2017, and 2016. Each table includes columns for library 
information such as name, address, phone number, and various statistics. 
It then loads data from corresponding CSV files into these tables, ignoring the first row (headers). 
Finally, it creates indexes on the libname column for each table to improve query performance on library names.*/


CREATE TABLE pls_fy2018_libraries ( /* Public Library Survey, fiscal year, 2018*/
    stabr VARCHAR(255) NOT NULL,
    fscskey VARCHAR(255) NOT NULL PRIMARY KEY,
    libid VARCHAR(255) NOT NULL,
    libname VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    zip VARCHAR(255) NOT NULL,
    county VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    c_relatn VARCHAR(255) NOT NULL,
    c_legbas VARCHAR(255) NOT NULL,
    c_admin VARCHAR(255) NOT NULL,
    c_fscs VARCHAR(255) NOT NULL,
    geocode VARCHAR(255) NOT NULL,
    lsabound VARCHAR(255) NOT NULL,
    startdate VARCHAR(255) NOT NULL,
    enddate VARCHAR(255) NOT NULL,
    popu_lsa INT NOT NULL,
    popu_und INT NOT NULL,
    centlib INT NOT NULL,
    branlib INT NOT NULL,
    bkmob INT NOT NULL,
    totstaff DECIMAL(8,2) NOT NULL,
    bkvol INT NOT NULL,
    ebook INT NOT NULL,
    audio_ph INT NOT NULL,
    audio_dl INT NOT NULL,
    video_ph INT NOT NULL,
    video_dl INT NOT NULL,
    ec_lo_ot INT NOT NULL,
    subscrip INT NOT NULL,
    hrs_open INT NOT NULL,
    visits INT NOT NULL,
    reference INT NOT NULL,
    regbor INT NOT NULL,
    totcir INT NOT NULL,
    kidcircl INT NOT NULL,
    totpro INT NOT NULL,
    gpterms INT NOT NULL,
    pitusr INT NOT NULL,
    wifisess INT NOT NULL,
    obereg VARCHAR(255) NOT NULL,
    statstru VARCHAR(255) NOT NULL,
    statname VARCHAR(255) NOT NULL,
    stataddr VARCHAR(255) NOT NULL,
    longitude DECIMAL(10,7) NOT NULL,
    latitude DECIMAL(10,7) NOT NULL
);

CREATE TABLE pls_fy2017_libraries ( /* Public Library Survey, fiscal year, 2018*/
    stabr VARCHAR(255) NOT NULL,
    fscskey VARCHAR(255) NOT NULL PRIMARY KEY,
    libid VARCHAR(255) NOT NULL,
    libname VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    zip VARCHAR(255) NOT NULL,
    county VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    c_relatn VARCHAR(255) NOT NULL,
    c_legbas VARCHAR(255) NOT NULL,
    c_admin VARCHAR(255) NOT NULL,
    c_fscs VARCHAR(255) NOT NULL,
    geocode VARCHAR(255) NOT NULL,
    lsabound VARCHAR(255) NOT NULL,
    startdate VARCHAR(255) NOT NULL,
    enddate VARCHAR(255) NOT NULL,
    popu_lsa INT NOT NULL,
    popu_und INT NOT NULL,
    centlib INT NOT NULL,
    branlib INT NOT NULL,
    bkmob INT NOT NULL,
    totstaff DECIMAL(8,2) NOT NULL,
    bkvol INT NOT NULL,
    ebook INT NOT NULL,
    audio_ph INT NOT NULL,
    audio_dl INT NOT NULL,
    video_ph INT NOT NULL,
    video_dl INT NOT NULL,
    ec_lo_ot INT NOT NULL,
    subscrip INT NOT NULL,
    hrs_open INT NOT NULL,
    visits INT NOT NULL,
    reference INT NOT NULL,
    regbor INT NOT NULL,
    totcir INT NOT NULL,
    kidcircl INT NOT NULL,
    totpro INT NOT NULL,
    gpterms INT NOT NULL,
    pitusr INT NOT NULL,
    wifisess INT NOT NULL,
    obereg VARCHAR(255) NOT NULL,
    statstru VARCHAR(255) NOT NULL,
    statname VARCHAR(255) NOT NULL,
    stataddr VARCHAR(255) NOT NULL,
    longitude DECIMAL(10,7) NOT NULL,
    latitude DECIMAL(10,7) NOT NULL
);

CREATE TABLE pls_fy2016_libraries ( /* Public Library Survey, fiscal year, 2018*/
    stabr VARCHAR(255) NOT NULL,
    fscskey VARCHAR(255) NOT NULL PRIMARY KEY,
    libid VARCHAR(255) NOT NULL,
    libname VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    zip VARCHAR(255) NOT NULL,
    county VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    c_relatn VARCHAR(255) NOT NULL,
    c_legbas VARCHAR(255) NOT NULL,
    c_admin VARCHAR(255) NOT NULL,
    c_fscs VARCHAR(255) NOT NULL,
    geocode VARCHAR(255) NOT NULL,
    lsabound VARCHAR(255) NOT NULL,
    startdate VARCHAR(255) NOT NULL,
    enddate VARCHAR(255) NOT NULL,
    popu_lsa INT NOT NULL,
    popu_und INT NOT NULL,
    centlib INT NOT NULL,
    branlib INT NOT NULL,
    bkmob INT NOT NULL,
    totstaff DECIMAL(8,2) NOT NULL,
    bkvol INT NOT NULL,
    ebook INT NOT NULL,
    audio_ph INT NOT NULL,
    audio_dl INT NOT NULL,
    video_ph INT NOT NULL,
    video_dl INT NOT NULL,
    ec_lo_ot INT NOT NULL,
    subscrip INT NOT NULL,
    hrs_open INT NOT NULL,
    visits INT NOT NULL,
    reference INT NOT NULL,
    regbor INT NOT NULL,
    totcir INT NOT NULL,
    kidcircl INT NOT NULL,
    totpro INT NOT NULL,
    gpterms INT NOT NULL,
    pitusr INT NOT NULL,
    wifisess INT NOT NULL,
    obereg VARCHAR(255) NOT NULL,
    statstru VARCHAR(255) NOT NULL,
    statname VARCHAR(255) NOT NULL,
    stataddr VARCHAR(255) NOT NULL,
    longitude DECIMAL(10,7) NOT NULL,
    latitude DECIMAL(10,7) NOT NULL
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pls_fy2018_libraries.csv'
INTO TABLE pls_fy2018_libraries
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pls_fy2017_libraries.csv'
INTO TABLE pls_fy2017_libraries
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pls_fy2016_libraries.csv'
INTO TABLE pls_fy2016_libraries
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE INDEX libname_2018_idx ON pls_fy2018_libraries (libname);
CREATE INDEX libname_2017_idx ON pls_fy2017_libraries (libname);
CREATE INDEX libname_2016_idx ON pls_fy2016_libraries (libname);