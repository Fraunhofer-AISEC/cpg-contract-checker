    function returnplayers() external view returns(address[],uint[],uint[],uint[],uint[],uint[],uint[]) {

    address[] memory addrs = new address[](count);
    uint[]   memory balls_a = new uint[](count);
    uint[]   memory balls_b = new uint[](count);
    uint[]   memory balls_c = new uint[](count);
    uint[]   memory balls_d = new uint[](count);
    uint[]   memory balls_e = new uint[](count);
    uint[]   memory balls_mega = new uint[](count);

    for (uint i = 0; i < count; i++) {
        Users memory user = users[i];
        addrs[i] = user.player;
        balls_a[i] = user.no1;
        balls_b[i] = user.no2;
        balls_c[i] = user.no3;
        balls_d[i] = user.no4;
        balls_e[i] = user.no5;
        balls_mega[i] = user.no6;
    }

    return (addrs, balls_a, balls_b, balls_c, balls_d, balls_e, balls_mega);
}
