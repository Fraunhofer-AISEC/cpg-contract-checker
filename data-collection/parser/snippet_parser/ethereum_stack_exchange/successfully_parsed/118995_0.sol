import "@openzeppelin/contracts/utils/Strings.sol";

function myNum(uint256 _Num) public pure returns(string memory){
        return (Strings.toString(_Num));
    }
