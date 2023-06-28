pragma solidity ^0.4.0;

contract Bubblecoin{


    mapping(address => uint) balances;
    uint  supply;

    function totalSupply() public constant returns (uint){
        return supply;

    }

    function balanceOf(address tokenOwner) public constant returns (uint balance){
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokens) public returns (bool success){

        if (balances[msg.sender] >= tokens && tokens >=0){
            balances[msg.sender]-= tokens;
            balances[to] += tokens;

            return true;

        }

        else {

            return false;
        }
     }

    function mint(uint numberOfCoin){
        balances[msg.sender] += numberOfCoin;
        supply += numberOfCoin;

    }

    function getMyBalance() returns (uint){
        return balances[msg.sender];
    }
}
