contract InsanFactory{

    struct Accenture{ uint id; string name; uint salary; }
    mapping (address=>Accenture) public accemployee;

    Accenture[] public ACC;

    constructor(uint _id,string memory name,uint _salary){ 
        setter(_id, name, _salary);
        accemployee[msg.sender] = Accenture(_id, name, _salary);
    }

    function setter(uint _id,string memory _name,uint _salary) public {
        Accenture memory a  = Accenture(_id,_name,_salary);
        acc.push(a);
        acc[0].id = 2;
    }
}
