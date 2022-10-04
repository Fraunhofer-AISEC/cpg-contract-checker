IERC20 public underlying;
ICERC20 public cToken;
...

constructor(address _daiAddress, address _cdaiAddress) public payable {
        underlying = IERC20(_daiAddress);
        cToken = ICERC20(_cdaiAddress);
}

function mintCDai(uint _numberOfDaiToSupply) private { 
        require(underlying.approve(address(cToken), _numberOfDaiToSupply), "Failed to approve sending token");
        require(cToken.mint(_numberOfDaiToSupply) == 0, "Failed to mint cToken");
        ...
    }
