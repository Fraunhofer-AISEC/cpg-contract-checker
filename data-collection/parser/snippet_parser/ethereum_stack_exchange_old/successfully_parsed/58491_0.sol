function createProxyImpl(address _target, bytes _data)
    internal
    returns (address proxyContract)
{
    assembly {
        let contractCode := mload(0x40) 

        mstore(add(contractCode, 0x0b), _target) 
        mstore(sub(contractCode, 0x09), 0x000000000000000000603160008181600b9039f3600080808080368092803773) 
        mstore(add(contractCode, 0x2b), 0x5af43d828181803e808314602f57f35bfd000000000000000000000000000000) 

        proxyContract := create(0, contractCode, 60) 
        if iszero(extcodesize(proxyContract)) {
            revert(0, 0)
        }

        
        let dataLength := mload(_data) 
        if iszero(iszero(dataLength)) {
            if iszero(call(gas, proxyContract, 0, add(_data, 0x20), dataLength, 0, 0)) {
                revert(0, 0)
            }
        }
    }
}
