interface ICaller {
    struct CallDescription {
        uint256 value;
        bytes data;
    }

    function makeCall(CallDescription memory desc) external;
    function makeCalls(CallDescription[] memory desc) external payable;
}
