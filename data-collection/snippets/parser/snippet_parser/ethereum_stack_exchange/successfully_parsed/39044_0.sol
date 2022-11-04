pragma solidity ^0.4.17;

contract test002 {

    address[] AddressList;

    event ItemAdded(address, address);


    function getItemCount() public view returns(uint) {return(AddressList.length);}
    function getItem(uint index) public view returns(address) {return(AddressList[index]);}

    function addItem(address inItem) public {
        AddressList[AddressList.length] = inItem;
        ItemAdded(this, inItem);
    }

}

contract test001 {

    address AA;

    event Creation(address, address);

    function test001() public {
        AA = new test002();

        Creation(address(this), AA);
    }

    function register() public {
        


        



        
        test002 A = test002(AA);
        A.addItem(address(this));
    }



}
