pragma solidity <0.9.0;

contract Storage {
    uint data;

    function set(uint x) public {
        data = x;

        uint test = 2;
        test = data;
    }

    function get() public view returns (uint) {
        return data;
    }
}
