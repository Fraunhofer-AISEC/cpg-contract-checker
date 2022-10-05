import "@openzeppelin/contracts/access/Ownable.sol";

contract C is Ownable {
  address public addressOfA;

  constructor(address _addressOfA) {
    addressOfA = _addressOfA;
  }

  function updateAddressOfA(address newAddress) public onlyOwner {
    addressOfA = newAddress
  }
}
