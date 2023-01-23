contract suu{

    uint public value;

    function sums( uint a,uint b) public view returns(uint){
         uint result=a+b;
       return result;
    }
}