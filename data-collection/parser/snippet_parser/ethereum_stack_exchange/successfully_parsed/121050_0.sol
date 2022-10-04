uint[] public arr;

function modifyArray(uint[] memory _arr) public {
  arr=_arr;
}

function remove(uint num) public {
  
  
    for(uint i=0;i < arr.length; i++){
      
      if(arr.length ==1 || i+1 == arr.length) {
        arr.pop();
      }

       else {
         arr[i] = arr[i +1];
         arr.pop();
       }

    }
  
}
