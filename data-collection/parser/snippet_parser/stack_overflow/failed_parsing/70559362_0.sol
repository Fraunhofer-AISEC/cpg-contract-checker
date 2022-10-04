function safeApprove(IERC20 token, address spender, uint256 value) internal

        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token , abi.encodeWithSelector(token.approve.selector, spender, value));
}
