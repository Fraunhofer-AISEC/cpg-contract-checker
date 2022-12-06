mapping(address => string[]) addressLink;
function getLinks(address a) public view returns (string[] memory)
  {
    return addressLink[a];
  }
