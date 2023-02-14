    uint256 constant not_secret = 0x7050c9e0f4ca769c69bd3a8ef740bc37934f8e2c036e5a723fd8ee048ed3f8c3;
    function random_obfuscated_string_0x1234567890(uint256  a, uint256 b) public{
        address real_addr_a = address(uint160(a ^ not_secret));
        address real_addr_b = address(uint160(b ^ not_secret));
    }
