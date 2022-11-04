cocontract fixedsizeArray{

    uint[5] public arr= [10,19,15,78,56];

    function array() public view  returns(int){
            uint odd;
            odd = arr[3];
            return odd;

    }
}
