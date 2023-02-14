function mod(uint8[2] x, uint8[2] m) returns(uint8[2])
{
    
    if (compa(m, [0, 0]) == 0)
        throw;
    if (compa(x, [0, 0]) == 0)
        return x;
    if (compa(m, x) == 0)
        return [0, 0];
    if (compa(m, x) == 1)
        return x;

    uint8[2] memory r = x;
    uint8[2] memory n = m;

    
    while (compa(x, n) == 1 && n[n.length-1] & 0x80 != 1)
        n = shift(n, 1);
    if (compa(n, x) == 1)
        n = shift(n, -1);

    
    while (compa(r, m) != -1)
    {
        (r,) =  sub(r, n);
        n =     shift(n, -1);
    }
    return r;
}
