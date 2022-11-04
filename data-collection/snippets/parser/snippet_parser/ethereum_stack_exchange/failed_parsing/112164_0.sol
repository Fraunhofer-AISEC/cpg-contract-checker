    address[] private holders;
    function transferToHolders(uint256 valueToDistribute) payable public {
    uint256 numHolders = holders.length;
    if (numHolders <= 0) {
        return;
    }

    uint256 portion = valueToDistribute / numHolders;
    for (uint256 i = 0; i < holders.length; i++) {
        require(portion > 0);
        transferFrom(msg.sender, holders[i], portion);
    }
}

function incrementHolders (address payable holder) public {
    holders.push (holder);
}
function forwardFunds(uint256 value) public payable {
    require(msg.sender == _wallet, "no way!");
    _wallet.transfer(value);
}
   function sellTokens() public payable {
    require(publicBuyActivated == true, "public Sell not lunched yet");
    require(_token.balanceOf(msg.sender) >= msg.value, "you dont have enought tokens");

    address payable beneficiary = msg.sender;
    uint256 holdersAmount,

    uint256 userAmount) = getSellPercents(msg.value);

    if (userAmount < msg.value) {

        _token.transferToHolders(holdersAmount);
        
    }
    beneficiary.transfer(userAmount);
}
