function generatePet(
                           uint256 _petPrice, 
                           string memory contentHash,
                           string memory _name,
                           string memory _akcPopularity,
                           string memory _height,
                           string memory _weight,
                           string memory _lifeExpectancy,
                           string memory _group
                           ) public returns(bool) {
         
         require(msg.sender != address(0), "Please! Check back! Registeration should not be from zero address");
         require(msg.sender == owner, "Only contract owner can generate more pets");
         
         tokenId++;
         require(tokenId <= 16, "More than 16 pets is not allowed");
         
         priceMapping[tokenId] = _petPrice;
         tokenIdToOffchainContentHash[tokenId] = contentHash;
         _mint(owner, tokenId);
         emit PetGenerated(owner, tokenId, _petPrice, contentHash, _name, _akcPopularity, _height, _weight, _lifeExpectancy, _group);
         return true;
       }
