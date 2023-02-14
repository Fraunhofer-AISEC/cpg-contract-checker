
pragma solidity ^0.8.0;

interface IERC20 {
    function balanceOf(address) external  view returns (uint);
}

contract BalanceChecker {
    function getBalances(address user, IERC20[] memory tokens) external view returns (uint256[] memory) {
        uint[] memory balances = new uint[](tokens.length);

        for (uint i = 0; i < tokens.length; i++) {
            balances[i] = tokens[i].balanceOf(user);
        }

        return  balances;
    }
}
