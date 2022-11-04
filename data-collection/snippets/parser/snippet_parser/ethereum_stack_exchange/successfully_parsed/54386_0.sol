contract DataStorage {

    
    mapping (uint256 => uint256) sequentialData1;
    uint256 sequentialData1Counter;

    
    uint256[] sequentialData2;

    function addDataToMapping(uint256 _newData) {
        sequentialData1[sequentialData1Counter++] = _newData;
    }

    function addDataToDynamicArray(uint256 _newData) {
        sequintialData2.push(_newData);
    }
}
