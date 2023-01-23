pragma solidity ^0.4.4;
import "./ConvertLib.sol";
import "./Agreement.sol";

contract SmartAgreement {

    address owner;
    mapping (address => uint) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);  
    mapping(address => address) agreementsWith;
    mapping(address => uint) priceUpto1Ks;
    mapping(address => uint) priceUpto10Ks;
    mapping(address => uint) priceUpto100Ks;

    function SmartAgreement(){
        balances[tx.origin] = 10000000;
        owner = msg.sender;
    }

   function addAgrement(address from,address to,uint priceUpto1K ,uint priceUpto10K ,uint priceUpto100K) {
        agreementsWith[from] = to;
        priceUpto1Ks[from] = priceUpto1K;
        priceUpto10Ks[from] = priceUpto10K;
        priceUpto100Ks[from] = priceUpto100K;
    }

     function getAgreement(address from) constant returns(address,uint,uint,uint){

       return (agreementsWith[from],
               priceUpto1Ks[from],
               priceUpto10Ks[from],
               priceUpto100Ks[from]);       

    }

   function sendCoin(address receiver, uint amount) returns(bool sufficient) {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Transfer(msg.sender, receiver, amount);
        return true;
    }

    function getBalanceInEth(address addr) returns(uint){
        return ConvertLib.convert(getBalance(addr),2);
    }

    function getBalance(address addr) returns(uint) {
        return balances[addr];
    }

    
    function kill() { if (msg.sender == owner) selfdestruct(owner); }
}
