pragma solidity ^0.4.11;

contract PassData{


    string s;

    function PassData(){
        s="come";
    }

    function getData() constant returns(string){
        return s;
    }

    function setData(string _string) {
        s = _string;
    }

}
