
pragma solidity 0.8.4;

contract Contract {
    
    function filternEven(uint[] memory arr) external pure returns(uint[] memory a){
          for(uint i=0;i<arr.length;i++){
            if(arr[i] % 2 == 0){
                a.push(arr[i]);
            }
        }
    }
}
