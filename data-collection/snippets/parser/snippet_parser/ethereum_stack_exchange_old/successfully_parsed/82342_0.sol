pragma solidity ^0.5.0;

contract D {
    function g(uint256 a) public view returns(uint256) {
        return a*2;
    }
}

contract A {
    D public impl;

    constructor() public {
        impl = new D();
    }

    function() external {
        require(msg.sender == address(this));

        (bool success, bytes memory data) = address(impl).delegatecall(msg.data);
        assembly {
            switch success
                
                case 0 { revert(add(data, 32), returndatasize) }
                default { return(add(data, 32), returndatasize) }
        }
    }

    function f(uint256 a)
        public
        view
        returns(uint256)
    {
        (bool success, bytes memory data) = address(this).staticcall(
            abi.encodeWithSelector(
                impl.g.selector,
                10
            )
        );

        assembly {
            switch success
                
                case 0 { revert(add(data, 32), returndatasize) }
                default { return(add(data, 32), returndatasize) }
        }
    }
}
