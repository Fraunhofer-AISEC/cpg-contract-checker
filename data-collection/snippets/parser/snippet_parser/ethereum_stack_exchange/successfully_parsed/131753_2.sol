    function getPerson(uint _id) public view returns(string memory,uint256){
        return (dataList[_id].name, dataList[_id].favNum);
    }
