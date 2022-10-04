
pragma solidity ^0.5.0;

contract Proxy {
    
    
    
    bytes32 private constant logicPosition = keccak256("ucot.logic.address");

    constructor (address logicAddress) public {
        updateLogic(logicAddress); 
    }

    
    function updateLogic(address newLogicAddress) public {
        _setLogic(newLogicAddress);
        
        
        
    }

    
    function _setLogic(address _logicAddress) internal {
        bytes32 position = logicPosition;
        assembly {
            sstore(position, _logicAddress)
        }
    }
    
    function _getLogic() public view returns (address logic) {
        bytes32 position = logicPosition;
        assembly {
            logic := sload(position)
        }
    }

    
    function magicFunction() public {
        address logicAddress = _getLogic();
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0x0, calldatasize) 
            let ok := delegatecall(gas, logicAddress, ptr, calldatasize, 0x0, 0)
        }

    }
}


pragma solidity ^0.5.0;

contract Logic_0_1_0 {

    uint a;

    
    event result(uint val);
    function magicFunction() public returns (uint) {
        a = 7;
        emit result(a); 
    }
}


pragma solidity ^0.5.0;

import "./logic.sol";

contract Logic_0_2_0 is Logic_0_1_0 {

    
    
    function magicFunction() public returns (uint) {
        a = 9;
        emit result(a); 
    }
}
