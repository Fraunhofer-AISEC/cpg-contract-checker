
import "./MyLibrary.sol";

contract MyContract {
    using MyLibrary for uint256;
    uint256 public myUint;

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint.getNumber();
    }
}
