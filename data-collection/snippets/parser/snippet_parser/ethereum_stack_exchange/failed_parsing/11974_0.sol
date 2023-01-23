mapping(uint => uint) array;
uint value   = 10;

array[0] = value;              

array[1] = array[0]'s_address; //I do want [1] to point same memory location as [0] without creating new memory space. 
//or
uint value_addr;
assembly { value_addr := value }
array[1] -> value_addr; //if possible, at this stage array[1] should also point to the value's memory space.

array[0] -> NULL; 
