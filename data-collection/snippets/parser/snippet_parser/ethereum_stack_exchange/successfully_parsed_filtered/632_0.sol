contract MultiReturner {
    function getData() constant returns (bytes32, bytes32) {
        bytes32 a = "abcd";
        bytes32 b = "wxyz";
        return (a, b);
    }

    function getDynamicData() constant returns (bytes, bytes) {
        bytes a;
        a.push('a');
        a.push('b');
        a.push('c');
        bytes b;
        b.push('x');
        b.push('y');
        b.push('z');
        return (a, b);
    }
}
