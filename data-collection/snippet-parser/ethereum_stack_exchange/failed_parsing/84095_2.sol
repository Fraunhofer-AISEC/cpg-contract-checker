contract IERC20Extented is IERC20 {
    function decimals() public view returns (uint8);
}

contract MyContract {
    IERC20Extented private token;

    constructor(IERC20Extented _token) public {
        token = _token;
    }

    ...
}
