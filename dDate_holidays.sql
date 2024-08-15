-- Fiksni praznici i blagdani

UPDATE dDate
SET IsHoliday = 1, holidayName = 'New Year'
WHERE Month = 1 AND Day = 1;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Epiphany'
WHERE Month = 1 AND Day = 6;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'International Workers Day'
WHERE Month = 5 AND Day = 1;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Anti-Fascist Struggle Day'
WHERE Month = 6 AND Day = 22;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Statehood Day'
WHERE Month = 6 AND Day = 25 AND Year <= 2019;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Statehood Day'
WHERE Month = 5 AND Day = 30 AND Year > 2019;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Victory & Homeland Thanksgiving & Day of Croatian defenders'
WHERE Month = 8 AND Day = 5;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Assumption of Mary to Heaven'
WHERE Month = 8 AND Day = 15;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Independence Day'
WHERE Month = 10 AND Day = 8;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'All Saints Day'
WHERE Month = 11 AND Day = 1;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Remembrance Day'
WHERE Month = 11 AND Day = 18 AND Year >= 2020;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Christmas'
WHERE Month = 12 AND Day = 25;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'St. Stephens Day'
WHERE Month = 12 AND Day = 26;


-- Uskrs, Uskrsni ponedjeljak i Tijelovo
UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 23 AND Year = 2000;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 24 AND Year = 2000;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 22 AND Year = 2000;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 15 AND Year = 2001;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 16 AND Year = 2001;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 14 AND Year = 2001;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 3 AND Day = 31 AND Year = 2002;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 1 AND Year = 2002;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 5 AND Day = 30 AND Year = 2002;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 20 AND Year = 2003;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 21 AND Year = 2003;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 19 AND Year = 2003;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 11 AND Year = 2004;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 12 AND Year = 2004;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 10 AND Year = 2004;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 3 AND Day = 27 AND Year = 2005;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 3 AND Day = 28 AND Year = 2005;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 5 AND Day = 26 AND Year = 2005;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 16 AND Year = 2006;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 17 AND Year = 2006;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 16 AND Day = 15 AND Year = 2006;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 8 AND Year = 2007;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 9 AND Year = 2007;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 7 AND Year = 2007;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 3 AND Day = 23 AND Year = 2008;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 3 AND Day = 24 AND Year = 2008;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 5 AND Day = 22 AND Year = 2008;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 12 AND Year = 2009;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 13 AND Year = 2009;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 11 AND Year = 2009;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 4 AND Year = 2010;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 5 AND Year = 2010;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 3 AND Year = 2010;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 24 AND Year = 2011;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 25 AND Year = 2011;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 23 AND Year = 2011;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 8 AND Year = 2012;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 9 AND Year = 2012;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 7 AND Year = 2012;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 3 AND Day = 31 AND Year = 2013;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 1 AND Year = 2013;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 5 AND Day = 30 AND Year = 2013;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 20 AND Year = 2014;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 21 AND Year = 2014;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 19 AND Year = 2014;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 5 AND Year = 2015;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 6 AND Year = 2015;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 4 AND Year = 2015;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 3 AND Day = 27 AND Year = 2016;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 3 AND Day = 28 AND Year = 2016;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 5 AND Day = 26 AND Year = 2016;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 16 AND Year = 2017;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 17 AND Year = 2017;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 15 AND Year = 2017;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 1 AND Year = 2018;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 2 AND Year = 2018;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 5 AND Day = 31 AND Year = 2018;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 21 AND Year = 2019;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 22 AND Year = 2019;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 20 AND Year = 2019;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 12 AND Year = 2020;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 13 AND Year = 2020;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 11 AND Year = 2020;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 4 AND Year = 2021;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 5 AND Year = 2021;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 3 AND Year = 2021;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 17 AND Year = 2022;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 18 AND Year = 2022;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 16 AND Year = 2022;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 4 AND Day = 9 AND Year = 2023;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 10 AND Year = 2023;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 6 AND Day = 8 AND Year = 2023;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter'	
WHERE Month = 3 AND Day = 31 AND Year = 2024;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Easter Monday'
WHERE Month = 4 AND Day = 1 AND Year = 2024;

UPDATE dDate
SET IsHoliday = 1, holidayName = 'Corpus Christi'
WHERE Month = 5 AND Day = 30 AND Year = 2024;

INSERT INTO dDate(
	DateID,
	[date],
	[type],
	[formattedDate],
	[day],
	[month],
	[year],
	[quartal],
	[dayOfWeek],
	[dayOfWeekName],
	[monthName],
	[isWorkday],
	[isLastDayOfTheMonth],
	[season],
	[isHoliday],
	[holidayName],
	[event]
)
VALUES (
    0,
	null,
	'unknown',
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null
);

INSERT INTO dDate(
	DateID,
	[date],
	[type],
	[formattedDate],
	[day],
	[month],
	[year],
	[quartal],
	[dayOfWeek],
	[dayOfWeekName],
	[monthName],
	[isWorkday],
	[isLastDayOfTheMonth],
	[season],
	[isHoliday],
	[holidayName],
	[event]
)
VALUES (
    1,
	null,
	'not applicable',
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null
);