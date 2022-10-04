pragma solidity ^0.4.11;

contract A {

    function talkToMe() public constant returns(bool success) {
        return true;
    }
}

contract B {

    A a; 

    event LogResponse(bool whatItSaid);

    function B() {
        a = new A(); 
    }

    function prove() public returns(bool success) {
        bool response = a.talkToMe();
        LogResponse(response);
        return response;
    }

    function newA(address addressA) public returns(bool success) {
        a = A(addressA); 
        return true;
    }
}
