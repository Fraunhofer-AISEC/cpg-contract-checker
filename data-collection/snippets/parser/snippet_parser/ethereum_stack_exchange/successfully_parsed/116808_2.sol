    mapping (address => uint256) addressToNumberOfTokensMinted;
    bool freeMintPeriod = true;

    function mintforfree(uint256 _count) external {
        addressToNumberOfTokensMinted += _count;
        if(freeMintPeriod) {
            require(addressToNumberOfTokensMinted[msg.sender] < 6, "No free mints left!");
    }

        uint256 totalSupply = totalSupply();
        for(uint256 i = 0; i < _count; i++){
            _safeMint(msg.sender, totalSupply + i);
        }
}
