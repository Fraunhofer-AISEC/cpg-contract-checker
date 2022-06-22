pragma solidity 0.4.17;

contract HelloWorld{

    address public owner;
    address public helloAddress;

    function HelloWorld (address _helloAddress) public {
        owner = msg.sender;
        helloAddress = _helloAddress;
    }

}
