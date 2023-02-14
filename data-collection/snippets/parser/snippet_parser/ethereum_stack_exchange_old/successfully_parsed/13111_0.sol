   contract changeName{
    string customerName;

    function changeName(string _customerName)
       {
          customerName=_customerName;
       }

    function getName() returns(string)
       {

         return customerName;
       }
    }
