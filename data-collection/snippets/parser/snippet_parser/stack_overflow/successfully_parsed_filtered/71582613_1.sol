    function freqOfMaxNum(uint256[] memory arr)
        public
        pure
        returns (uint256, uint256)
    {
        uint256 max = 0;
        uint256 frequenceOfMax = 0;

        for (uint256 i = arr.length - 1; i > 0; i--) {
            if (arr[i] > max) {
                max = arr[i];
                frequenceOfMax = 1;
            } else if (arr[i] == max) {
                frequenceOfMax++;
            }
        }

        return (max, frequenceOfMax);
    }
