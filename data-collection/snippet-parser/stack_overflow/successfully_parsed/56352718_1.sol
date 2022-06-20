pragma solidity ^0.5.0;

interface B {
    function BuyService(address receiver) external;
}

interface ERC20 {
    function approve(address receiver, uint256 amout) external;
}

contract A {
    ERC20 public token = ERC20(0x123);
    B public b = B(0x123);

    function helpMeBuyService() external {
        token.approve(address(b), 1000); 
        b.BuyService(msg.sender); 
    }
}
