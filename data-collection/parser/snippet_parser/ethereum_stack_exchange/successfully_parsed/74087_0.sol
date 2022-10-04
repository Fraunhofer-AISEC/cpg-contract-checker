pragma solidity ^0.5.0;

import "../../ERC1400.sol";
 
contract ERC1400Factory {

    ERC1400[] public deployedERC1400;
    bytes32[] public tokenDefaultPartitions;
    
    address public certificateSigner;
 
    constructor(address certificat, bytes32[] memory tokenDefaul) public {
  
    certificateSigner = certificat;
    tokenDefaultPartitions = tokenDefaul;
    }
   
    function createERC1400(string memory name, string memory symbol, uint256 granularity, address[] memory controllers) public  {
         
        ERC1400 newERC1400 = new ERC1400(name, symbol, granularity, controllers, certificateSigner, tokenDefaultPartitions);
   
        deployedERC1400.push(newERC1400);
    }

    function getDeployedERC1400() public view returns (ERC1400[] memory ) {
        return deployedERC1400;
    }
}

