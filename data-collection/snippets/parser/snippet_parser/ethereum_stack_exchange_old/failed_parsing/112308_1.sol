interface ERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool);
}

contract Name {
    mapping(address -> bool) supportedStableCoins;
    mapping(address -> uint) minAmauntForSuportedStableCoin;

    function addCoin(address _coinAddress, uint _minAmount) external {
        require(supportedStableCoins[_coinAddress] == true, "Already added");
        supportedStableCoins[_coinAddress] = true;
        minAmauntForSuportedStableCoin[_coinAddress] = _minAmount;
    }

    function deposit(address _coinAddress, uint _amount) external {
       require(supportedStableCoins[_coinAddress] == true)
       require(minAmauntForSuportedStableCoin[_coinAddress] <= _amount);
       require(ERC20(_coinAddress).transferFrom(msg.sender, address(this), _amount));
}
