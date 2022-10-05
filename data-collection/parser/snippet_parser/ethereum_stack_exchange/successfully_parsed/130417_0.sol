contract SimpleContract
{
    string public  name ;
    uint counter = 0;

    event myEvent(uint id , string name);

    function setName(string memory _name) public
    { 
      name = _name ;    
      counter++;

      emit myEvent(counter , _name);
    } 

} 
