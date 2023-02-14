
pragma solidity 0.7.6;

contract Abracadabra {
    
    bytes32 public publicHash;
    
    constructor(bytes32 publicHash_) {
        publicHash = publicHash_;
    }
    
    function honeyPot(bytes32 password) public {
        
        
        

        bytes32 hash = keccak256(abi.encodePacked(password, msg.sender));
    
        
        

        require(hash == publicHash, "That's not the magic word");

        

        msg.sender.transfer(address(this).balance);
    }
    
    receive () external payable {}
}
