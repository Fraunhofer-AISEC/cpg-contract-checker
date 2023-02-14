


pragma solidity ^0.8.17;

interface ERC20Upgradeable {
    function transferFrom(address from, address to, uint256 amount) external;
}

contract example {
    function payMultipleUsers(address paymentToken,address theGuyWhoIsPayingEverything, address[] memory users, uint256[] memory payments) external  {
        require(users.length == payments.length, "Wrong parameters");

        ERC20Upgradeable contractToCall = ERC20Upgradeable(paymentToken);
        
        for (uint i = 0; i < users.length; i++) {
           contractToCall.transferFrom(theGuyWhoIsPayingEverything, users[i], payments[i]);
        }
    }
}
