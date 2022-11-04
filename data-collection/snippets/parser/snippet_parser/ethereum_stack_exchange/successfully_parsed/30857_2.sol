function foobar2(address a, uint x0) public {
    Bar memory b;
    b.owner = a;
    bars.push(b);
    
    bars[bars.length - 1].x.push(x0); 
}
