CREATE TABLE dDate (
	DateID INT PRIMARY KEY NOT NULL,
	date DATE,
	type VARCHAR(20) CHECK (type IN ('date', 'not applicable', 'unknown')),
	formattedDate VARCHAR(11),
	day INT,
	month INT,
	year INT,
	quartal INT,
	dayOfWeek INT,
	dayOfWeekName VARCHAR(10),
	monthName VARCHAR(10),
	isWorkday BIT,
	isLastDayOfTheMonth BIT,
	season VARCHAR(10),
	isHoliday BIT,
	holidayName VARCHAR(80),
	event VARCHAR(100)
);
