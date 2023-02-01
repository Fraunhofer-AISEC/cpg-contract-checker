
pragma solidity 0.8.17;

contract Recurse {

    function recurse(uint256 depth) external {

        
        uint256 placeHolder1 = 1;
        uint256 placeHolder2 = 2;
        uint256 placeHolder3 = 3;

        if(depth > 0) {
            this.recurse(depth - 1);
        }
    }
}
