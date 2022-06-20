Record[] memory records = findRecords();  
ViewModel[] memory results = new ViewModel[](records.length);  
for (uint index = 0; index < records.length; index++) {
    results[index] = getResultFromRecord(records[index]);  
}
return results;
