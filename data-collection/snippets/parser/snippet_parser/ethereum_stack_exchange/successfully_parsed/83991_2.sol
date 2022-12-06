pragma solidity 0.4.25;

contract MyContract {
    bytes4 private constant FUNC_SELECTOR = bytes4(keccak256("detectTransferRestriction(address,address,uint256)"));

    function callDetectTransferRestriction(address _token, address _to, address _from, uint256 _amount) public returns (bool) {
        bool success;
        bytes memory data = abi.encodeWithSelector(FUNC_SELECTOR, _to, _from, _amount);

        assembly {
            success := call(
                gas,            
                _token,         
                0,              
                add(data, 32),  
                mload(data),    
                0,              
                0               
            )
        }

        return success;
    }
}
