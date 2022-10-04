pragma solidity 0.4.25; 

contract Callee0 {function func() external pure returns (bool) {return false;}}
contract Callee1 {function func() external pure returns (bool) {return true;}}
contract Callee2 {function func() external pure {}}

contract Caller {
    bytes4 private constant FUNC_SELECTOR = bytes4(uint256(keccak256("func()") >> (256 - 4 * 8)));

    function funcReturns(address _callee) external view returns (bool) {
        uint256[1] memory output = [uint256(2)];
        bytes      memory input  = abi.encodeWithSelector(FUNC_SELECTOR);

        assembly {
            let success := staticcall(
                gas,            
                _callee,        
                add(input, 32), 
                mload(input),   
                output,         
                32              
            )
            if iszero(success) {
                revert(0, 0)
            }
        }

        return output[0] < 2;
    }
}
