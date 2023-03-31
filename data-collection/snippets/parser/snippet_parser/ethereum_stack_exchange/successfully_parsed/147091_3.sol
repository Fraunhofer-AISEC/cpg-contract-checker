struct A
{
    uint256[] values;
}

contract TestA
{
    A a;

    function set(uint256 _b) external {
        a.values.push(_b);
    }
    function get() external view returns(A memory) {
        return a;
    }
}
