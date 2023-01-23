    function swapETHForGT(uint256 amount) external payable {
        uint256 tokenAmount = amount * rate * 1000000000000000000;
        require(GT.balanceOf(Governor) >= tokenAmount);

        GT.transferFrom(payable(Governor), payable(msg.sender), tokenAmount);

        (bool sent, bytes memory data) = payable(address(this)).call{value: amount * 1000000000000000000}("");
        require(sent, "tx failed");
    }
