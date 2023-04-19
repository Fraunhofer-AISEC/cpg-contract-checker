library ArrayLibrary {
    function remove(uint[] storage _arr, uint _removedIndex) public returns(uint[] memory){
        require(_arr.length > 0, "No element in Array.");
        for(uint i; i < _arr.length - 1; i++){
            if (i >= _removedIndex) {
                _arr[i] = _arr[i + 1];               
            } 
        }
        _arr.pop();
        return _arr;
    }
}


contract TestLibrary {
    uint[] arr;
    using ArrayLibrary for uint[];

    function deleteArrEle(uint[] calldata _arr, uint deletedIndex) public returns (uint[] memory deletedArr) {
        arr = _arr;
        deletedArr = arr.remove(deletedIndex);
    }
}
