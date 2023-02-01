contract PureMem{
    uint[] public arr=[1,2,3,4];
    function Mem() public view{
        uint[] memory arrm=arr;
        arrm[1]=192;    
     }
}
