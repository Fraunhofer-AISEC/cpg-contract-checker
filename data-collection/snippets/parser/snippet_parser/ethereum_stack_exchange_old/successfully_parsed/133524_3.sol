pragma solidity ^0.8.0;

contract ISomeOtherContract {
    Demo d;

    constructor(address _d) {
        d = Demo(_d);
    }

    function bar() external {
        d.destroy();
    }
}

contract Demo {
    uint256 public mySpecialNumber = 0;

    function foo(address callee, uint256 newNumber) public {
        mySpecialNumber = newNumber;

        
        callee.call{gas: gasleft() - 2000}(
            abi.encodeWithSelector(ISomeOtherContract.bar.selector)
        );
    }

    function destroy() public {
        selfdestruct(payable(msg.sender));
    }
}
