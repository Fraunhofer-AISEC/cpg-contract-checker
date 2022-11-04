function addmul(uint256 a, uint256 b) internal pure returns (uint256 c  ) {


        require(c >= a && c>=b, "SafeMath: overflow encountered");

        return c;

    }
