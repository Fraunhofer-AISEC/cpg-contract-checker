abstract contract A {
function stake(
        address _userAddress,
        uint256 _amount
    ) internal virtual {}

function investByToken(
        address _userAddress,
        IERC20Upgradeable _token,
        uint256 _amount,
    ) external payable {


stake(_userAddress, _liquidity);
     }
}
