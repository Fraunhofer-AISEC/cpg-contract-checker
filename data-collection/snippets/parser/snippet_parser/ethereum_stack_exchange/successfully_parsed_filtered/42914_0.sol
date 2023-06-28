pragma solidity ^0.4.17;


contract Pay {
    event Payment(
        address _from,
        address _to,
        uint amount
    );

    
    
    function pay(address _to) public payable {
        require(msg.value > 0);
        _to.transfer(msg.value);
        Payment(msg.sender, _to, msg.value);
    }
}
