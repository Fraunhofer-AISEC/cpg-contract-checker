pragma solidity 0.4.9;

contract DA {

    address public da;

    function DA() public {
        da = msg.sender;
    }

    function setDa() public returns(bool success) {
        da = msg.sender;
        return true;
    }

    

    function getDa() public constant returns (address){
        return da;
    }

    function getMsgSender() public constant returns(address) {
        return msg.sender;
    }
}
