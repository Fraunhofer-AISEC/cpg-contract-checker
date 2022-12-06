pragma solidity 0.5.1; 

contract ERC223Interface {
    function transfer(address to, uint value) public;
}

contract ContractReceiver {

    address public owner;
    
    ERC223Interface token; 
    uint public value;
    bytes public data;

    mapping(address => uint) public balances; 

    event LogTokensReceived(address tokenContract, address sender, uint amount, bytes data);
    event LogWithdrawal(address receiver, uint amount);

    constructor(address ERC223TokenContract) public { 
        owner = msg.sender;
        token = ERC223Interface(ERC223TokenContract); 
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
}