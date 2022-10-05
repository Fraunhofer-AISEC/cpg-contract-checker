contract StructExample {

    struct MyStruct {
        bool isMyStruct;
        uint amount;
        address[3] addressList;
        bytes32 name;
    }

    
    MyStruct myStruct;

    function StructExample(
        uint amount, 
        address address1, 
        address address2, 
        address address3,
        bytes32 name) 
    {
        myStruct.isMyStruct = true;
        myStruct.amount = amount;
        myStruct.addressList = [address1, address2, address3];
        myStruct.name = name;
    }

    function getMyStruct() 
      constant
      returns(
          bool isMyStruct,
          uint amount,
          address[3] addressList,
          bytes32 name)
    {
        return (
            myStruct.isMyStruct, 
            myStruct.amount, 
            myStruct.addressList, 
            myStruct.name);
    }
}
