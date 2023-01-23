


pragma solidity 0.8.7;

contract Application{

    uint public count;
    address public owner;
    address public constant ADDR = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    constructor(){
        require(owner == msg.sender);
        owner = msg.sender;
    }

    function getCount() public view returns(uint){
        return count;
    }

    function incCount() external {
        count++;
    }

    function deccount() public {
        count--;
    }

}
