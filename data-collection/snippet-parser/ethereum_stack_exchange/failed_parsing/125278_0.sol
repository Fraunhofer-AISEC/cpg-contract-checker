address public owner = msg.sender;
modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}

function mint(address _to, uint256 _amount)public onlyOwner returns (bool) {
    _mint(_to, _amount);
    return true;
