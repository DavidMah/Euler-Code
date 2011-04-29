def isLeapYear(year)
	(year % 4 == 0) and (year % 100 != 0 or year % 400 == 0)
end
$monthDays = Hash.new
$monthDays[1] = 31
$monthDays[2] = 28
$monthDays[3] = 31
$monthDays[4] = 30
$monthDays[5] = 31
$monthDays[6] = 30
$monthDays[7] = 31
$monthDays[8] = 31
$monthDays[9] = 30
$monthDays[10] = 31
$monthDays[11] = 30
$monthDays[12] = 31
sundays = 0
weekday = 1
day = 1
month = 1
year = 1900
while year < 1901
	weekday += 1
	weekday = 1 if weekday == 8
	day += 1
	if day == (month != 2 ? $monthDays[month] : ($monthDays[month] + (isLeapYear(year) ? 1 : 0)))
		day = 0
		month += 1
		if month == 13
			month = 1
			year += 1
		end
	end
end
while year < 2001
	weekday += 1
	weekday = 1 if weekday == 8
	day += 1
	if day == $monthDays[month] + 1
		day = 1
		month += 1
		puts weekday
		sundays += 1 if weekday == 7
		if month == 13
			month = 1
			year += 1
		end
	end
end
puts sundays 
