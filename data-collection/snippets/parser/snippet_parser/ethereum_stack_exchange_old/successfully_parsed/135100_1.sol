contract Max_Array{

    uint[] public myArray;

    function push(uint i) public {
        myArray.push(i);
    }

    function getArray() public view returns(uint[]  memory) {
        return myArray;
    }

    function getMax() public view returns(uint) {
        uint256 max = 0;
        for(uint256 i = 0; i < myArray.length; i++){
            if(myArray[i] > max){
                max = myArray[i];
            }
        }
        return max;
    }

    function getMaxIndex() public view returns(uint) {
        uint256 max = 0;
        uint256 maxIndex = 0;
        for(uint256 i = 0; i < myArray.length; i++){
            if(myArray[i] > max){
                max = myArray[i];
                maxIndex = i;
            }
        }
        return maxIndex;
    }

}
