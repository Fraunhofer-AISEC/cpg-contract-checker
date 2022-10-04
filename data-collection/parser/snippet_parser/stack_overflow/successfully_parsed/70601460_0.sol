function setDetails(string memory _name) public onlyAuthCaller returns(address){
        uint256 tmpData = uint256(keccak256(abi.encodePacked(msg.sender, block.timestamp)));
        address batchNo = address(tmpData);

        detailsData.name = _name;

        batchDetails[batchNo] = detailsData;

        nextAction[batchNo] = 'NEXT';

        return batchNo;
}
