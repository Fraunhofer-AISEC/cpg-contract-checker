pragma solidity >=0.4.22;

contract dCoders {
    
    
    address public owner;
    uint public regFee;

    mapping (address => uint) public balance; 

    constructor() public {
        owner = msg.sender;
        regFee = 2 ether;
    }

    event reg(address indexed _from);

    
    function register() payable public {
        

        balance[msg.sender] -= regFee;
        balance[address(this)] += regFee;   

        emit reg(msg.sender);
    }

    

    
}
