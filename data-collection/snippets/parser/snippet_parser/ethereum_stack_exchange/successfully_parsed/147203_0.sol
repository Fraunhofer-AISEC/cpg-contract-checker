function seeError(address _token) public view returns (uint256) {
        try IERC20(_token).decimals() {
            return IERC20(_token).decimals();
        } catch {
            revert("Error occured");
        }
    }
