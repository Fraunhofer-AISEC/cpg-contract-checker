
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Sketch is ERC721, Ownable{
  address payable private admin;
  string[] public sketchs;
  mapping(string => bool) _sketchExists;

  constructor() ERC721("Sketch", "SKETCH") public {
    admin = msg.sender;
  }

  
  
  function mint(string memory _sketch) public {
    require(!_sketchExists[_sketch]);
    sketchs.push(_sketch);
    uint _id = sketchs.length - 1;
    _safeMint(msg.sender, _id,'');
    _sketchExists[_sketch] = true;
  }

  function transfersketch(address _to, uint _id) public {
      safeTransferFrom(msg.sender, _to, _id);
  }
}
