pragma solidity >=0.4.22 <0.6.0;
contract multisig2of3 {
    address signer1;
    address signer2;
    address signer3;
    address payable receiver1;
    address payable receiver2;
    address payable receiver3;

    constructor(address owner1, address owner2, address owner3) public {
        assert(owner1 != owner2);
        assert(owner2 != owner3);
        assert(owner3 != owner1);
        signer1 = owner1;
        signer2 = owner2;
        signer3 = owner3;
    }

    function deposit() public payable {
        if (msg.value > 1 ether || address(this).balance > 1 ether) revert();
    }

    function setReceiver(address payable newReceiver) public {
        if (msg.sender == signer1) receiver1 = newReceiver;
        if (msg.sender == signer2) receiver2 = newReceiver;
        if (msg.sender == signer3) receiver3 = newReceiver;
    }

    function withdraw() public {
        address payable approvedReceiver;
        if (receiver1 == receiver2) approvedReceiver = receiver1;
        if (receiver2 == receiver3) approvedReceiver = receiver2;
        if (receiver3 == receiver1) approvedReceiver = receiver3;
        require(approvedReceiver != address(0));
        receiver1 = address(0);
        receiver2 = address(0);
        receiver3 = address(0);
        approvedReceiver.transfer(address(this).balance);
    }
}
