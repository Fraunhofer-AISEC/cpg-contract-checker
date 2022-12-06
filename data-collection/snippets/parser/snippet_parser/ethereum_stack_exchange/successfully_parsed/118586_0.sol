
pragma solidity 0.8.4;



contract Validate {

    function validate(address _verifier, bytes memory _validityData) public view {
        (bool success, bytes memory result) = _verifier.staticcall(_validityData);

        require(success && abi.decode(result, (bool)), "Request/certificate invalid");
    }


}
