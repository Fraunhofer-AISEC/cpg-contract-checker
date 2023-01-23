function Test(uint256 w, uint256 h) external {
    uint256[] memory _array = new uint[](w*h);
    uint _count = 0;
    for(uint j = 0; j<h; j++){
        uint256 _temp = ..... 

        
        if(checkOwner(_temp) == msg.sender){
            _array[_count] = _temp;
            _count ++;
        }
    }

    if(_array.length == w*h){
        ....
    }
}
