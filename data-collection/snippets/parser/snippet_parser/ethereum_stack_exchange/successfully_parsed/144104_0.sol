
function WithdrawProject(
    address _tokenAddress,
    address _project_wallet,
    uint256 _operatorTotalProject
) isOperator external returns (bool) {
    IERC20 _token = IERC20(_tokenAddress);
    address _project = _project_wallet;
    uint256 project2Transfer = _operatorTotalProject;
    _operatorTotalProject = 0;
    _token.transferFrom(lotteryOperator, _project, project2Transfer);
    return true;
}
