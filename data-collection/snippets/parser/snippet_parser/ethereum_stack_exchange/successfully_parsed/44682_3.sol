contract A {
    address public my_address;

    function A() {
        my_address= this;
    }
}

contract B is A {
    function B() {
      
    }
} 
