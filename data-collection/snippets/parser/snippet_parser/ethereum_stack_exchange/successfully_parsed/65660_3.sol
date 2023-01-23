pragma solidity 0.4.22;

contract dCoders {

    address public owner;
    uint public regFee;

    mapping (address => uint) public balances; 

    constructor() public {
        owner = msg.sender;
        regFee = 2 ether;
    }

    event LogRegistration(address from);

    
    function register() payable public{

        require(msg.value == regFee);
        balances[msg.sender] += msg.value; 
        emit LogRegistration(msg.sender);
    }

}
