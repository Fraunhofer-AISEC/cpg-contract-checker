pragma solidity ^0.4.24;
contract DeployedContract {

    struct emailNetworkLists {
         bytes32[] emailArray;
    }

    struct Namecards{
        address ethAddress;
        bytes32 personName;
        bytes32 designation;
        bytes32 companyName;
        bytes32 comaddress;
        bytes32 emailId;
        bytes32 mobNumber;
        bytes32 date;
        bool isActive;
        uint index;
        mapping(bytes32=> emailNetworkLists) contactList;
    }

    bytes32[] public addressList;
    mapping(bytes32 => Namecards) public nameStructMapping;

    function getEmails(bytes32 email, bytes32 date) public view returns(bytes32[]){
        return (nameStructMapping[email].contactList[date].emailArray);
    }

}

contract External {

    DeployedContract d;

    constructor() public {
        d = new DeployedContract();
    }

    function getEmailList(bytes32 email, bytes32 date) public view returns(bytes32[] ){
       return (d.getEmails(email, date));
    }
}
