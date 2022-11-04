pragma solidity ^0.8.0;
import "./weth.sol";
contract Unwrap {
    fallback() external payable {}
    receive() external payable {}
    function unwrap() external payable {
        IWETH weth = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
        weth.withdraw(weth.balanceOf(address(this)));
    }
}
