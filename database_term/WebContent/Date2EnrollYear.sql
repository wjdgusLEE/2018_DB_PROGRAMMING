CREATE OR REPLACE FUNCTION Date2EnrollYear(dDate IN DATE)
	RETURN NUMBER
	IS 
	currentYear NUMBER;
	currentMonth NUMBER;
	year NUMBER;
	BEGIN
	SELECT to_number(to_char(dDate, 'YYYY')) INTO currentYear FROM DUAL;
	SELECT to_number(to_char(dDate, 'MM')) INTO currentMonth FROM DUAL;
	if currentMonth = 11 or currentMonth = 12 then
	   year := currentYear + 1;
	else
	   year := currentYear;
	end if;
	return year;
END;
/