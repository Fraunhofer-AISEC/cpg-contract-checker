Don’t forget the memory used, which is 3 gas per byte:
MemoryGas        uint64 = 3    
Wait what? It costs only 8 gas per byte of log data? That’s 256 gas for 32 bytes, and 96 gas for the memory use. So 322 gas versus 20000 gas for storing the same amount of data in storage, only 1.7% of the cost!
