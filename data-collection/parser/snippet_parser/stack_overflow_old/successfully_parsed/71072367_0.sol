contract TestContract {
  function slice(string calldata source, uint from, uint to) public pure returns(string memory) {
    bytes calldata b = (bytes(source));
    uint len = b.length;
    require(to < len && to>=from, "indexes out of bounds"); 
    string memory retval = string(b[from:to]);
    return retval;
}    
}