pragma solidity >=0.5.8 <0.6.0;

contract Test
{
    struct DataRow
    {
      bytes32  name ;
      uint256  value ;
    }

    mapping (bytes32 => DataRow)  Data ;


   constructor() public
   {
   }

   function ProcessData(bytes32  idx_) public
   {
      bytes32  name ;
      uint256  x ;

              (name, x)=GetData(idx_) ;

      if(name==bytes32(0x00))
      {
        
      } 
   }

    function GetData(bytes32  idx_) public view returns (bytes32, uint256 retVal)
    {
       return(Data[idx_].name, Data[idx_].value) ;
    }

}
