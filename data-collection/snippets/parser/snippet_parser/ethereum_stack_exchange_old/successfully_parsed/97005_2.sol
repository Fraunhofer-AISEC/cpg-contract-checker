

pragma solidity 0.7.6;

contract Abracadabra {
    
    bytes32 public publicHash;
    
    constructor(bytes32 publicHash_) {
        publicHash = publicHash_;
    }
    
    function honeyPot(bytes32 password) public {   
        require(hashHelper(password, msg.sender) == publicHash, "That's not the magic word");
        msg.sender.transfer(address(this).balance);
    }
    
    function hashHelper(bytes32 password, address receiver) public pure returns(bytes32 hash) {
        hash = keccak256(abi.encodePacked(password, receiver));        
    }
    
    receive () external payable {}
}
