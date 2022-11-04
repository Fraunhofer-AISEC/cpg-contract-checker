contract InsanFactory{

  struct Accenture{
    uint id;
    string name;
    uint salary;
  }


  mapping (address=>Accenture) public accemployee;

  constructor(uint _id,string  name,uint _salary){
    accemployee[msg.sender] = setter(uint _id,string name,uint _salary);
    accemployee[msg.sender] = Accenture(uint _id,string name,uint _salary);

  }

  Accenture[] public acc;

  function setter(uint _id,string memory _name,uint _salary) public {
   
    Accenture memory a  = Accenture(_id,_name,_salary);
    acc.push(a);
    acc[0].id = 2;
  }
