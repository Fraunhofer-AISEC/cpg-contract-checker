String tokenURI1 = ipfs:
String TokenURI2 = ipfs:

 function mint1(uint256 _mintAmount) public payable {
    _safeMint(_msgSender(),_mintAmount);
  }

 function mint2(uint256 _mintAmount) public payable {
    _safeMint(_msgSender(),_mintAmount);
  }
