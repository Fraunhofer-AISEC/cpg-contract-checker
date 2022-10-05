  mapping (string => bool) private proofs;
  mapping (address => string[]) public owns;

  function registerAsset(string memory assetHash) public {
    proofs[assetHash] = true;
    owns[msg.sender].push(assetHash);
  }

  function checkIfRegistered(string memory assetHash) public view returns (bool) {
    return proofs[assetHash];
  }

  function getSize(address key) public view returns (uint){
    return owns[key].length;
  }

  function getAssets(address key) public view returns (string[] memory){
    return owns[key];
  }
