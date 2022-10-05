function viewAssets()public view returns(bytes32[] memory){
    return (profile[msg.sender].noOfLand);
}



