contract B {
    
    function getsize() public view returns (uint) {
        A contr = A(addressOfA);
        uint size = contr.MyArray.length;
        return size;
    }
} 
