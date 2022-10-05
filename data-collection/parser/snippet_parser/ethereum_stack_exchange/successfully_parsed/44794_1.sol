pragma solidity 0.4.19;

contract Ranges {

    address public owner;

    uint public lowerLine;
    uint public upperLine;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    event LogNewLines(address sender, uint lower, uint upper);

    function isValidRange(uint lower, uint upper) public pure returns(bool isIndeed) {
        return lower > 0 && upper > lower;
    }

    function Ranges(uint lower, uint upper) public {
        require(isValidRange(lower,upper));
        owner = msg.sender;
        lowerLine = lower;
        upperLine = upper;
        LogNewLines(msg.sender, lower, upper);
    }

    function isInRange(uint check) public view returns(bool isIndeed) {
        return check >= lowerLine && check <= upperLine;
    }

    function setRange(uint lower, uint upper) public onlyOwner returns(bool success) {
        require(isValidRange(lower,upper));
        lowerLine = lower;
        upperLine = upper;
        LogNewLines(msg.sender, lower, upper);
        return true;
    }
}
