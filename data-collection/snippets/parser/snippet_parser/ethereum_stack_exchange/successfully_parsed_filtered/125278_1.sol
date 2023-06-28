constructor() ERC721("KNFT", "NFT") {}

struct Collect {
  uint256 id;
  uint256 strength;
  uint256 defence;
  uint256 health;
}

event created (uint256 id);

mapping(uint256 => Collect) public Collectibles;

function mint(uint256 strength, uint256 defence, uint256 health) public payable returns(uint256){
  require(msg.sender == owner);
    
  _tokenIds.increment();


  uint256 id = _tokenIds.current();
  _safeMint(msg.sender, id);
  
  Collect memory newCollectible = Collect(
    id,
    strength,
    defence,
    health
  );


  Collectibles[id] = newCollectible; 

    emit created(id); 
    return id;   
}
