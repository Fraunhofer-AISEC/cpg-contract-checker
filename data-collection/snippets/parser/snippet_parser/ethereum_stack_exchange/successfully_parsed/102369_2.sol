contract TwoPeopleAgreement is ERC721Full {
  uint public nonce;            
  mapping (address => bool) isOwner;
  address[] public ownersArr;       
  address payable public owner;

struct People {
    uint256 uuid;
    string name;
    string lastname;
}

struct Image {
    uint256 uuid;
    string url;
}

People[] peoples;
Image[] picture;

mapping(uint256 => bool) _peopleExists;
}