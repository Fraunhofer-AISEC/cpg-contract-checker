contract Upgradeable {
    mapping(bytes4=>uint32) _sizes;
    address _dest;

    
    function initialize();

    
    function replace(address target) internal {
        _dest = target;
        target.delegatecall(bytes4(sha3("initialize()")));
    }
}


contract Dispatcher is Upgradeable {
    function Dispatcher(address target) {
        replace(target);
    }

    function initialize() {
        
        throw;
    }

    function() {
        bytes4 sig;
        assembly { sig := calldataload(0) }
        var len = _sizes[sig];
        var target = _dest;

        assembly {
            
            calldatacopy(0x0, 0x0, calldatasize)
            delegatecall(sub(gas, 10000), target, 0x0, calldatasize, 0, len)
            return(0, len)
        }
    }
}
