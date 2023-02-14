contract mycontract{

    struct userData {
        string lastName;
        string name;
    }


    mapping(uint => userData) private costumers;

    function  setUserData(string _lastname, string _name, uint256 _id) public{
        costumers[_id].lastName = _lastname;
        costumers[_id].name = _name;
    }

    function  getUserData(uint256 _id) public view returns (string, string) {
        return (costumers[_id].lastName,costumers[_id].name);
    }

}
