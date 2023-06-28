contract Tmp {
    event Transfer(address indexed from, address[] _to, uint256 etherd, uint256 timestamp);

    function stuff(address from, address[] memory _to, uint etherd, uint256 timestamp) external payable {
        
        
        emit Transfer(from, _to, etherd, timestamp);
    }
}
