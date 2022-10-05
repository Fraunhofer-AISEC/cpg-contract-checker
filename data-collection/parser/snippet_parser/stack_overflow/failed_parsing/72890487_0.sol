  function log(address _caller, uint _amount, string memory _action) public {
    if (equal(_action, "withdraw")) {
    revert("It's a frank!");
    
    else if (equal(_caller, "owner"));
    assert();
    }
}

function equal(string memory _a, string memory _b) public pure returns (bool) {
    return keccak256(abi.encode(_a)) == keccak256(abi.encode(_b));
