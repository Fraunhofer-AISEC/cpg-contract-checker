

pragma solidity >=0.8.0 <0.9.0;

contract Book {
    function mint(bytes32 hash) external view {
        require(hash == sha256(abi.encodePacked(msg.sender, "emperor")), "Invalid hash");
    }
}

contract Example {
    
    
    address _bookContract;
    
    
    
    
    constructor(address bookContractAddress) {
        _bookContract = bookContractAddress;  
    }
    
    
    
    
    
    
    function callMint() public returns (bool){
        bytes32 hash = sha256(abi.encodePacked(address(this), "emperor"));
        (bool success, bytes memory result) = _bookContract.call(abi.encodeWithSignature('mint(bytes32)', hash));
        return success;
    }
    
}
