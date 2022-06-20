function SortTESTER(address tokenAddress) public {
        tokenContract[tokenAddress].sortArray = [6, 9, 14, 15, 22, 439, 550, 1111, 1500, 1600];
    }

    function SortUserData(address tokenAddress, uint256 price) public view returns (uint256) {
        uint256 lengthVariable = tokenContract[tokenAddress].sortArray.length;
        uint256[] memory SortAlgo = new uint256[](lengthVariable);
        SortAlgo = tokenContract[tokenAddress].sortArray;
        uint256 x = lengthVariable / 2;
        uint256 tempDivision = x / 2;
        return FindSpotinArray(tempDivision, x, price, tokenAddress);
    }

function FindSpotinArray(
    uint256 tempDivision,
    uint256 x,
    uint256 price,
    address tokenAddress) public view returns (uint256) {
        uint256 lengthVariable = tokenContract[tokenAddress].sortArray.length;
        uint256[] memory SortAlgo = new uint256[](lengthVariable);
        SortAlgo = tokenContract[tokenAddress].sortArray;
        
        
        if(price < SortAlgo[x] && price < SortAlgo[x - 1] && price != SortAlgo[x]) {
            return FindSpotinArray(tempDivision / 2, x + tempDivision, price, tokenAddress);
        } else if (price > SortAlgo[x] && price > SortAlgo[x - 1] && price != SortAlgo[x]) {
            return FindSpotinArray(tempDivision / 2, x - tempDivision, price, tokenAddress);
        } else if (price == SortAlgo[x]) {
            return x;
        } else if (SortAlgo[x - 1] <= price && price <= SortAlgo[x]) {
            return x;
        }
    }

