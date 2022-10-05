contract Cast {

    bytes [] public arr;
    string public st = "Hello";

    function convertInternalString() public {
        this.convertExternalString(st);
    }

    function convertExternalString(string calldata str) public {
        bytes calldata bts =bytes(str);
        for(uint i; i<bts.length; i++){
            arr.push(bts[i:i+1]);
        }
    }

}
