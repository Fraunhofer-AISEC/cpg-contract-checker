pragma solidity ^0.4.17;
contract ContractThatCanSign
{
  mapping(bytes32 => bool) public signedDataHashes;

  function signData(bytes dataToSign) private
  {
    signedDataHashes[sha256(dataToSign)] = true;
  }

  function isDataSigned(bytes data) public view returns (bool)
  {
    return signedDataHashes[sha256(data)];
  }
}
