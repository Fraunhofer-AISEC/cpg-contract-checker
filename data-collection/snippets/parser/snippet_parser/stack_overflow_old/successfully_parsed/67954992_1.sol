pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

contract storeHash {


string[] public fileHash;



function set(string memory _fileHash) public {
    
    fileHash.push(_fileHash);
}



function get() public view returns (string[] memory) {

    return fileHash;

}
}