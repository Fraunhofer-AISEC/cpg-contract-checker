contract A {
    address public my_address;

    function A(address _val) {
        my_address= _val;
    }
}

contract B is A {
    function B() {
        A(this);
    }
} 
