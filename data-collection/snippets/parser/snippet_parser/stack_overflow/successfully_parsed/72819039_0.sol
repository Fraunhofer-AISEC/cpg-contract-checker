

pragma solidity ^0.8.0;

import "./Strings.sol";

contract NFTTest {

   uint64 serialNum = 1;

   string public uri;
   string public uriPrefix ="abc/";
   string public uriSuffix = ".json";

function setURI() external {
   uri = uriPrefix + Strings.toString(serialNum) + uriSuffix;
}

}