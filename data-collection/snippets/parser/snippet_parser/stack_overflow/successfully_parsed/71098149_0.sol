interface FunctionsInterface {

    function addPerson (uint, string memory, string memory,uint ) external;

    function askPerson(uint) external view returns (uint, string memory, string memory, uint);
}
