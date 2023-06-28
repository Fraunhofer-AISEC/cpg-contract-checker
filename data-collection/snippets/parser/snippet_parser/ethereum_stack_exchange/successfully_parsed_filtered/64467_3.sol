pragma solidity ^0.5.2;

contract Test {

    function send() payable public {
        address payable recipient = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
        recipient.transfer(1000000000000000000); 
    }

    function contractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getContractBalance() public {
        msg.sender.transfer(address(this).balance);
    }

    function destroyContract() public {
        selfdestruct(msg.sender); 
    }
}
