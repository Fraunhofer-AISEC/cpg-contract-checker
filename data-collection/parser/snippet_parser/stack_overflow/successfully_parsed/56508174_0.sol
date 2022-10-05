pragma solidity ^0.5.0;
contract ItemsList {

    uint public itemCount = 0;
    mapping(uint => Item) public items;

    struct Item {
        string encryptedProofHash;
    }

    function createItem(string memory _encryptedProofHash) public {
         items[itemCount] = Item(_encryptedProofHash);
         itemCount++;
    }

    function getItemCount() public view returns (uint){
      return itemCount;
    }
}
