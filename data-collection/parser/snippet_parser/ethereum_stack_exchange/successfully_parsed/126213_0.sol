pragma solidity ^0.4.17;
contract Donate {

    address public donationAddress;

    address public manager;
    
    function Donate() public {
        manager = msg.sender;
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function donation() public payable{
        donationAddress.transfer(this.balance);
    }

    function setCroissantAddr(address adr) public restricted {
        donationAddress = adr;
    }

}
