pragma solidity ^0.4.4;

contract Eternal {

    string engravedText;

    function Eternal(string eT) payable {
        engravedText = eT;
    }

    function getEngravedText() constant returns (string) {
        return engravedText;
    }

}
