import "@openzeppelin/contracts/access/Ownable.sol";

function getData(uint tokenId) public onlyOwner view returns (uint, uint, uint, uint, uint, uint)
