pragma solidity ^0.4.18;
contract LocalEthereum {
    address public owner;
    function LocalEthereum() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    function setOwner(address _newOwner) onlyOwner external {
        owner = _newOwner;
    }
}
