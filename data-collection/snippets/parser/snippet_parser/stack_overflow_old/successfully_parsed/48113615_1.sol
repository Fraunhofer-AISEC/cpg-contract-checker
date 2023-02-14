function testLoop(uint256 num) external view returns(uint256 res) {
        uint256 i=0;
        uint256 cnt=0;

        for(i;i<num;i++) {
            cnt++;
        }

        return cnt;
    }
