  struct PaperStuct {
    uint256 id,
    string url
    }
  mapping(uint256=>PaperStruct) public paperById;
  function getPaper (
    uint256 _tokenId
    ) public returns (PaperStruct[1] memory){
      PaperStruct[1] memory paperGot;
      paperGot[0] =paperById[_tokenId];
      return paperGot;
    }
