pragma solidity ^0.5.11;

contract ReceiveEther {
    uint256 public clicksfromcreatorcount; 
    uint256 public count;
    address public creatorino = tx.origin;

        function increaseifcreatorclicks() external {
            require (msg.sender == creatorino);
                clicksfromcreatorcount++;
        }

        function () external payable {
            require (clicksfromcreatorcount>=1);
            if (clicksfromcreatorcount ==1) {
                require (tx.origin == creatorino);
            }
            require (count<2);
            count++;
        }
}

contract SendEther {
        function sendViaCall (address payable _to) public payable {
            (bool sent, bytes memory data) = _to.call.value(msg.value)("");
            require (sent, "failed to send ether");
        }
}
