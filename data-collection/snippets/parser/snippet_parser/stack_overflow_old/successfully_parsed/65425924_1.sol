
pragma solidity >=0.5.16 <0.7.0;

contract MyContract {

  string contractHash;

  function setHash(string memory ipfsHash) public {
    contractHash = ipfsHash;
  }

  function getHash() public view returns (string memory ipfsHash) {
    return contractHash;
  }
}
