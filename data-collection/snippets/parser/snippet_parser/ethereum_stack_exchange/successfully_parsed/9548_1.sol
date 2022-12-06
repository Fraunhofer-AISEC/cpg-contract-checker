string[] myArray;

function getStringsLength() returns (uint) {
    return myArray.length;
}

function getStringByIndex(uint index) returns (string) {
    if (index < myArray.length){
        return myArray[index];
    }
    return "";
}
