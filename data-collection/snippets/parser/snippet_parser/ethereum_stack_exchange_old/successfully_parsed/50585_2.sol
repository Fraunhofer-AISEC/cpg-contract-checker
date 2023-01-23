contract ContractName{
    uint public count=0;
    struct Thedata{
        uint id;
        string name;
    }
    Thedata[] Bro;

    function createThedata(Thedata memory dataBro) public{
        Bro.push(dataBro);
    }
}
