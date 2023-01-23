function foo(uint256 _a, uint256 _b, uint256 _c) {
    require(map[msg.sender].a == 1);
    require(map[msg.sender].b < 1);
    require(map[msg.sender].c > 1);

    deposits[msg.sender].a = _a;
    deposits[msg.sender].b = _b;
    deposits[msg.sender].c = _c;
}
