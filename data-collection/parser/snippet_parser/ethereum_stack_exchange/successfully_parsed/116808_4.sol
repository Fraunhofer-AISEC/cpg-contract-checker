mapping (address => uint256) addressToNumberOfTokensMinted;
bool freeMintPeriod = true;

function mint(uint256 _count) external {
    addressToNumberOfTokensMinted[msg.sender] += _count;
    if(freeMintPeriod) {
        require(addressToNumberOfTokensMinted[msg.sender] < 6, "No free mints left!");
    }

    
}
