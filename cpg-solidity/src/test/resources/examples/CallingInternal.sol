pragma solidity ^0.5.0;

contract CallingInternal {


    mapping(address => uint) public balances;

    bool lock = false;

    function transfer(address to, uint amount) external {
        require(!lock);
        lock = true;
        if (balances[msg.sender] >= amount) {
            balances[to] += returnIdem(amount);
            balances[msg.sender] -= amount;
        }
        lock = false;
    }

    function returnIdem(uint id) internal returns(uint) {
        return id;
    }

    function withdraw() external {
        require(!lock);
        lock = true;
        uint256 amount = balances[msg.sender];
        require(msg.sender.call.value(amount)());
        balances[msg.sender] = 0;
        lock = false;
    }

}