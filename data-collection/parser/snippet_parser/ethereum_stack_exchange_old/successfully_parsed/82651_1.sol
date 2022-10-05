mapping(uint256 => uint256[]) public submissions;

function addSubmissionNoCheck(uint256 key, uint256 timeAtLocation) external {
  submissions[key].push(timeAtLocation);
}
