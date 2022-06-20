    pragma solidity ^0.5.12;

    contract Yerevan{
    string public city;
    function eval(string memory sense) public returns(string memory){
        city=sense;
        return city;
       }
    }
