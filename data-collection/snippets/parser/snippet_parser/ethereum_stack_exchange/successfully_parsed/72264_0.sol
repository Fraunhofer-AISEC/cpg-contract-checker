pragma solidity 0.4.25;

contract Callee {
    uint256 public xxxx;

    function func() external returns (uint256) {
        xxxx = 123;
        return 456;
    }
}

contract Caller {
    Callee private callee = new Callee();
    uint256 public yyyy;

    function callFromConstantFunc() external view returns (uint256) {
        uint256[1] memory retv;
        address dest = address(callee);
        bytes memory selector = abi.encodeWithSelector(callee.func.selector);
        assembly {
            let status := call(gas, dest, 0, add(selector, 32), mload(selector), retv, 32)
            if iszero(status) {
                revert(0, 0)
            }
        }
        return retv[0];
    }

    function callFromNonConstantFunc() external returns (uint256) {
        uint256[1] memory retv;
        address dest = address(callee);
        bytes memory selector = abi.encodeWithSelector(callee.func.selector);
        assembly {
            let status := call(gas, dest, 0, add(selector, 32), mload(selector), retv, 32)
            if iszero(status) {
                revert(0, 0)
            }
        }
        yyyy = retv[0];
    }

    function xxxx() external view returns (uint256) {
        return callee.xxxx();
    }
}
