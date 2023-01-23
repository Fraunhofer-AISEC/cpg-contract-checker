
uint i = mem_arr.length;


assembly { mstore(mem_arr, add(mload(mem_arr), 1)) }


mem_arr[i] = value;
