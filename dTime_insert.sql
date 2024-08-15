DECLARE @Hour INT = 0;
DECLARE @Minute INT = 0;
DECLARE @Second INT = 0;

WHILE @Hour < 24
BEGIN
    INSERT INTO dTime (
        TimeOfDayID,
		type,
		secondsMidnight,
		minutesMidnight,
		formattedTime,
		second,
		minute,
		hour,
		period
    )
    VALUES (
		@Hour * 10000 + @Minute * 100 + @Second,
		'normal',
		@Hour * 3600 + @Minute * 60 + @Second,
		@Hour * 60 + @Minute,
		CONCAT(FORMAT(@Hour, '00'), ':', FORMAT(@Minute, '00'), ':', FORMAT(@Second, '00')),
		@Second,
		@Minute,
		@Hour,
		CASE 
			WHEN @Hour >= 6 AND @Hour < 12 THEN 'Morning'
			WHEN @Hour >= 12 AND @Hour < 18 THEN 'Afternoon'
			WHEN @Hour >= 18 AND @Hour < 22 THEN 'Evening'
			ELSE 'Night'
		END
    );
    SET @Second = @Second + 1;
	
	IF @Second = 60
	BEGIN
		SET @Minute = @Minute + 1;
		SET @Second = 0;
	END;

	IF @Minute = 60
	BEGIN
		SET @Hour = @Hour + 1;
		SET @Minute = 0;
	END;
END;

INSERT INTO dTime (
    TimeOfDayID,
	type,
	secondsMidnight,
	minutesMidnight,
	formattedTime,
	second,
	minute,
	hour,
	period
)
VALUES (
    240000,
	'unknown',
	null,
	null,
	null,
	null,
	null,
	null,
	null
);

INSERT INTO dTime (
    TimeOfDayID,
	type,
	secondsMidnight,
	minutesMidnight,
	formattedTime,
	second,
	minute,
	hour,
	period
)
VALUES (
    240001,
	'has not happened yet',
	null,
	null,
	null,
	null,
	null,
	null,
	null
);
