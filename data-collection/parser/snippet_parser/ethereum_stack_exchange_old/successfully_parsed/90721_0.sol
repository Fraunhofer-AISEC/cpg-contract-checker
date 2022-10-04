pragma solidity 0.6.12;

contract MyContract {
    uint256 private constant SUCCESS = 42;
    uint256 private constant FAILURE = 84;

    function sendMessage() external pure returns (uint256) {
        return SUCCESS;
    }

    function test(bytes4 funcSelector) external view returns (uint256) {
        bytes memory data = abi.encodeWithSelector(funcSelector);
        (bool success, bytes memory returnData) = address(this).staticcall(data);

        if (success && returnData.length == 32)
            return abi.decode(returnData, (uint256));

        return FAILURE;
    }
}
