function UTC_Epoch = DateConverter(input)

timeCell = cell(length(input.Date),1);
for i=1:length(input.Date)
    a = input.Date{i};
    
    [monthS,monthE] = regexp(a,'(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)');
    [dayS,dayE] = regexp(a,'\W\d{1,2}\W');
    [yearS,yearE] = regexp(a,'\W\d{4}');
    
    month = '00';
    switch a(monthS:monthE)
        case 'Jan'
            month = '01';
        case 'Feb'
            month = '02';
        case 'Mar'
            month = '03';
        case 'Apr'
            month = '04';
        case 'May'
            month = '05';
        case 'Jun'
            month = '06';
        case 'Jul'
            month = '07';
        case 'Aug'
            month = '08';
        case 'Sep'
            month = '09';
        case 'Oct'
            month = '10';
        case 'Nov'
            month = '11';
        case 'Dec'
            month = '12';
    end
    
    day = strtrim(a(dayS:dayE));
    
    year = a(yearS:yearE);
    
    timeDay = datestr(input.StartET(i),'HH:MM PM');
    
    timeStr = [month,day,year," ",timeDay];
    
    timeCell{i}=timeStr;
end

timeCell =  cell2table(timeCell);
UTC_Epoch = [input,timeCell];


% unix_time = round(8.64e7 * (datenum('04/11/2014 10:30 AM','mm/dd/yyyy HH:MM PM')- datenum('1970', 'yyyy')))