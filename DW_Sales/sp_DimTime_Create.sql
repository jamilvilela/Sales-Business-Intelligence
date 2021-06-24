CREATE PROCEDURE [sales].[sp_DimTime_Create]
	@StartDate datetime,
	@EndDate datetime 
AS

DECLARE @CountTable int = 0 
DECLARE @MinDateOrigem datetime
DECLARE @MaxDateOrigem datetime

SELECT @CountTable = count(sk_date) FROM sales.dim_time
set @MinDateOrigem = (select Min(SaleDate) FROM DB_Stage.sales.RAW_Sales)
set @MaxDateOrigem = (select Max(SaleDate) FROM DB_Stage.sales.RAW_Sales)

set @StartDate = isnull(@StartDate, @MinDateOrigem)
set @EndDate   = isnull(@EndDate, @MaxDateOrigem)

if @MinDateOrigem < @StartDate begin
   set @StartDate = @MinDateOrigem
end

if @MaxDateOrigem > @EndDate begin
   set @EndDate = @MaxDateOrigem
end

set @StartDate = CAST(CAST(YEAR(@StartDate) AS VARCHAR(4)) + '-01-01' AS datetime)
set @EndDate   = CAST(CAST(YEAR(@EndDate) AS VARCHAR(4)) + '-12-31' AS datetime)

--print 'start date:'
--print @StartDate
--print 'end date:'
--print @EndDate
--print 'inserting...'

    WHILE @StartDate <= @EndDate  
    BEGIN
      begin try
       INSERT INTO [sales].[dim_time] (
          [sk_date],
          [Day],
          [DaySuffix],
          [Weekday],
          [WeekDayName],
          [WeekDayName_Short],
          [WeekDayName_FirstLetter],
          [DOWInMonth],
          [DayOfYear],
          [WeekOfMonth],
          [WeekOfYear],
          [Month],
          [MonthName],
          [MonthName_Short],
          [MonthName_FirstLetter],
          [Quarter],
          [QuarterName],
          [Year],
          [MMYYYY],
          [MonthYear],
          [IsWeekend],
          [IsHoliday],
          [FirstDateofYear],
          [LastDateofYear],
          [FirstDateofQuater],
          [LastDateofQuater],
          [FirstDateofMonth],
          [LastDateofMonth],
          [FirstDateofWeek],
          [LastDateofWeek]
          )
       SELECT --DateKey = YEAR(@StartDate) * 10000 + MONTH(@StartDate) * 100 + DAY(@StartDate),
          sk_Date = @StartDate,
          Day = DAY(@StartDate),
          [DaySuffix] = CASE 
             WHEN DAY(@StartDate) = 1
                OR DAY(@StartDate) = 21
                OR DAY(@StartDate) = 31
                THEN 'st'
             WHEN DAY(@StartDate) = 2
                OR DAY(@StartDate) = 22
                THEN 'nd'
             WHEN DAY(@StartDate) = 3
                OR DAY(@StartDate) = 23
                THEN 'rd'
             ELSE 'th'
             END,
          [Weekday] = DATEPART(dw, @StartDate),
          [WeekDayName] = DATENAME(dw, @StartDate),
          [WeekDayName_Short] = UPPER(LEFT(DATENAME(dw, @StartDate), 3)),
          [WeekDayName_FirstLetter] = LEFT(DATENAME(dw, @StartDate), 1),
          [DOWInMonth] = DAY(@StartDate),
          [DayOfYear] = DATENAME(dy, @StartDate),
          [WeekOfMonth] = DATEPART(WEEK, @StartDate) - DATEPART(WEEK, DATEADD(MM, DATEDIFF(MM, 0, @StartDate), 0)) + 1,
          [WeekOfYear] = DATEPART(wk, @StartDate),
          [Month] = MONTH(@StartDate),
          [MonthName] = DATENAME(mm, @StartDate),
          [MonthName_Short] = UPPER(LEFT(DATENAME(mm, @StartDate), 3)),
          [MonthName_FirstLetter] = LEFT(DATENAME(mm, @StartDate), 1),
          [Quarter] = DATEPART(q, @StartDate),
          [QuarterName] = CASE 
             WHEN DATENAME(qq, @StartDate) = 1
                THEN 'First'
             WHEN DATENAME(qq, @StartDate) = 2
                THEN 'Second'
             WHEN DATENAME(qq, @StartDate) = 3
                THEN 'Third'
             WHEN DATENAME(qq, @StartDate) = 4
                THEN 'Fourth'
             END,
          [Year] = YEAR(@StartDate),
          [MMYYYY] = RIGHT('0' + CAST(MONTH(@StartDate) AS VARCHAR(2)), 2) + CAST(YEAR(@StartDate) AS VARCHAR(4)),
          [MonthYear] = CAST(YEAR(@StartDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @StartDate), 3)),
          [IsWeekend] = CASE 
             WHEN DATENAME(dw, @StartDate) = 'Sunday'
                OR DATENAME(dw, @StartDate) = 'Saturday'
                THEN 1
             ELSE 0
             END,
          [IsHoliday] = 0,
          [FirstDateofYear] = CAST(CAST(YEAR(@StartDate) AS VARCHAR(4)) + '-01-01' AS DATE),
          [LastDateofYear] = CAST(CAST(YEAR(@StartDate) AS VARCHAR(4)) + '-12-31' AS DATE),
          [FirstDateofQuater] = DATEADD(qq, DATEDIFF(qq, 0, @StartDate), 0),
          [LastDateofQuater] = DATEADD(dd, - 1, DATEADD(qq, DATEDIFF(qq, 0, @StartDate) + 1, 0)),
          [FirstDateofMonth] = CAST(CAST(YEAR(@StartDate) AS VARCHAR(4)) + '-' + CAST(MONTH(@StartDate) AS VARCHAR(2)) + '-01' AS DATE),
          [LastDateofMonth] = EOMONTH(@StartDate),
          [FirstDateofWeek] = DATEADD(dd, - (DATEPART(dw, @StartDate) - 1), @StartDate),
          [LastDateofWeek] = DATEADD(dd, 7 - (DATEPART(dw, @StartDate)), @StartDate)
        end try
        begin catch
           print 'The record has not inserted.'
        end catch
	   --print @StartDate
       SET @StartDate = DATEADD(DD, 1, @StartDate)
    END

    --Update Holiday information
    UPDATE sales.dim_time
    SET [IsHoliday] = 1,
       [HolidayName] = 'Christmas'
    WHERE [Month] = 12 AND [DAY] = 25

    UPDATE sales.dim_time
    SET SpecialDays = 'Valentines Day'
    WHERE [Month] = 2 AND [DAY] = 14

	UPDATE sales.dim_time
    SET SpecialDays = 'Brazil''s Valentines Day'
    WHERE [Month] = 6 AND [DAY] = 12

-- Good Friday  April 18 
	UPDATE sales.dim_time
		SET [IsHoliday] = 1,
        [HolidayName] = 'Good Friday'
	WHERE [Month] = 4 AND [DAY]  = 18

-- Easter Monday  April 21 
	UPDATE sales.dim_time
		SET [IsHoliday] = 1,
        [HolidayName] = 'Easter Monday'
	WHERE [Month] = 4 AND [DAY]  = 21

-- Early May Bank Holiday   May 5 
   UPDATE sales.dim_time
		SET [IsHoliday] = 1,
        [HolidayName] = 'Early May Bank Holiday'
	WHERE [Month] = 5 AND [DAY]  = 5

-- Spring Bank Holiday  May 26 
	UPDATE sales.dim_time
		SET [IsHoliday] = 1,
        [HolidayName] = 'Spring Bank Holiday'
	WHERE [Month] = 5 AND [DAY]  = 26

-- Summer Bank Holiday  August 25 
    UPDATE sales.dim_time
		SET [IsHoliday] = 1,
        [HolidayName] = 'Summer Bank Holiday'
	WHERE [Month] = 8 AND [DAY]  = 25

-- Boxing Day  December 26  	
    UPDATE sales.dim_time
		SET SpecialDays = 'Boxing Day'
	WHERE [Month] = 12 AND [DAY]  = 26	

--New Years Day
	UPDATE sales.dim_time
		SET [IsHoliday] = 1,
        [HolidayName]  = 'New Year''s Day'
	WHERE [Month] = 1 AND [DAY] = 1

RETURN
