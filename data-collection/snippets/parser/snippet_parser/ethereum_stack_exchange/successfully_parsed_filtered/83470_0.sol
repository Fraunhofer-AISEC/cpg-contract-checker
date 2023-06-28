pragma solidity ^0.5.11;

contract ReceiveEther {
    uint256 public count;
    address public creator= msg.sender;
        function () external payable {
            require(count < 2);
                count++;
                   } 
        function getBalance() public view returns (uint) {
            return address(this).balance;
    }

}

contract SendEther {
    address public creator= msg.sender;
    uint256 public sendcount; 
        function sendViaCall (address payable _to) public payable {
            require(msg.sender == creator);
            (bool sent, bytes memory data) = _to.call.value(msg.value)("");
            require (sent, "failed to send ether");
            require(sendcount < 1);
                 sendcount++;
    }
}
