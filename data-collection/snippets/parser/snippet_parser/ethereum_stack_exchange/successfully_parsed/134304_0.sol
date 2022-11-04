
pragma solidity >=0.5.0 < 0.9.0;

contract project{
    address public manager;
    address[] public perticipants;
    constructor(){
        manager = msg.sender;
    }
    receive() external payable{
        perticipants.push(msg.sender);
        
    }
    function balance() public view returns(uint){
        return address(this).balance;
    }
}
