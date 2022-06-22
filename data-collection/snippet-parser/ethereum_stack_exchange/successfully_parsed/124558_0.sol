
pragma solidity ^0.8.7;
contract DropSite {
    uint public value = 123;
    
    struct NFT_Owner{
      string  name;
      uint nft_id;
    }
    mapping(address => NFT_Owner) public NFT_Ownership;
    address[] public NFT_Owners;

    function addValues( string memory _name, uint _nft_id) public {

      NFT_Owner owner = NFT_Owner({name:_name , nft_id: _nft_id}) ;
      
      NFT_Ownership[msg.sender] = owner;
      NFT_Owners.push(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);
    }
     
  }
