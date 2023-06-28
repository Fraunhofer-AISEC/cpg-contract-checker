contract MyManNFTs is ERC721("MyManNFT", "MMN"), ERC721Enumerable, MyManNFTsDNA {
  using Counters for Counters.Counter;
  using Strings for uint;
  Counters.Counter private _tokenId;
  uint256 public cost = 10000000000000000 wei;

  uint public maxSupply; 
  mapping (uint  => uint) tokenDNAList;

  constructor(uint _limitSupply){
    maxSupply = _limitSupply;
  }

  function mintToken() public payable {
    uint currTokenId = _tokenId.current();

    require(currTokenId < maxSupply, "No MyMenNFT Left!");
    require(cost <= msg.value);

    _safeMint(msg.sender, currTokenId);
    
    tokenDNAList[currTokenId] = generatePseudoRandomDNA(currTokenId, msg.sender);

    _tokenId.increment();
  }

  function _baseURI() internal pure override returns (string memory){
    return "xxxxxxxxxxx/";
  }

  function _paramsURI(uint _dna) private view returns (string memory){
    string memory params;

    { 
      params = string(abi.encodePacked(
        "?accessoriesType=",
        getAccessoriesType(_dna),
        "&clotheColor=",
        getClotheColor(_dna),
        "&clotheType=",
        getClotheType(_dna),
        "&eyeType=",
        getEyeType(_dna),
        "&eyebrowType=",
        getEyeBrowType(_dna),
        "&facialHairColor=",
        getFacialHairColor(_dna),
        "&facialHairType=",
        getFacialHairType(_dna),
        "&hairColor=",
        getHairColor(_dna),
        "&hatColor=",
        getHatColor(_dna),
        "&mouthType=",
        getMouthType(_dna),
        "&skinColor=",
        getSkinColor(_dna),
        "&graphicType=",
        getGraphicType(_dna)
      ));
    }

    return string(abi.encodePacked(params,"&topType=",getTopType(_dna)));
  }

  function getImageURI(uint _dna) public view returns (string memory){
    string memory baseURI = _baseURI();
    string memory params = _paramsURI(_dna);
    
    return string(abi.encodePacked(baseURI, params));
  }

  
  function tokenURI(uint tokenId) public view override returns(string memory){
    require(_exists(tokenId), "ERC71 Metadata: URI query for nonexistent token");

    uint tokenDNA = tokenDNAList[tokenId];
    string memory imageURI = getImageURI(tokenDNA);

    
    string memory jsonBase64 = Base64.encode(abi.encodePacked(
      '{ "name": "MyMenNFT #',
      tokenId.toString(), 
      '","description": "MyMenNFTs are randomized Avataaars.",'
      '"image":"',
      imageURI,
      '"}'
    ));

    return string(abi.encodePacked("data:application/json;base64,",jsonBase64));
  }



  
  function _beforeTokenTransfer(address _from, address _to, uint _tokenIdToTransfer) internal override(ERC721, ERC721Enumerable) {
    super._beforeTokenTransfer(_from, _to, _tokenIdToTransfer);
  }

  function supportsInterface(bytes4 interfaceId) public view override(ERC721,ERC721Enumerable) returns(bool){
    return super.supportsInterface(interfaceId);
  }

}
