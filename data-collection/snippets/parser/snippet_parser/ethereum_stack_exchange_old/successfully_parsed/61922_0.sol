    pragma solidity ^0.4.25;

    
    

    contract DateTime1 {
        
        struct _DateTime {
                uint16 year;
                uint8 month;
                uint8 day;
                uint8 hour;
                uint8 minute;
                uint8 second;
                uint8 weekday;
        }

        uint constant DAY_IN_SECONDS = 86400;
        uint constant YEAR_IN_SECONDS = 31536000;
        uint constant LEAP_YEAR_IN_SECONDS = 31622400;

        uint constant HOUR_IN_SECONDS = 3600;
        uint constant MINUTE_IN_SECONDS = 60;

        uint16 constant ORIGIN_YEAR = 1970;

        function isLeapYear(uint16 year) public view returns (bool) {
                if (year % 4 != 0) {
                        return false;
                }
                if (year % 100 != 0) {
                        return true;
                }
                if (year % 400 != 0) {
                        return false;
                }
                return true;
        }

        function leapYearsBefore(uint year) public view returns (uint) {
                year -= 1;
                return year / 4 - year / 100 + year / 400;
        }

        function getDaysInMonth(uint8 month, uint16 year) public view returns (uint8) {
                if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                        return 31;
                }
                else if (month == 4 || month == 6 || month == 9 || month == 11) {
                        return 30;
                }
                else if (isLeapYear(year)) {
                        return 29;
                }
                else {
                        return 28;
                }
        }

        function parseTimestamp(uint timestamp) internal view returns (_DateTime dt) {
                uint secondsAccountedFor = 0;
                uint buf;
                uint8 i;

                
                dt.year = getYear(timestamp);
                buf = leapYearsBefore(dt.year) - leapYearsBefore(ORIGIN_YEAR);

                secondsAccountedFor += LEAP_YEAR_IN_SECONDS * buf;
                secondsAccountedFor += YEAR_IN_SECONDS * (dt.year - ORIGIN_YEAR - buf);

                
                uint secondsInMonth;
                for (i = 1; i <= 12; i++) {
                        secondsInMonth = DAY_IN_SECONDS * getDaysInMonth(i, dt.year);
                        if (secondsInMonth + secondsAccountedFor > timestamp) {
                                dt.month = i;
                                break;
                        }
                        secondsAccountedFor += secondsInMonth;
                }

                
                for (i = 1; i <= getDaysInMonth(dt.month, dt.year); i++) {
                        if (DAY_IN_SECONDS + secondsAccountedFor > timestamp) {
                                dt.day = i;
                                break;
                        }
                        secondsAccountedFor += DAY_IN_SECONDS;
                }

                
                dt.hour = getHour(timestamp);

                
                dt.minute = getMinute(timestamp);

                
                dt.second = getSecond(timestamp);

                
                dt.weekday = getWeekday(timestamp);
        }

        function getYear(uint timestamp) public view returns (uint16) {
                uint secondsAccountedFor = 0;
                uint16 year;
                uint numLeapYears;

                
                year = uint16(ORIGIN_YEAR + timestamp / YEAR_IN_SECONDS);
                numLeapYears = leapYearsBefore(year) - leapYearsBefore(ORIGIN_YEAR);

                secondsAccountedFor += LEAP_YEAR_IN_SECONDS * numLeapYears;
                secondsAccountedFor += YEAR_IN_SECONDS * (year - ORIGIN_YEAR - numLeapYears);

                while (secondsAccountedFor > timestamp) {
                        if (isLeapYear(uint16(year - 1))) {
                                secondsAccountedFor -= LEAP_YEAR_IN_SECONDS;
                        }
                        else {
                                secondsAccountedFor -= YEAR_IN_SECONDS;
                        }
                        year -= 1;
                }
                return year;
        }

        function getMonth(uint timestamp) public view returns (uint8) {
                return parseTimestamp(timestamp).month;
        }

        function getDay(uint timestamp) public view returns (uint8) {
                return parseTimestamp(timestamp).day;
        }

        function getHour(uint timestamp) public view returns (uint8) {
                return uint8((timestamp / 60 / 60) % 24);
        }

        function getMinute(uint timestamp) public view returns (uint8) {
                return uint8((timestamp / 60) % 60);
        }

        function getSecond(uint timestamp) public view returns (uint8) {
                return uint8(timestamp % 60);
        }

        function getWeekday(uint timestamp) public view returns (uint8) {
                return uint8((timestamp / DAY_IN_SECONDS + 4) % 7);
        }

        function toTimestamp(uint16 year, uint8 month, uint8 day) public view returns (uint timestamp) {
                return toTimestamp(year, month, day, 0, 0, 0);
        }

        function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour) public view returns (uint timestamp) {
                return toTimestamp(year, month, day, hour, 0, 0);
        }

        function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour, uint8 minute) public view returns (uint timestamp) {
                return toTimestamp(year, month, day, hour, minute, 0);
        }

        function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour, uint8 minute, uint8 second) public view returns (uint timestamp) {
                uint16 i;

                
                for (i = ORIGIN_YEAR; i < year; i++) {
                        if (isLeapYear(i)) {
                                timestamp += LEAP_YEAR_IN_SECONDS;
                        }
                        else {
                                timestamp += YEAR_IN_SECONDS;
                        }
                }

                
                uint8[12] memory monthDayCounts;
                monthDayCounts[0] = 31;
                if (isLeapYear(year)) {
                        monthDayCounts[1] = 29;
                }
                else {
                        monthDayCounts[1] = 28;
                }
                monthDayCounts[2] = 31;
                monthDayCounts[3] = 30;
                monthDayCounts[4] = 31;
                monthDayCounts[5] = 30;
                monthDayCounts[6] = 31;
                monthDayCounts[7] = 31;
                monthDayCounts[8] = 30;
                monthDayCounts[9] = 31;
                monthDayCounts[10] = 30;
                monthDayCounts[11] = 31;

                for (i = 1; i < month; i++) {
                        timestamp += DAY_IN_SECONDS * monthDayCounts[i - 1];
                }

                
                timestamp += DAY_IN_SECONDS * (day - 1);

                
                timestamp += HOUR_IN_SECONDS * (hour);

                
                timestamp += MINUTE_IN_SECONDS * (minute);

                
                timestamp += second;

                return timestamp;
        }
    }


    contract Assets 
    {

    DateTime1 public dt;

    enum ASSET_TYPE
    {
        does_not_exist,
        patient,
        pump,
        drug_X,
        num_asset_types
    }

    address public databaseId;

    struct DATA_OBJECT_TYPE
    {
        string data;
        uint time;
    }

    struct ASSET_OBJECT_TYPE
    {
        ASSET_TYPE assetType;
        string name;
        uint256 checkins;
        DATA_OBJECT_TYPE[] dataObjects;
    }

    mapping(address => ASSET_OBJECT_TYPE) public assetMap;

    address[] addressArr; 

    address owner;

    
    event e_assetRegistered(bool flag);

    
    event e_retrieveAssetData( string data, uint time );

      function Assets( address dbId_ ) public
      {
        owner = msg.sender;

        databaseId = dbId_;

        
      }

   function() public payable {}

   function checkAssetExists( address add_ ) public constant returns ( bool ) 
   {

       if( assetMap[add_].assetType == ASSET_TYPE.does_not_exist )
       {
           emit e_assetRegistered( false );
           return false;
       }

       emit e_assetRegistered( true );
       return true;
   }

   function registerAsset( address add_, string name_, ASSET_TYPE asset_ ) public payable returns ( bool )
   {
       bool registeredFlag = false;

        if( !checkAssetExists( add_ ) ) 
        {
            if(( asset_ > ASSET_TYPE.does_not_exist ) &&
               ( asset_ < ASSET_TYPE.num_asset_types ))
            {
                registeredFlag = true;
                assetMap[add_].assetType = asset_;
                assetMap[add_].name = name_;
            }
        }

        emit e_assetRegistered( registeredFlag );
        return registeredFlag;

   }

   function getAssetHistoryLength(address add_) public constant returns(uint)
   {
       if( checkAssetExists( add_ ) )
       {
            return assetMap[ add_ ].dataObjects.length;   

       }
       return 0;
   }

   
   function getAssetData(address add_, uint index_) public view returns(string data, uint16 year, uint8 month, uint8 day, uint8 hour, uint8 minute, uint second )
   {
       string memory returnData = "undefined";
       uint timestamp = 0;
        uint16 yearData = 0;

        uint8[5] dataData; 


       if( checkAssetExists( add_ ) )
       {
            returnData = assetMap[ add_ ].dataObjects[index_].data;
            timestamp = assetMap[ add_ ].dataObjects[index_].time;
            
            dataData[0] = dt.getMonth(timestamp);
            dataData[1] = dt.getDay(timestamp);
            dataData[2] = dt.getHour(timestamp);
            dataData[3] = dt.getMinute(timestamp);
            dataData[4] = dt.getSecond(timestamp);


       }

       return (returnData, yearData, dataData[0], dataData[1], dataData[2], dataData[3], dataData[4] );
   }

   function informNewStatus( address add_, string data_ ) public payable returns(bool)
   {
       if( checkAssetExists( add_ ) )
       {
           DATA_OBJECT_TYPE memory dataObject = DATA_OBJECT_TYPE(data_, now);

           assetMap[add_].dataObjects.push(dataObject);

           assetMap[add_].checkins++;

           return true;
       }

        return false;

   }

   function kill() public
   {
      if(msg.sender == owner) selfdestruct(owner);
   }

}
