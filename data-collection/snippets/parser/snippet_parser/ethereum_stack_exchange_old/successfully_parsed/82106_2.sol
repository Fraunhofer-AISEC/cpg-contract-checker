pragma solidity ^0.5.0;

import "./ERC721Full.sol";
import "./Counters.sol";     

contract MyContract is ERC721Full {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor(string memory myName, string memory mySymbol) ERC721Full(myName, mySymbol) public {

    }

    function mint(address player, uint totalSupply) public returns (bool) {

        for(uint256 i = 1; i<= totalSupply; i++){
            _tokenIds.increment();
            uint256 newItemId = _tokenIds.current();
            _mint(player, newItemId);
        }
    }
}

contract ContractFactory {

    address[] public contracts;
    address public lastContractAddress;       

    function getContractCount() public view returns(uint contractCount) {
        return contracts.length;
    }

     
    function deploy(string memory name, string memory symbol) public returns(address newContract){
         MyContract c = new MyContract(name,symbol);
         address cAddr = address(c);
         contracts.push(cAddr);
         lastContractAddress = cAddr;

         return cAddr;
    }        
    function mint(MyContract tokenAddress, uint256 totalSupply) public {

      tokenAddress.mint(msg.sender, totalSupply);
    }       
}
