contract Fibonacci {
    function fibonacciIndirect(uint32 n) public view returns(uint32) {
        if (n == 0 || n == 1) {
            return n;
        }
        uint32 n1;
        uint32 n2;
        n1 = Fibonacci(this).fibonacciIndirect(n - 1);
        n2 = Fibonacci(this).fibonacciIndirect(n - 2);
        return n1 + n2;
    }
}
