 function getPaperValues(uint _paperId) public view returns(string memory title,string memory ipfscid,address author,PaperStatus status,address[] memory reviewers,bytes32[] memory keywords,uint version)
{
    return (paperFiles[_paperId].title,paperFiles[_paperId].ipfs_cid,paperFiles[_paperId].author,paperFiles[_paperId].status,paperFiles[_paperId].reviewers,paperFiles[_paperId].keywords, paperFiles[_paperId].version_number);
}
