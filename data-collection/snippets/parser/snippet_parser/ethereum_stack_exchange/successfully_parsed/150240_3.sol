contract C is B {
    address me;
     
     constructor(address _me, string memory _name, uint _num)B(_name,_num);
}
