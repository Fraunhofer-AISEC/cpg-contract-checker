pragma solidity 0.6.3;

contract InvalidOpcode {

    enum Dir {UP, LEFT, DOWN, RIGHT}
    Dir public currentDir;

    function changeDir(Dir newDir) public {
        require(uint8(newDir) <= uint8(Dir.RIGHT), "Out of range");
        currentDir = newDir;
    } 

}
