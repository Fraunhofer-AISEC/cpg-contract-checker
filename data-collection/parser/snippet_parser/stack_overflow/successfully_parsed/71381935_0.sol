mapping(string => mapping(uint => Sell)) public sells;

mapping(string => uint) public sold;


function sell (string memory _good, string memory _date) public {
    uint sellsCount = sold[_date] ++;
    sells[_date][sellsCount] = Sell(_date, msg.sender, _good, false);
}
