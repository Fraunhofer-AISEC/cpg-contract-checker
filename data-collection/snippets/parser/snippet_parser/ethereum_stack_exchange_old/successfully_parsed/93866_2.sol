function getFilesCount() public view returns (uint256) {
    return filesList[msg.sender].length;
}
