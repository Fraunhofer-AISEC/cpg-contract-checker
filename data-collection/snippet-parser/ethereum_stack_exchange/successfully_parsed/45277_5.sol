pragma solidity 0.4.21;

contract Base{
    uint public data1;
    bytes32 public data2;

    function setdata(uint a, bytes32 b){
        data1 = a;
        data2 = b;
    }
    function getdata() public view returns(uint){
        return data1 ;
    }

}

contract Extra {
   uint public data;
   Base public baseaddress = Base(0xca598f876f79a5f8f479bfa1dcc8f4f2dffbd5c2);

   function caller(){
        data = baseaddress.getdata();
   }

   function setter(uint _integer, bytes32 _bytes) {
       baseaddress.setdata(_integer, _bytes);
   }
}
