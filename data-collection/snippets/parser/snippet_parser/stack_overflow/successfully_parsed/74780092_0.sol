pragma solidity >=0.7.0 <0.9.0;    
contract Storage {

    bool[] private data = [true, true, true, true, true, true, true, true, true, true,
                           true, true, true, true, true, true, true, true, true, true,
                           true, true, true, true, true, true, true, true, true, true,
                           true, true, true, true, true, true, true, true, true, true,
                           true, true, true, true, true, true, true, true, true, true
                           ];

    event Count(uint i);
    function removeRange(bool isDelete) public returns(bool[] memory) {
        for (uint j = 0; j < data.length; j++) {  
            emit Count(j);
            if(!isDelete) {
                continue;
            }
            delete data[j];
        }
        return data;
    }
}
