pragma solidity ^0.4.11;

contract APSPBenchmark is usingOraclize {

    event OraclizeEvent0(string desc);        
    event OraclizeEvent1(string desc, int[] apsp);

    int constant INF = -1;

    function APSPBenchmark() public payable {}    

    
    function localAPSP(int[] w) public {

        int[] memory apsp  = allPairsShortestPath(w);

        OraclizeEvent0("local");
        
    }

    
    function allPairsShortestPath(int[] w) private constant returns(int[]) {
        uint i; uint j; uint k;
        uint n = babylonian(w.length);
        int[] memory d = new int[](n * n);

        for (i = 0; i < n; ++i) {
            for (j = 0; j < n; ++j) {
                d[i * n +j] = (w[i * n + j] >= 100 ? INF : w[i * n + j]);
            }   
            d[i * n + i] = 0;
        }

        for (k = 0; k < n; ++k) {
            for (i = 0; i < n; ++i) {
                for (j = 0; j < n; ++j) {
                    if (d[i * n + k] == INF || d[k * n + j] == INF) continue;
                    else if (d[i * n + j] == INF) d[i * n + j] = d[i * n + k] + d[k * n + j];
                    else d[i * n + j] = min(d[i * n +j], d[i * n + k] + d[k * n + j]);
                }
            }
        }

        return d;
    }

    
    function min(int a, int b) private constant returns(int)  {
        return a < b ? a : b;
    }    

    
    function babylonian(uint n) private constant returns(uint) {
        uint x = n;
        uint y = 1;
        while (x > y) {
            x = (x + y) / 2;
            y = n / x;
        }
        return x;
    }
}
