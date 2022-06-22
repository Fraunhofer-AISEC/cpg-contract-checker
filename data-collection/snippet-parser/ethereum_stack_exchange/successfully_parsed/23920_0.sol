pragma solidity ^0.4.11;

contract PassData{


    PassData passData;
    string s;
    function PassData(){
        s="come";
    }

    function getData() returns(string){
        return s;
    }

    function accessData(address contractAddress) returns(string){
        passData=PassData(contractAddress);
        return passData.getData();
    }


}
