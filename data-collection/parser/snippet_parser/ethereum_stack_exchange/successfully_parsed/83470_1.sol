pragma solidity ^0.5.11;

contract ReceiveEther {
    uint256 public clicksfromcreatorcount; 
    address public creator= msg.sender;
        function increaseifcreatorclicks() external {
            require(msg.sender == creator);
                clicksfromcreatorcount++;
        }
        function () external payable {
            require (clicksfromcreatorcount >=1);
                while (clicksfromcreatorcount==1 ) {
                    require(msg.sender == creator);
                }

        }
        function getBalance() public view returns (uint) {
            return address(this).balance;
        }
}

contract SendEtherFirst {
    address public creator= msg.sender;
        function sendViaCall (address payable _to) public payable {
            require(msg.sender == creator);
            (bool sent, bytes memory data) = _to.call.value(msg.value)("");
            require (sent, "failed to send ether");
        }
}
