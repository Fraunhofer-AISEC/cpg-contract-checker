function mintTo(address account, address tokenAddr) public {
        CustomERC20 ERC20Token = CustomERC20(tokenAddr);
        require(address(tokenAddr) != address(0), "Minting unexisting ERC20 token is not possible");
        ERC20Token.mint(account, 1);
    }

    function transferTo(address spender, address recipient, address tokenAddr) public {
        CustomERC20 ERC20Token = CustomERC20(tokenAddr);

        ERC20Token.transferFromERC20(spender, recipient, 1);
    }
