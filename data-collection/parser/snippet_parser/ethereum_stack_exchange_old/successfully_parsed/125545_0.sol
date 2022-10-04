struct MinutesRangeTax {
    uint256 from;
    uint256 to;
    uint256 tax;
}

mapping(address => uint256) public initialBuyTimestamp;
mapping(uint8 => MinutesRangeTax) public minutesRangeTaxes;
uint8 public maxIndexMinutesRange;





    minutesRangeTaxes[1].from = 0 minutes;
    minutesRangeTaxes[1].to = 7200 minutes;
    minutesRangeTaxes[1].tax = 20;
    minutesRangeTaxes[2].from = 7200 minutes;
    minutesRangeTaxes[2].to = 14400 minutes;
    minutesRangeTaxes[2].tax = 15;
    minutesRangeTaxes[3].from = 14400 minutes;
    minutesRangeTaxes[3].to = 21600 minutes;
    minutesRangeTaxes[3].tax = 10;
    minutesRangeTaxes[4].from = 21600 minutes;
    minutesRangeTaxes[4].to = 28800 minutes;
    minutesRangeTaxes[4].tax = 5;

    maxIndexMinutesRange = 4;
