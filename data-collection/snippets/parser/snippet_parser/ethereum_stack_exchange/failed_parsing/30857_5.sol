function foobar5(address a, uint[] _x) public {
    Bar memory b;
    b.owner = a;
    bars.push(b);

    Bar storage c = bars[bars.length - 1]; 
    for (uint i = 0; i < _x.length; i++) {
        c.x.push(_x[i]);
  }
