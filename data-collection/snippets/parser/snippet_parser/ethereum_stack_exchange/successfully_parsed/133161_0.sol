contract foobar {
    
    uint[] public arr = [1,2,3,4,5];

    function find() public view returns(bool) {
            for(uint i = 0; i < arr.length; i++ ) {
            if(arr[i] == 5) {
                return true;
            }
        }
        return false;
    }
}
