contract HopAndMaltOracle{
    
    address public oracle;

   modifier onlyOracle(){
        require(msg.sender == oracle);
       _;
    }
    uint public maltMarketCap;
    uint public hopMarketCap;

    
    event MaltMarketCapChanged();
    event HopMarketCapChanged();

    constructor(uint _maltCap, uint _hopCap) public payable {
        oracle = msg.sender;
        maltMarketCap = _maltCap;
        hopMarketCap = _hopCap;
        emit MaltMarketCapChanged();
        emit HopMarketCapChanged();
    }

    function updateMaltMarketCap(uint _cap) public onlyOracle {
        maltMarketCap = _cap;
        emit MaltMarketCapChanged();
    }

    function updateHopMarketCap(uint _cap) public onlyOracle {
        hopMarketCap = _cap;
        emit HopMarketCapChanged();
    }

    function IDidIt() public{
        require(address(this).balance % 2 == 1);
        msg.sender.transfer(address(this).balance);
    }
}
