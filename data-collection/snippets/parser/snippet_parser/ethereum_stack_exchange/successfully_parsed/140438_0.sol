
pragma solidity ^0.8.12;

  struct TokenData {
    uint tokenId; 

    uint16 familyId;
    uint familySupplyIdx; 

    uint8 typeId;      
    uint16 evoId;        
    uint32 colorId; 
  
    uint16[] traitIds;     
    uint16[4] specsIds;

    uint32 itemId; 

    uint valueA;
    uint valueB;

    uint16[] buffIds;        

    address lockedBy; 
  }


  function mint(uint16 _familyId, uint8 _typeId, uint16 _evoId, uint32 _colorId, uint16[] memory _traitIds, uint16[4] memory _specsIds, uint _valueA, uint _valueB) public onlyAllowed onlyWithTag('Mint') onlyValidFamily(_familyId) {
    
    uint _familySupplyIdx = supply[_familyId]; 
    uint _tokenId = _getTokenId(_familyId, _familySupplyIdx); 

    
    TokenData memory tdata = TokenData(
      _tokenId,
      _familyId,         
      _familySupplyIdx,
      _typeId,
      _evoId,  
      _colorId, 
      _traitIds, 
      _specsIds,     
      0,   
      _valueA, 
      _valueB,
      new uint16[](0),
      address(0x0) 
    );

    tokensDatas[_tokenId] = tdata;

    
    _safeMint(msg.sender, _tokenId);

    
    _incrementSupply(_familyId);
  }
