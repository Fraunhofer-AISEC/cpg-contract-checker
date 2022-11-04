pragma solidity ^0.5.0;
contract Proof1 {
  struct FileDetails {
    uint256 timestamp;
    string owner;
  }
  mapping(string => FileDetails) files;
  event logFileAddedStatus(
    bool status,
    uint256 timestamp,
    string owner,
    string fileHash
);

function set(string memory owner, string memory fileHash) public {
  if (files[fileHash].timestamp == 0) {
    files[fileHash] = FileDetails(block.timestamp, owner);

    emit logFileAddedStatus(true, block.timestamp, owner, fileHash);
  } else {
    emit logFileAddedStatus(false, block.timestamp, owner, fileHash);
  }
}

function get(string memory fileHash)
public
view
returns (uint256 timestamp, string memory owner)
{
  return (files[fileHash].timestamp, files[fileHash].owner);
}}
