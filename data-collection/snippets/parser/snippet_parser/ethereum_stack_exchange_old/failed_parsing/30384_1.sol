function addScalar(int[] self, int a) public pure returns (int[] s) {

    
    s = new int[](self.length);

    for (uint i = 0; i < self.length; i++)
        s[i] = self[i] + a;
    }
}
