pragma solidity >=0.4.1 <0.8.0;
pragma experimental ABIEncoderV2;

import "./MarketLib.sol";
import "./MyERC721.sol";



contract CryptoPunksMarket {
    mapping (uint => address) public punkIndexToAddress;
}
