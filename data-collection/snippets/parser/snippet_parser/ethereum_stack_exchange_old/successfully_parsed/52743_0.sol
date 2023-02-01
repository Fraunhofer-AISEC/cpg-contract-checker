address public mainContract;

constructor(address _mainContract) public {
    mainContract = _mainContract;
}

function withdraw(address _to, uint256 _value) external {
     require(msg.sender == mainContract);
     _to.transfer(_value);
 }
