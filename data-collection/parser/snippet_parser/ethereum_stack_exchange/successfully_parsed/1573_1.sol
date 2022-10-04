contract InsertionSort {

    struct Record {
        uint recId;
        uint[] data;
    }

    mapping(uint => Record) records;

    function insertionSortMemory(uint[5] a) internal {
      for (uint i = 0; i < a.length; i++) {
        uint j = i;
        while (j > 0 && a[j] < a[j-1]) {
          uint temp = a[j];
          a[j] = a[j-1];
          a[j-1] = temp;
          j--;
        }
      }
    }

    function testInsertionSort() public constant returns (uint[5]) {
      uint[5] memory data;
      data[0] = 1235;
      data[1] = 1234;
      data[2] = 1233;
      data[3] = 1232;
      data[4] = 1231;
      insertionSortMemory(data);
      return data;
    }

    function insertionSort(uint[] a, uint length) internal returns (uint[]) {
      for (uint i = 0; i < length; i++) {
        uint j = i;
        while (j > 0 && a[j] < a[j-1]) {
          uint temp = a[j];
          a[j] = a[j-1];
          a[j-1] = temp;
          j--;
        }
      }
      return a;
    }

    function addRecordWithoutInsertionSort(uint _recId, uint _num) public {
        Record record = records[_recId];
        record.recId = _recId;
        record.data.length++;
        record.data[record.data.length-1] = _num;
    }

    function addRecordWithInsertionSort(uint _recId, uint _num) public {
        Record record = records[_recId];
        record.recId = _recId;
        record.data.length++;
        record.data[record.data.length-1] = _num;
        record.data = insertionSort(record.data, record.data.length);
    }



    function getRecord(uint _recId) public constant returns(uint, uint[]) {
        return (records[_recId].recId, records[_recId].data);
    }
}
