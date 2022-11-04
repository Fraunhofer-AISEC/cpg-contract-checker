    function insertionSortStorage(uint[] storage a) internal {
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

    function addRecordWithInsertionSortStorage(uint _recId, uint _num) public {
        Record record = records[_recId];
        record.recId = _recId;
        record.data.length++;
        record.data[record.data.length-1] = _num;
        insertionSortStorage(record.data);
    }
