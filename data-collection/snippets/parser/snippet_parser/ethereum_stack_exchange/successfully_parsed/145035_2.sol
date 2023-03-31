mapping(uint => uint256[]) public endtime;

function getMappingPosition(uint256 position) external view returns (uint256){
    return endtime[position];
}
