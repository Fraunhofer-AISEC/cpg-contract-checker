function viewRice(uint32 _id) public view returns(address owner, address farmer, State status, uint256 weight){
        return (rices[_id].owner, rices[_id].farmer, rices[_id].status, rices[_id].weight);
    }
