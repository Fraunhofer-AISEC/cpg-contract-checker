mapping (address => uint) public balances;
address[] public addressLUT;


function size() public returns (uint) {
    return addressLUT.length;
}
