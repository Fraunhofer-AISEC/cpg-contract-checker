contract Eagle {

    address wife = address(0);
    address husband = address(1);
    address payable owner; 

    constructor() public{
        owner = payable(msg.sender);
    }

    function withdraw() public {
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;
        owner.transfer(amount);
    }

    receive () payable {
        balances[wife] += msg.value / 2;
        balances[husband] += msg.value / 2; 
    }

    function getBalance() public view returns(uint _wife) {
        return balances[wife];
    }

}
