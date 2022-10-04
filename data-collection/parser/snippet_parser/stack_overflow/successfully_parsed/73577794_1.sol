
pragma solidity ^0.8.7;

import './ERC721Connecter.sol';

contract KryptoBird is ERC721Connecter {

    string[] public kryptoBirdz;

    mapping(string => bool) _kryptoBirdzExists;

    function mint(string memory _kryptoBird) public {
        
        require(!_kryptoBirdzExists[_kryptoBird],
        'Error - kryptoBird already exists');

        
        kryptoBirdz.push(_kryptoBird);
        uint _id = kryptoBirdz.length - 1;

        
        _mint(msg.sender, _id);
         _kryptoBirdzExists[_kryptoBird]=true;


    }
    

constructor() ERC721Connecter('KryptoBird','KBIRDZ')
{}

}
