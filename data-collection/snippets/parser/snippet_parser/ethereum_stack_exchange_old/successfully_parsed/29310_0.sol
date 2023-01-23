pragma solidity ^0.4.11;

contract Customer {

function Customer() public{}

struct CustomerData {
    address custAddress;
    bytes32 customerName;
    bytes32 physicalAddr1;
    bytes32 physicalAddr2;
    bytes16 physicalCity;
    bytes8 physicalState;
    bytes8 physicalZipCode;
    bytes8 physicalCountry;
    int CreditLimit;  
    int CreditBalance;  

    
    
    mapping(address=>Billto) billto;
    mapping(address=>Shipto) shipto;
    bool isEntity; 
}

struct Billto {
    address BilltoAddr;
    bytes32 BilltoName;
    bytes32 physicalAddr1;
    bytes32 physicalAddr2;
    bytes16 physicalCity;
    bytes8 physicalState;
    bytes8 physicalZipCode;
    bytes8 physicalCountry;
    bool isEntity;


}

struct Shipto {
    address ShiptoAddr;
    bytes32 ShiptoName;
    bytes32 physicalAddr1;
    bytes32 physicalAddr2;
    bytes16 physicalCity;
    bytes8 physicalState;
    bytes8 physicalZipCode;
    bytes8 physicalCountry;
    bool isEntity;
}

    mapping(address => CustomerData) public customers;
    event addNewCustomer (address indexed CustAddr, bytes32 indexed CustName) ;  
    event addBillto(address indexed CustAddr, address indexed BillAddr, bytes32 Name, bytes32 Addr1, bytes32 Addr2, bytes16 City, bytes8 State, bytes8 Zip, bytes8 Country) ; 
    event addShipto(address indexed CustAddr, address indexed ShipAddress, bytes32 Name, bytes32 Addr1, bytes32 Addr2, bytes16 City, bytes8 State, bytes8 Zip, bytes8 Country) ; 


function newCustomer(address CustAddr, bytes32 Name, bytes32 Addr1, bytes32 Addr2, bytes16 City, bytes8 State, bytes8 Zip, bytes8 Country) public {

    customers[CustAddr].custAddress = CustAddr;
    customers[CustAddr].customerName = Name;
    customers[CustAddr].physicalAddr1 = Addr1;
    customers[CustAddr].physicalAddr2 = Addr2;
    customers[CustAddr].physicalCity = City;
    customers[CustAddr].physicalState = State;
    customers[CustAddr].physicalZipCode = Zip;
    customers[CustAddr].physicalCountry = Country;
    customers[CustAddr].CreditLimit = 0;
    customers[CustAddr].CreditBalance = 0;
    customers[CustAddr].isEntity = true;
    addNewCustomer(CustAddr, Name);

}

function newBillto(address CustAddr, address BillAddr, bytes32 Name, bytes32 Addr1, bytes32 Addr2, bytes16 City, bytes8 State, bytes8 Zip, bytes8 Country) public returns (string confirmed) {

        customers[CustAddr].billto[BillAddr].BilltoAddr = BillAddr;
        customers[CustAddr].billto[BillAddr].BilltoName = Name;
        customers[CustAddr].billto[BillAddr].physicalAddr1 = Addr1;
        customers[CustAddr].billto[BillAddr].physicalAddr2 = Addr2;
        customers[CustAddr].billto[BillAddr].physicalCity = City;
        customers[CustAddr].billto[BillAddr].physicalState = State;
        customers[CustAddr].billto[BillAddr].physicalZipCode = Zip;
        customers[CustAddr].billto[BillAddr].physicalCountry = Country;
        customers[CustAddr].billto[BillAddr].isEntity = true;
        confirmed = "Bill to address added";
        addBillto(CustAddr, BillAddr, Name, Addr1, Addr2, City, State, Zip, Country);




}
  
function newShipto(address CustAddr, address ShipAddr, bytes32 Name, bytes32 Addr1, bytes32 Addr2, bytes16 City, bytes8 State, bytes8 Zip, bytes8 Country) 
public returns (string confirmed) {

        customers[CustAddr].shipto[ShipAddr].ShiptoName = Name;
        customers[CustAddr].shipto[ShipAddr].physicalAddr1 = Addr1;
        customers[CustAddr].shipto[ShipAddr].physicalAddr2 = Addr2;
        customers[CustAddr].shipto[ShipAddr].physicalCity = City;
        customers[CustAddr].shipto[ShipAddr].physicalState = State;
        customers[CustAddr].shipto[ShipAddr].physicalZipCode = Zip;
        customers[CustAddr].shipto[ShipAddr].physicalCountry = Country;
        addShipto(CustAddr, ShipAddr, Name, Addr1, Addr2, City, State, Zip, Country);
        return "Shipto added.";

}    


function adjustCreditLimit(address CustAddr, int newLimit)public returns (string confirmed){
    customers[CustAddr].CreditLimit = newLimit;    
    confirmed = "Customer credit limit changed";
    }    


}
