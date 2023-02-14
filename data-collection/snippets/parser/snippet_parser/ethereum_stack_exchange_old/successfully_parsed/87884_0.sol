pragma solidity ^0.7.0;

contract Files {
    int128 public arToETHCoefficient = 2;
}

pragma solidity ^0.7.0;

import './Relay.sol';

contract FilesRelayer is Relay {
    constructor(address initAddr) Relay(initAddr) { }
}

pragma solidity ^0.7.0;

import './Proxy.sol';

contract Relay is Proxy {
    address public currentVersion;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(address initAddr) {
        currentVersion = initAddr;
        owner = msg.sender; 
    }

    function changeContract(address newVersion) external
        onlyOwner()
    {
        currentVersion = newVersion;
    }

    function changeRelayer(address _owner) external
        onlyOwner()
    {
        owner = _owner;
    }

    function _implementation() internal override view returns (address) {
        return currentVersion;
    }
}



pragma solidity ^0.7.1;


abstract contract Proxy {
    
    fallback() external payable {
        _fallback();
    }

    
    function _implementation() internal virtual view returns (address);

    
    function _delegate(address implementation) internal {
        assembly {
            
            
            
            calldatacopy(0, 0, calldatasize())

            
            
            let result := delegatecall(
                gas(),
                implementation,
                0,
                calldatasize(),
                0,
                0
            )

            
            returndatacopy(0, 0, returndatasize())

            switch result
                
                case 0 {
                    revert(0, returndatasize())
                }
                default {
                    return(0, returndatasize())
                }
        }
    }

    
    function _willFallback() internal virtual {}

    
    function _fallback() internal {
        _willFallback();
        _delegate(_implementation());
    }
}
