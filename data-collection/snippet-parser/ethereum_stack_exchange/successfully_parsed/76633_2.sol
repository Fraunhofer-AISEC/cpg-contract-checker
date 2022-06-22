function fib(uint n) public view returns(uint) { 
    if (n <= 1) {
       return n;
    } else {
       return this.fib(n - 1) + this.fib(n - 2);
    }
}
