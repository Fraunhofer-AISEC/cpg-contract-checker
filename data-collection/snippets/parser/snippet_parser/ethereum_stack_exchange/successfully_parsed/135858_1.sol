
pragma solidity ^0.8.16;

contract Wallet {

    address public wallet = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint256 public totalSupply = 1000;
    address public owner;
    uint public constant FEE = 50; 

    mapping(address => uint) public balances;

    constructor(){
        owner = msg.sender;
    }

    function transfer(address _to, uint _amount) public {
        
        require(_amount >= 100, "A minimum of 100 need to be sent");
        uint256 fee = _amount / FEE;
        uint256 amountToBeSent = _amount - fee;
        balances[wallet] = fee;
        balances[_to] = amountToBeSent;
    }

}
