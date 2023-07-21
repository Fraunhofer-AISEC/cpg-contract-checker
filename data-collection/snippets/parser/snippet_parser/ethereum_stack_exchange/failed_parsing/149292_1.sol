contract FailureTest {
    event Success();
    event Failure();

    function doStuff(address target) external {
        IERC20 erc20 = IERC20(target);
        if (erc20.supportsInterface(0x36372b07)) {
            
            try erc20.balanceOf(msg.sender) {
                emit Success();
            } catch {
                emit Failure();
            } 
        } else {
            emit Failure();
        }
    }

    interface IERC20 {
        function balanceOf(address) external returns(uint256);
        function supportsInterface(bytes4 interfaceId) external view returns (bool);
    }
}
