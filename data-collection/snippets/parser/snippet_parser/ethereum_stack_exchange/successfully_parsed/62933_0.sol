struct Key {
  uint expirationTimestamp;
  bytes data;
 }

 mapping (address => Key) internal keyByOwner;

 address[] public owners;

  function getKeysByPage(uint _startIndex)
    external
    view
    returns (uint[], bytes[])
  {
    require(outstandingKeys() > 0, "No keys to retrieve");
    require(_startIndex >= 0 && _startIndex < outstandingKeys(), "Index must be in-bounds");
    uint endOfPageIndex;

    if (_startIndex + 9 > owners.length) {
      endOfPageIndex = owners.length - 1;
    } else {
      endOfPageIndex = _startIndex + 9;
    }

    address[] memory ownersByPage = new address[](10);
    uint[] memory timestampsArray = new uint[](10);
    bytes[] memory keyDataArray = new bytes[](10);
    Key memory tempKey;
    uint pageIndex = 0;

    
    for (uint256 i = _startIndex; i <= endOfPageIndex; i++) {
      ownersByPage[pageIndex] = owners[i];
      pageIndex++;
    }

    
    for (uint256 n = 0; n < ownersByPage.length; n++) {
      tempKey = keyByOwner[ownersByPage[n]];
      timestampsArray[n] = tempKey.expirationTimestamp;
      keyDataArray[n] = tempKey.data;
    }

    return(timestampsArray, keyDataArray);
  }
