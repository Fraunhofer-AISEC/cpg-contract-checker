pragma solidity >0.5.0 <0.9.0;


contract MyContract {
    
     function challenge(bytes32 hash) external view {
         require(hash == sha256(abi.encodePacked(msg.sender, "emperor")));   
     }
     
     function challenger() public view {
         this.challenge(sha256(abi.encodePacked(address(this), "emperor")));
     }
}
