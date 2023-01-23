function combinations(uint[] memory arr, uint len, uint8 startPosition, uint[8] memory result,address addressFrom) private {

 if (len == 0) {
     entry[addressFrom].push(result); 
     return;
 }       
 for (uint8 i = startPosition; i <= arr.length-len; i++){
     result[result.length - len] = arr[i];
     combinations(arr, len-1, i+1, result, addressFrom);
 }
}      
