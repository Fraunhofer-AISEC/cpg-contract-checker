contract Jar
{
    uint[][] m = [[4, 6], [5, 7]];
    uint[] v = [9, 8];
    m.push(v);

    function v() public view returns (uint)
    {
        return m[0][1];
    }
}
