import "./parentContract.sol"

contract childContract is parentContract {
    

    function getNum2() public view returns(uint) {
        return num;
    }
    function getNum3() public view returns(uint) {
        return getNum();
    }
    function getNum4() public view returns(uint) {
        return parentContract.getNum();
    }
}
