pragma solidity ^0.4.13;

contract Betaal{
    address public bedrijf = addresBedrijf;

    function UitBetalen(){
        bedrijf.transfer(this.balance);
    }

    function ()payable{
    }
}

contract Trigger{
    function TriggerBetaling() payable{
        Betaal(addressBetaal).UitBetalen;
    }   
}
