pragma solidity ^0.4.24;

contract HashForEther {

    function withdrawWinnings() {
        
        require(uint32(msg.sender) == 0);
        _sendWinnings();
     }

     function _sendWinnings() {
         msg.sender.transfer(address(this).balance);
     }
}
