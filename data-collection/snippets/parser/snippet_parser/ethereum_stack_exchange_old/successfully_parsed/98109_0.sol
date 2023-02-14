contract Origin{
    uint transfer_amount = 0.1 ether;
    address payable owner = xxx;
    function invest() external payable {
        owner.transfer(msg.value);
    }
    address payable[] recipients;
}
