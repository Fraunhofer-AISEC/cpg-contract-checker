function retrieveProducer(string _input) public returns(string) 
{
    string memory s1 = _input;
    string memory s2;
    string  memory s3;
    bytes memory s1bytes = bytes(_input);
    uint index = 0;
    uint totallength = BCServiceList.length;
    uint paramNumber = 0;
    while(s1bytes.length != 0)
    {
       (s2,s1) = splitString(s1,";");
        paramNumber = paramNumber.add(1);
       s1bytes = bytes(s1);
    }
    string[] memory localStringArray= new string[](paramNumber); 
    
}
