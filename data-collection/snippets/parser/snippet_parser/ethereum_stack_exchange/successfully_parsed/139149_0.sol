uint constant SECONDS_PER_DAY = 24 * 60 * 60;
uint constant SECONDS_PER_HOUR = 60 * 60;
uint constant SECONDS_PER_MINUTE = 60;
uint public startingDate;
uint public endingDate;
int constant OFFSET19700101 = 2440588;
uint public secondsBetween;

function _daysFromDate(uint year, uint month, uint day) internal pure returns (uint _days) {
        require(year >= 1970);
        int _year = int(year);
        int _month = int(month);
        int _day = int(day);

        int __days = _day
          - 32075
          + 1461 * (_year + 4800 + (_month - 14) / 12) / 4
          + 367 * (_month - 2 - (_month - 14) / 12 * 12) / 12
          - 3 * ((_year + 4900 + (_month - 14) / 12) / 100) / 4
          - OFFSET19700101;

        _days = uint(__days);
    }

function startDate(uint _year, uint _month, uint _day, uint _hour, uint _minute, uint _second) public {
        startingDate = _daysFromDate(_year, _month, _day) * SECONDS_PER_DAY + _hour * SECONDS_PER_HOUR + _minute * SECONDS_PER_MINUTE + _second;
    } 


function endDate(uint _year, uint _month, uint _day, uint _hour, uint _minute, uint _second) public {
        endingDate = _daysFromDate(_year, _month, _day) * SECONDS_PER_DAY + _hour * SECONDS_PER_HOUR + _minute * SECONDS_PER_MINUTE + _second;
    }  


function dateDifference() public returns(uint) {
   secondsBetween = endingDate - startingDate;
}

