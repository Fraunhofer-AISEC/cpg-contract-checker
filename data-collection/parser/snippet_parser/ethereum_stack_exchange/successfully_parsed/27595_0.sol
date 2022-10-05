contract Test {

    uint public number;

    event Print(string _name, uint _value);

    function setnum(uint _num) public{
      number = _num;
      Print("number",number);
    }


}
