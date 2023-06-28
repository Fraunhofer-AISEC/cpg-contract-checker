function seeError(address _token) public view returns (uint256) {
       (bool succes,) = _token.call(abi.encodePacked("decimals()"));
       require (success,"Error occured");
    }
