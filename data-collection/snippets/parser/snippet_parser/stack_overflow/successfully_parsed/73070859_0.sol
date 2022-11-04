interface IPinkLock01 {
    function totalLockCountForToken(address token) external view returns (uint256);
    function getLocksForToken(address _token, uint256 start, uint256 end) external view returns (
       uint256 id, 
       address token, 
       address owner, 
       uint256 amount, 
       uint256 lockDate, 
       uint256 unlockDate
    );
}
