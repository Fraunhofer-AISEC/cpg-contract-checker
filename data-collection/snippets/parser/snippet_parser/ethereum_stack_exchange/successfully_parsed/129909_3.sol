
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";

contract MyToken is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    uint256 public immutable startPrice = 5 ether;
    uint256 public immutable startAt;
    uint256 public immutable endsAt;
    uint256 public immutable endPrice = 2 ether;
    uint256 public immutable discountRate = 0.01 ether;
    uint256 public duration = 300 hours;
    uint256 public immutable MAX_SUPPLY = 10000;

    constructor() ERC721("MyToken", "MTK") {
        startAt = block.timestamp;
        endsAt = block.timestamp + duration;
    }

    function price() public view returns (int256) {
        if (endsAt < block.timestamp) {
            return int256(endPrice);
        }
        uint256 timeElapsed = (block.timestamp - startAt);
        int256 a = int256(startPrice)/(int256(startAt) - int256(endsAt));
        return a * (int256(timeElapsed) - int256(endsAt));
    }

    function safeMint(address to) public payable {
        require(int256(msg.value) >= price(), "Not enough ether sent");
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId < MAX_SUPPLY, "No more items left.");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId + 1);
    }

    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
