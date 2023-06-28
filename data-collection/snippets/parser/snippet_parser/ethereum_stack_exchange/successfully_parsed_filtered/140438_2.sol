
pragma solidity ^0.8.12;

struct TokenData {
    uint16 familyId;
    uint8 typeId;
    uint16 evoId;
    uint32 colorId;
    uint16[] traitIds;
    uint16[4] specsIds;
    uint valueA;
    uint valueB;
}

function mint(TokenData memory tdata) public onlyAllowed onlyWithTag('Mint') onlyValidFamily(tdata.familyId) {
    uint _familyId = tdata.familyId;
    uint _familySupplyIdx = supply[_familyId];
    uint _tokenId = _getTokenId(_familyId, _familySupplyIdx);

    tokensDatas[_tokenId] = tdata;
    _safeMint(msg.sender, _tokenId);
    _incrementSupply(_familyId);
}
