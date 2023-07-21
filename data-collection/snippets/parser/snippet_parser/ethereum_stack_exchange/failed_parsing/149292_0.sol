contract FailureTest {

    event Success();
    event Failure();

    function doStuff(address target) external {

        try IERC20(target).balanceOf(msg.sender) {
            emit Success();
        } catch {
            emit Failure();
        } 

    }

    interface IERC20 {
        function balanceOf(address) external returns(uint256);
    }
}
