uint256[4] public arr;

constructor() public {
    arr[0] = 11;
    arr[1] = 22;
    arr[2] = 33;
    arr[3] = 44;
}

function func(uint256 x) public view returns (uint256) {
    if (x < arr.length)
        return handle(x, viewFunc);
    return handle(x, pureFunc);
}

function handle(uint256 x, function (uint256) view returns (uint256) func) internal view returns (uint256) {
    return func(x);
}

function viewFunc(uint256 x) internal view returns (uint256) {
    return arr[x];
}

function pureFunc(uint256 x) internal view returns (uint256) {
    this;
    return x * 2;
}
