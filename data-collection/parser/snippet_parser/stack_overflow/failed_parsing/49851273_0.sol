pragma solidity ^0.4.16;

Contract Factory {
    uint contractCount = 0;
    mapping(uint => MyContract) public myContracts;

    function createContract(uint money) external payable {
        require(msg.value >= money);
        contractCount++;
        
        myContracts[contractCount] = new MyContract(money);
    }
}

Contract MyContract {
    uint money;

    function MyContract(uint _money) {
        require(msg.value >= _money);
        money = _money;
    }
}
