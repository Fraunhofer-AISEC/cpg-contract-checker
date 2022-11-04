pragma solidity ^0.4.2;

contract Sample {
    uint public data;

    function setData(uint data_){
        data = data_;
    }

    function mySuicide(address newContract) {
        newContract.call(bytes4(sha3("setData(uint256)")), _n);
        suicide(newContract);
    }
}


contract NewContract {
    uint public data;

    function setData(uint data_){
        data = data_;
    }
}
