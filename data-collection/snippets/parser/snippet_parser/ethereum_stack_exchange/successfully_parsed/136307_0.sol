library Array {
    function remove(uint[] storage arr, uint index) public {
        
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

