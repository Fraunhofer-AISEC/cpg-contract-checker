 function findIt(uint [] storage numb, uint value) public view returns(uint){
      for (uint i = 0; i < numb.length; i++)
           if (numb[1] == value)
                return i;
 }  
