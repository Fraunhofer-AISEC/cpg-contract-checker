    function collect() external {
        payable(owner()).call{value: address(this).balance}("");
    }
