

pragma solidity >=0.7.0 <0.9.0;

contract InfoFeed {
    function info() public pure returns (uint) { return 42; }
    function infoPayable() public payable returns (uint) { return 42; }
}


pragma solidity >=0.7.0 <0.9.0;

import "./InfoFeed.sol";

contract Consumer {

    InfoFeed feed;

    function setInfoFeed(address addr) public { feed = InfoFeed(addr); }

    function getInfo() public view returns (uint) { return feed.info(); }

}
