pragma solidity 0.5.2;

contract SuperClassParent {

    event LogSender(address sender, address origin, address me);

    function lookWhosTalking() public returns(address) {
        emit LogSender(msg.sender, tx.origin, address(this));
        return msg.sender;
    }

}

contract SubClassChild is SuperClassParent {

    

    

    function rightHere() public returns(address) {
        emit LogSender(msg.sender, tx.origin, address(this));
        return msg.sender;
    }

}
