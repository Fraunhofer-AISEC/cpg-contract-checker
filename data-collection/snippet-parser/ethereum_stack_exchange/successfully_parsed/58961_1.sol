interface PracticeContractFacade {
    function setName(string _name) public;
    function setAge(uint _age) public;
    function getName() public view returns(string);
    function getAge() public view returns(uint);
    function loan() external returns(bool);
    function deposit(uint amount) public;
    function withdraw(uint amount) public;
    function balance() view public returns(uint);
}
