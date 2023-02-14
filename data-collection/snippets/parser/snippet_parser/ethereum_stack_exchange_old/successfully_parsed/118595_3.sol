pragma solidity ^0.4.4;

contract Test{
   string data;
   uint stringLimit;

   function setVariable(string str)  {
      bytes memory strBytes = bytes(str);
      if(strBytes.length >= stringLimit)
          revert;
      else 
         data = str;
    }
}
