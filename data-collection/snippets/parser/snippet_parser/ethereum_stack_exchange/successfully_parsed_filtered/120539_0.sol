struct User {
  uint256 totalAmount;
}

mapping(address => mapping(address => User)) Users;

function withdraw(
   address _token,
   address _user,
   uint256 _amount
) external {
   User storage user = Users[_token][_user];
   user.totalAmount -= _amount;

   
   IERC20(_token).safeTransfer(_user, _amount);
}
