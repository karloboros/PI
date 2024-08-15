CREATE TABLE dTime (
	TimeOfDayID INT PRIMARY KEY NOT NULL,
	type VARCHAR(20) CHECK (type IN ('normal', 'has not happened yet', 'unknown')),
	secondsMidnight INT,
	minutesMidnight INT,
	formattedTime VARCHAR(8),
	second INT,
	minute INT,
	hour INT,
	period VARCHAR(20)
);
