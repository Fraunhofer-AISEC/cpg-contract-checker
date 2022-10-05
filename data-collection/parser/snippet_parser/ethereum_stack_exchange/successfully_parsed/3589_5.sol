function getArrayData() constant returns (bytes32[] _data1, bytes32[] _data2) {

    bytes32[] memory arrData1 = new bytes32[](5);
    bytes32[] memory arrData2 = new bytes32[](5);

    arrData1[0]='Data 1 - 1';
    arrData1[1]='Data 1 - 2';
    arrData1[2]='Data 1 - 3';
    arrData1[3]='Data 1 - 4';
    arrData1[4]='Data 1 - 5';

    arrData2[0]='Data 2 - 1';
    arrData2[1]='Data 2 - 2';
    arrData2[2]='Data 2 - 3';
    arrData2[3]='Data 2 - 4';
    arrData2[4]='Data 2 - 5';

    return (arrData1, arrData2);
 }
