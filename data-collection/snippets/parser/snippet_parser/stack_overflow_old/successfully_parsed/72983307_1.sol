    function setPerson(string memory _name,uint256 _id, uint256 _favNum) public {
        dataList[_id]= People(_name,_favNum);
        countArr.push(_id);
    }
