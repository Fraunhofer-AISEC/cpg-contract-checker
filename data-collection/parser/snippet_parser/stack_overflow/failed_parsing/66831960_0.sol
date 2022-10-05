contract Contract {
    uint public money = 2.5 ether
    
    constructor(...) payable {...}

    function setMoney(uint _money) public {
        money = _money;
    }
}
