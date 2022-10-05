Contract A{
function myFunc()internal view returns(bool){}
}

Contract B{
function someFunc(address AContractsAddress)internal payable {

bool check =  A(AContractsAddress).myfunc();

}

}
