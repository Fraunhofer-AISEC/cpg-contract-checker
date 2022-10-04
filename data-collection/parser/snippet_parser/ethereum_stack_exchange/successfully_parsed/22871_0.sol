library IpfsUtils {

  struct IpfsHash {
    bytes32 hash;
    uint8 hashFunction;
    uint8 hashSize;
  }

  function insert(bytes _hash) {}
  function combine() {}
}

contract Members {

  struct Member {
     IpfsUtils.IpfsHash profile;
     uint id;
  }
  mapping (address => Member) public members;

  function addMember(uint id, bytes profileHash) {
    Member m = members[msg.sender];
    m.id = id;
    m.profile.insert(profileHash);
  } 
}
