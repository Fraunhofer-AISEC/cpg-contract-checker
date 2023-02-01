import "@openzeppelin/contracts/utils/Counters.sol";

contract MyContract is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    function getToken() public view onlyOwner returns (uint256) {
        return _tokenIds.current();
    }

}
