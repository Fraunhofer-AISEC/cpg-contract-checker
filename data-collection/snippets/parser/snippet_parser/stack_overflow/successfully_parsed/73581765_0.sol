string public TEST_PROVENANCE = "";

uint256 public startingIndexBlock;

uint256 public startingIndex;

uint256 public constant testPrice = 80000000000000000; 

uint public constant maxTestPurchase = 20;

uint256 public MAX_TEST;

bool public saleIsActive = false;

uint256 public REVEAL_TIMESTAMP;

constructor(string memory name, string memory symbol, uint256 maxNftSupply, uint256 saleStart) ERC721(name, symbol) {
    MAX_TEST = maxNftSupply;
    REVEAL_TIMESTAMP = saleStart + (86400 * 9);
}

function withdraw() public onlyOwner {
(bool os, ) = payable(owner()).call{value: address(this).balance}('');
require(os);
}