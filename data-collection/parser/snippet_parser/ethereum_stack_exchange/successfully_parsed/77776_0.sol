    int[][] public publicData;

    function handleAddData(int[] memory data) public {

    publicData.push(data);

    }

   function getData() public returns(int[][] memory data) {
    return publicData;
   }
