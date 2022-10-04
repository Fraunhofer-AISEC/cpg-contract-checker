contract FixedInvalidOpcode {

    enum Dir {UP, LEFT, DOWN, RIGHT}
    Dir public currentDir;

    function changeDir(uint8 newDir) public {
        require(newDir <= uint8(Dir.RIGHT), "Out of range");
        currentDir = Dir(newDir);
    } 

}
