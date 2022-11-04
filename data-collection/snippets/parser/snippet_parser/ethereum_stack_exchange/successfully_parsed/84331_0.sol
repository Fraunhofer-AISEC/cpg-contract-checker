pragma solidity 0.4.26;

contract Tested {
    function func() public pure returns (bool) {
        return true;
    }
}

contract Tester {
    bytes4 private constant FUNC_SELECTOR = bytes4(keccak256("func()"));

    function test(uint256 _gas, address _tested) public view returns (bool) {
        bool success;
        uint256[1] memory ret;
        bytes memory data = abi.encodeWithSelector(FUNC_SELECTOR);

        assembly {
            success := staticcall(
                _gas,          
                _tested,       
                add(data, 32), 
                mload(data),   
                ret,           
                32             
            )
        }

        return success && ret[0] != 0;
    }
}
