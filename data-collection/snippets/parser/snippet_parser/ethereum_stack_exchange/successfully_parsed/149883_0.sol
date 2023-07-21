   function _gcd(uint256 a, uint256 b) external pure returns (uint256) {
        uint256 _a = a;
        uint256 _b = b;
        uint256 temp;
        while (_b > 0) {
            temp = _b;
            _b = _a % _b; 
            _a = temp;
        }
        return _a;
    }
