function pow(uint n, uint e) public pure returns (uint) {
    
    if (e == 0) {
        return 1;
    } else if (e == 1) {
        return n;
    } else {
        uint p = pow(n, e.div(2));
        p = p.mul(p);
        if (e.mod(2) == 1) {
            p = p.mul(n);
        }
        return p;
    }
}
