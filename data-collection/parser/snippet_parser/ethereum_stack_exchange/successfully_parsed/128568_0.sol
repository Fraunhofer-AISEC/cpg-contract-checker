contract Cast {

    bytes [] public arr;

    function convertExternalString(string calldata str) external{
        bytes calldata bts =bytes(str);
        for(uint i; i<bts.length; i++){
            arr.push(bts[i:i+1]);
        }
    }

}

