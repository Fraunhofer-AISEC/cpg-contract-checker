function storevalueincontract(uint _index, uint _value) public{
    simplestorage con = cons[_index];
    con.store(_value);
}


function viewvaluestoredinacontract(uint _index) public view returns(uint){
    simplestorage con= simplestorage(cons[_index]);
    return con.retrieve();    
}
