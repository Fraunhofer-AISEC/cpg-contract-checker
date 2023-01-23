contract EggithToken is MintableToken {
    string public constant name = "EggithToken";
    string public constant symbol = "MEG";
    uint8 public constant decimals = 18;
}

contract EggithCrowdsale is Crowdsale {
    function EggithCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet)
         Crowdsale(_startTime, _endTime, _rate, _wallet)
    {
    }

    
    
    function createTokenContract() internal returns (MintableToken) {
        return new EggithToken();
    }
}
