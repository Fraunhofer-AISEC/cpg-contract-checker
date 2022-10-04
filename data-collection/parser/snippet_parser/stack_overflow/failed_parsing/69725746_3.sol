pragma solidity 'some version';

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";




contract NFT is ERC721URIStorage{
  


    

function fund () public view returns(bool) {

bool res=erc.fundidea('address',value)
return res;
}
}


------- ERC20.sol -------


pragma solidity ^0.8.2;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./NFT.sol";

    contract ERc is ERC20 {
        
    constructor() ERC20('','') {
            
        }
    
    function addInitialSupply(uint256 _initialSupply)  public {
            _mint(msg.sender, _initialSupply * 10 );
        }
        function fundIdea(address _author, uint value) public returns(bool){
             transfer(address(_author), value);
             return true;
        }
    }
