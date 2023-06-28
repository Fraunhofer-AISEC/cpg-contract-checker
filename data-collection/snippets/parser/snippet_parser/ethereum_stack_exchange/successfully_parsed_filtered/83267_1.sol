pragma solidity ^0.8.9;

interface inheritMe {
    function interitedFunction() external;
}

contract mainContract is inheritMe {
}
