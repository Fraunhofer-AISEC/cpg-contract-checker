
pragma solidity 0.8.9;

contract main{
    struct Data { 
        string identifier;       
        uint num1;
        uint num2;
        uint num3;
    }

    mapping(string => Data[]) public data;

    

    
    function pushData(Data[] calldata _data) public {
        for(uint i=0; i<_data.length; i++){ 
            data[_data[i].identifier].push(_data[i]);
        }
    }
}
