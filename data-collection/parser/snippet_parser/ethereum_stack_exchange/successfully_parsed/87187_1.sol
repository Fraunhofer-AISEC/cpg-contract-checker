pragma solidity >=0.4.21 <0.7.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Art is ERC721{

    string[] public arts;

    mapping(string => bool) _artExists;

    constructor() ERC721("Art", "DATA") public {
    }

    

    
    function mint(string memory _art) public{
        
        require(!_artExists[_art]);
        uint _id = arts.push(_art);
              
        
        _mint(msg.sender, _id);
        _artExists[_art] = true;

        
        
        
        



    }

}

