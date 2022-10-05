contract DomainObjectDataContract {

struct DomainObject {
    string field1;
    string field2;
    bool field3;
    uint field4;
    Status field5;
}

enum Status {PROPOSED, VOTED, CONFIRMED}





/arrays
DomainObject[] public entities;



mapping (bytes32 => uint) public mapping1;
mapping (bytes32 => uint[]) public mapping2;
mapping (bytes32 => uint[]) public mapping3;



}

contract DomainObjectActionsContract {

DomainObjectDataContract domainObjectDataContract;


function DomainObjectActionsContract(address _DomainObjectDataContract) {
    domainObjectDataContract = DomainObjectDataContract(_DomainObjectDataContract);
}


function function1(...) returns (...)
function function2(...) returns (...)
function function3(...) returns (...)
function function4(...) returns (...)
function function5(...) returns (...)

}
