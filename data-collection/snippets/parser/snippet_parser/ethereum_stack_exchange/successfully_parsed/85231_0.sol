
pragma solidity >=0.5.0 <0.8.0;

contract myContract {
    
    mapping (address => mapping (uint => uint)) public payments;
    mapping (address => uint) public lastPayment;

    function sendMoney() public payable {
        require(msg.value > 0);
        payments[msg.sender][lastPayment[msg.sender]] = msg.value;
        lastPayment[msg.sender]++;
    }

}
