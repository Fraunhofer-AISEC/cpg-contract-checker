pragma solidity ^0.5.0;
contract test {

    string initialstring = "Hello World!";

    function getstring() public view returns(string memory){
        
        return initialstring;

    }

    function setstring(string memory newstring) public  returns(bool success) {
        initialstring = newstring;
        return true;
    }

}
