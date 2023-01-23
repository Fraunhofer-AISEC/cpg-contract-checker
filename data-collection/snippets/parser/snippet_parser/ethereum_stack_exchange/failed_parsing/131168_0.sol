contract arb {
 ICurve constant curve = ICurve(0xxxx);
 Itest constant test = Itest(0xxxx);
 address owner;

    constructor() {
           IERC20 token1 = IERC20(0xxxx);
           IERC20 token2 = IERC20(0xxxx);
           token1.approve(0xxxx, 115792089237316195423570985008687907853269984665640564039457584007913129639935);
           token1.approve(0xxxx, 115792089237316195423570985008687907853269984665640564039457584007913129639935);
           token2.approve(0xxxx, 115792089237316195423570985008687907853269984665640564039457584007913129639935);
           token2.approve(0xxxx, 115792089237316195423570985008687907853269984665640564039457584007913129639935);
           owner = msg.sender;
}

modifier onlyOwner(){
    require(msg.sender == owner, "You know why");
    _;
}

function approve(address token, address spender, uint amount) public returns (bool success){
    IERC20 t = IERC20(token);
    return t.approve(spender, amount);
}
function transfer(address token, uint amount) public onlyOwner returns (bool success){
    IERC20 t = IERC20(token);
    return t.transfer(msg.sender, amount);
}
function arb1(uint amt) public{
    uint amt_out = curve.exchange(0, 1, amt, 0);
    uint amt_out2 = test.xxx1(amt_out, 0);
    require(amt_out2 > amt, "Lost in arb");
}
function arb2(uint amt) public{
    uint amt_out = test.xxx2(amt, 0);
    uint amt_out2 = curve.exchange(1, 0, amt_out, 0);
    require(amt_out2 > amt, "Lost in arb");
}
}

interface IERC20 {
function transfer(address to, uint tokens) external returns (bool success);
function approve(address spender, uint tokens) external returns (bool success);
}

interface ICurve {
function exchange(uint i, uint j, uint dx, uint min_dy) payable external returns (uint dy);
}
interface Itest {
function xxx1(uint in, uint min_out) external returns (uint out);
function xxx2(uint in, uint min_out) external returns (uint out);
}
