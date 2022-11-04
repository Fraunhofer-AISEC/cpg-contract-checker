
pragma solidity >=0.6.0 <0.8.0 ;

contract Escrow {
    address agent;

    mapping(address => uint256) public deposits;

    modifier onlyAgent() {
        require(msg.sender == agent);
        _; 
    }

    constructor() public {
        
        agent = msg.sender;
    }

    function deposit(address payee) payable public onlyAgent {
        uint256 amount = msg.value;
        deposits[payee] = deposits[payee] + amount;
    }


    function withdras(address payable payee) public onlyAgent {
        uint256 payment = deposits[payee];
        deposits[payee] = 0;

        payee.transfer(payment);
    }
}
