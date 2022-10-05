function addRecordWithInsertionSort(uint _recId, uint _num) public {
    Record record = records[_recId];
    record.recId = _recId;
    record.data.length++;
    record.data[record.data.length-1] = _num;
    insertionSort(record.data, record.data.length);
}
