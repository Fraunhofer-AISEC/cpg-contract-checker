pragma solidity >=0.4.0 <0.7.0;

contract DeleteExample {
    uint data = 10;
    uint[] array;

    function f() public {
        uint x = data;                              
        delete data;                                
        require(x == 10, "it was affected.");
        x = data;                                   
        require(x == 0, "it was not deleted.");
    }

    function g() public {
        uint[] storage mem = array;                 
        array.push(1);
        array.push(11);
        array.push(21);
        require(mem.length == 3, "not three elements.");
        require(mem[0]==1, "not one.");
        require(mem[1]==11, "not eleven.");
        require(mem[2]==21, "not twenty-one.");
        delete array[1];                            
        require(mem[1]==0, "element not gone.");    
    }
}
