struct A
{
    uint[] values;
    uint256 value2;
}

contract Test
{
    A public a;

    
    function a() public view returns(uint256 value2) {
       value2 = a.value2;
    }; 
}
