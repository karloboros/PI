DECLARE @StartDate DATE = '2000-01-01';
DECLARE @EndDate DATE = '2024-12-31';
DECLARE @CurrentDate DATE = @StartDate

WHILE @CurrentDate <= @EndDate
BEGIN
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
        YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
        @CurrentDate,
		'date',
		CONCAT(CONVERT(VARCHAR(2), DAY(@CurrentDate)), '.', CONVERT(VARCHAR(2), MONTH(@CurrentDate)), '.', CONVERT(VARCHAR(4), YEAR(@CurrentDate))),
        DAY(@CurrentDate),
        MONTH(@CurrentDate),
        YEAR(@CurrentDate),
		(MONTH(@CurrentDate)-1)/3+1,
        DATEPART(WEEKDAY, @CurrentDate),
		DATENAME(WEEKDAY, @CurrentDate),
		DATENAME(MONTH, @CurrentDate),
		CASE
			WHEN DATEPART(WEEKDAY, @CurrentDate) BETWEEN 2 AND 6 THEN 1
			ELSE 0
		END,
		CASE 
			WHEN MONTH(@CurrentDate) <> MONTH(DATEADD(DAY, 1, @CurrentDate)) THEN 1
			ELSE 0
		END,
		CASE 
			WHEN @CurrentDate >= CAST(CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + '-03-21' AS DATE) AND @CurrentDate < CAST(CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + '-06-21' AS DATE) THEN 'Spring'
			WHEN @CurrentDate >= CAST(CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + '-06-21' AS DATE) AND @CurrentDate < CAST(CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + '-09-23' AS DATE) THEN 'Summer'
			WHEN @CurrentDate >= CAST(CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + '-09-23' AS DATE) AND @CurrentDate < CAST(CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + '-12-21' AS DATE) THEN 'Autumn'
		    ELSE 'Winter'
	    END,
		0,
		NULL,
		NULL
    );

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END;
