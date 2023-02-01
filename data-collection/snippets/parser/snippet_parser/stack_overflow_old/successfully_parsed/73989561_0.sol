
pragma solidity ^0.8.0;
 
import "@openzeppelin/contracts/utils/Counters.sol";

contract ArrayItemReturn {
    using Counters for Counters.Counter;
    Counters.Counter public indexCounter;

    string[] strings = ["string 1", "string 2", "string 3"];

    function returnItem() external returns(string memory) {
        require(indexCounter.current() < strings.length, "You reached the end of the array");
        indexCounter.increment();

        return strings[indexCounter.current()-1];
    }
}
