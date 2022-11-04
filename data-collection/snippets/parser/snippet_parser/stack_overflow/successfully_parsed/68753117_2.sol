pragma solidity ^0.4.26;
contract Paper {
    struct PaperStruct {
        uint256 id;
        string url;
    }
    mapping(uint256 => PaperStruct) public paperById;
    function addPaper (uint256 _tokenId, string _url) public {
      paperById[_tokenId] = PaperStruct({
          id: _tokenId,
          url: _url
      });
    }
}
