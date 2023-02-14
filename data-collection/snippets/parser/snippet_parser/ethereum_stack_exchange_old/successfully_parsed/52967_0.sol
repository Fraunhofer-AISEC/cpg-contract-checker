contract B {
    event eventFallback();
}

contract A {
    address contractB;

    function () public payable {
         emit B(contractB).eventFallback();
    }
}
