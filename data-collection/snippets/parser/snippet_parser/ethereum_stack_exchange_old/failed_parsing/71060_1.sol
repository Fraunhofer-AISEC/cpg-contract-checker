contract C1 {
    function pay(address whoToPay) external payable {
        require(whoToPay.send(msg.value)); 

        
    }

    function getBoolValue() external pure returns (bool) {
        return true;
    }
}

contract C2 {
    function() external payable {
        if (C1(msg.sender).getBoolValue()) { ... }
    }
}
