contract X{

   uint256 public x=2;
   uint256[] public array= [9,8];
   
   function X(){}
   
   function getLength() public constant returns(uint256){
      return array.length;
   }
   
   function modifyArray( uint256 _index, uint256 _value){
      array[_index]= _value;
   }
   
   function popLength(){
      array.length--;
   }
}
