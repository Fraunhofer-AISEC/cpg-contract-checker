pragma solidity ^0.4.2;

contract test{

    uint public age;

    function test(){
        age = 10;
    }

    function callData() returns (string){
        bool result = this.delegatecall(bytes4(sha3("age()")));
        if (result) {
            return "success";
        }
        return "failed";
    }

}
