function callFunction(bytes calldata _data){

Struct1Type memory data1 = abi.decode(_data, (Struct1Type));
}


function callFunction(bytes calldata _data){

Struct1Type memory data1, Struct2Type memory data2 = abi.decode(_data, (Struct1Type,Struct2Type));
}
