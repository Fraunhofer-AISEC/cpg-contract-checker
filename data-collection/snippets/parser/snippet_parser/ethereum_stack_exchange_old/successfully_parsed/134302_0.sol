    function firstdigit(uint256 number) public pure returns (uint256) {
        uint256 num = number;
        uint256 first = num / 10;
        return first;
    }
