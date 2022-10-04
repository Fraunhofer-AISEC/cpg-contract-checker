mapping1 (address => uint32[7]) mapping1;
mapping1 (address => uint32[7]) mapping2;

function myFunction() external view{

  uint foo = mapping1[msg.sender][1];
  uint bar = mapping2[mesg.sender][0];
  

  uint foobar = foo * bar;
  

}
    
