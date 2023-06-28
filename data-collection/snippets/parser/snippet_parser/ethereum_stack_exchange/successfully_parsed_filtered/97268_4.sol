
import "@openzeppelin/contracts/access/Ownable.sol";

contract Thing is Ownable {

  function forwarder() public payable {
    payable(owner()).transfer(msg.value); 
  }
}
