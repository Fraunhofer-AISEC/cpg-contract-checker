pragma solidity >=0.7.0 <0.9.0; 

import "@openzeppelin/contracts/utils/Strings.sol"; 

return bytes(currentBaseURI).length > 0 ? 
string(abi.encodePacked(currentBaseURI, Strings.toString(_tokenId), uriSuffix)) : ""; 
