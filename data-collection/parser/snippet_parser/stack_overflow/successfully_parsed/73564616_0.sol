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
    REVEAL_TIMESTAMP = saleStart + (9900 * 9);
}

function withdraw() public onlyOwner {
    uint balance = address(this).balance;
    msg.sender.transfer(balance);
}


function reserveTest() public onlyOwner {        
    uint supply = totalSupply();
    uint i;
    for (i = 0; i < 100; i++) {
        _safeMint(msg.sender, supply + i);
    }
}


function setRevealTimestamp(uint256 revealTimeStamp) public onlyOwner {
    REVEAL_TIMESTAMP = revealTimeStamp;
} 

function setProvenanceHash(string memory provenanceHash) public onlyOwner {
    TEST_PROVENANCE = provenanceHash;
}

function setBaseURI(string memory baseURI) public onlyOwner {
    _setBaseURI(baseURI);
}


function flipSaleState() public onlyOwner {
    saleIsActive = !saleIsActive;
}

function mintTest(uint numberOfTokens) public payable {
    require(saleIsActive, "Sale must be active to mint Test");
    require(numberOfTokens <= maxTestPurchase, "Can only mint 20 tokens at a time");
    require(totalSupply().add(numberOfTokens) <= MAX_TEST, "Purchase would exceed max supply of Test");
    require(testPrice.mul(numberOfTokens) <= msg.value, "Ether value sent is not correct");
    
    for(uint i = 0; i < numberOfTokens; i++) {
        uint mintIndex = totalSupply();
        if (totalSupply() < MAX_TEST) {
            _safeMint(msg.sender, mintIndex);
        }
    }

    if (startingIndexBlock == 0 && (totalSupply() == MAX_TEST || block.timestamp >= REVEAL_TIMESTAMP)) {
        startingIndexBlock = block.number;
    } 
}


function setStartingIndex() public {
    require(startingIndex == 0, "Starting index is already set");
    require(startingIndexBlock != 0, "Starting index block must be set");
    
    startingIndex = uint(blockhash(startingIndexBlock)) % MAX_TEST;
    
    if (block.number.sub(startingIndexBlock) > 255) {
        startingIndex = uint(blockhash(block.number - 1)) % MAX_TEST;
    }
    
    if (startingIndex == 0) {
        startingIndex = startingIndex.add(1);
    }
}


function emergencySetStartingIndexBlock() public onlyOwner {
    require(startingIndex == 0, "Starting index is already set");
    
    startingIndexBlock = block.number;
}
