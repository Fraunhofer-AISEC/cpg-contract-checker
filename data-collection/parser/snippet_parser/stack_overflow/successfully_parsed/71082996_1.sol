import "flipper.sol";

contract Incrementor {

    uint256 _count;
    Flipper _flipper;

    constructor (uint256 _initialValue, Flipper _flipperContract) {
        _count = _initialValue;
        _flipper = _flipperContract;
    }

    
    
    

    function increment () public {
      require(_flipper.get(), "Flipper must be ON");
      _count += 1;
    }

    function superFlip () public {
      _flipper.flip();
    }

    function setValue (uint256 v) public {
        _count = v;
    }

    
    
    

    function count () public view returns (uint256) {
        return _count;
    }

}
