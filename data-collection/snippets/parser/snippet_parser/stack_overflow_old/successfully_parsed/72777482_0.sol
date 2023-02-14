contract Fibonacci {
    function fibonacci(uint32 n) public pure returns(uint32) {
        if (n == 0 || n == 1) {
            return n;
        }
    
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}
