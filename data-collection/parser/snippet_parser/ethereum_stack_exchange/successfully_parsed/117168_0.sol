

    address private immutable owner;
    IWETH private constant WETH = IWETH(0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3);

    receive() external payable {
        if (msg.value > 0) {
        WETH.deposit{value: msg.value}();
        
      }
    }

    function withdraw() external onlyOwner {
        uint256 wethBalance = WETH.balanceOf(address(this));

        if (wethBalance > 0) { WETH.withdraw(wethBalance); }
    }
