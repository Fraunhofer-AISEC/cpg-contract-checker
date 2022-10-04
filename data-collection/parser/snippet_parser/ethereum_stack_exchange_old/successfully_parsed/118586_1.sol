
pragma solidity 0.8.4;

import "./Validate.sol";

contract Verify {

    Validate public validate;

    function verify(address _owner, uint256 _requestId) public view{
        bytes memory _validityData = abi.encodeWithSignature("isRequestValid(uint256)",_requestId);
        validate.validate(_owner, _validityData);
    }

}
