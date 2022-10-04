contract Guarded {
     ...

     bool locked = false;

     function withdraw() external {
         require(!locked, "Reentrant call detected!");
         locked = true;
         ... 
         locked = false;
    }
}
