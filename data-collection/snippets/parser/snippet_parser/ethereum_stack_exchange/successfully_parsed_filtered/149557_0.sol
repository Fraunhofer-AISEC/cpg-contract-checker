mapping(address => address[]) myMapp; 

function add(address _address) external {
    myMapp[msg.sender] = [_address];
}

function getAddress() external view returns (address[] memory) {
    return myMapp[msg.sender];
}
