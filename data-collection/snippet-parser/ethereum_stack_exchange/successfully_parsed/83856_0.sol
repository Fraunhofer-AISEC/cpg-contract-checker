contract MyContract {
    using SafeMath for uint256;
    uint dayInSec = 86400;

    function calc() public returns(uint) {
        return now.add(dayInSec);
    }
}
