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
contract extra{
   bool public retrive;
   bool public retrive_setter;
   address public baseaddress = 0xca598f876f79a5f8f479bfa1dcc8f4f2dffbd5c2;
   uint a = 5;
   bytes32 b ="Lina";
   function caller(){
        retrive = baseaddress.call.gas(10000)(bytes8(keccak256("getdata()")));
        retrive_setter = baseaddress.call.gas(1000000)(bytes24(keccak256("setdata(uint, bytes32)")),a,b);
   }
}
