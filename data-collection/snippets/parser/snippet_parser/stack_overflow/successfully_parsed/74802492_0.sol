function getUintAnswer(address _contractAddress, bytes memory data) public view returns (bytes memory result) {
    assembly {

        
        let success := staticcall(64000, _contractAddress, data, 4, result, 160)

        
        if iszero(success) { 
            revert(0, 0) 
            }
    }
}
