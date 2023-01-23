pragma solidity ^0.8.7;

contract Wallet {

    address public wallet = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint256 public  totalSupply=1000;
    address public owner;
    uint fees =2;

    mapping(address => uint) public balances;

  constructor(){
        owner = msg.sender;
    }

    function transfer(address _to, uint _amount)public {
        
    }

}
