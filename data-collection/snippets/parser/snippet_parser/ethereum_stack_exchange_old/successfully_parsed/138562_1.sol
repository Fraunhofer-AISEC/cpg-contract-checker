contract VolcanoNFT_hw9Test is Test {
    
    VolcanoNFTHw9 private volcanoNFT;
    address owner;
    address otherAccount;
    address ZERO_ADDRESS = address(0);

    function setUp() public {
        volcanoNFT = new VolcanoNFTHw9("NFT1","myNFT");
        owner = address(this);
        otherAccount = vm.addr(2);
    }

    event Transfer(address indexed from, address indexed to, uint256 tokenId);
    function testMintEmitsEvent() public {        
        vm.expectEmit(true, true, false, true);
        emit Transfer(ZERO_ADDRESS, owner, 1);
        volcanoNFT.mint(owner, "abc");
    }
}