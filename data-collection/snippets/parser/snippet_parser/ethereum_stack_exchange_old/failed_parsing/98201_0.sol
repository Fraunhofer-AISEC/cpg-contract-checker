import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Collectioning is ERC721 {
...
address ownerAddress = ownerOf(_tokenId);
address payable pSender = payable(msg.sender);
transferFrom(ownerAddress, pSender, _tokenId);
address payable ownerAddressPayable = _make_payable(ownerAddress);
ownerAddressPayable.transfer(itemCost);
if(msg.value > starCost) {
  pSender.transfer(msg.value - itemCost);
}
