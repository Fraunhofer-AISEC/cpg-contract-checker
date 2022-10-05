pragma solidity ^0.5.0;

contract Communication {

    string public user_message;

    function getMessage() public view returns (string memory) {
        return user_message;
    }

    function setMessage(string memory _message) public {
        user_message = _message;
    }
}

contract GreetingsUsingNew {

    function sayHelloUsingNew() public returns (string memory) {
        Communication newObj = new Communication();
        newObj.setMessage("Contract created using New!!!");

        return newObj.getMessage();
    }

}

contract GreetingsUsingAddress {

    function sayHelloUsingAddress(address _addr) public returns (string memory) {
        Communication addObj = Communication(_addr);
        addObj.setMessage("Contract created using an Address!!!");

        return addObj.getMessage();
    }
}
