contract test {

    struct A {
      uint8[3] a;
    }

    A a = A([1,2,3]); 

    function getb() returns(uint8[3] whatWeGot) {
        return a.a;
    }
}
