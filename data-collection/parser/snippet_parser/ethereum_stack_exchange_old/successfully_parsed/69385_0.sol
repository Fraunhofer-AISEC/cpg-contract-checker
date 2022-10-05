contract EtheremonLite {
    function initMonster(string _monsterName) public;
    function battle() public returns(uint256);
    function getName(address _monsterAddress) public view returns(string);
    function getNumWins(address _monsterAddress) public view returns(uint);
    function getNumLosses(address _monsterAddress) public view returns(uint);
}
