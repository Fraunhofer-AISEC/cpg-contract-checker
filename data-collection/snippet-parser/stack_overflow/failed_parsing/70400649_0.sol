contract MyContract {
    string YourName = "Jeff";
    string LName;
    string Date;

    function getDate() public view returns(string) {
        return Date;
    }

    function getLastName() public view returns(string) {
        return LName;
    }

    function getName() public view returns(string) {
        return YourName;
    }

    function setLastName(string _LName) public returns(string) {
        LName = _LName;
    }

    function setDate(string _Date) public returns(string) {
        Date = _Date;
    }

    function setName(string _YourName) public {
        YourName = _YourName;
    }

    function doMath() public {

        int answer;
        function getSum(int num1, int num2) public {
            answer = num1 + num2;
        }
        function getDifference(int num1, int num2) public {
            answer = num1 - num2;
        }
        function getProduct(int num1, int num2) public {
            answer num1 * num2;
        }
        function getQuotient(int num1, int num2) public {
            answer = num1 / num2;
        }
        function getMod(int num1, int num2) public {
            answer =  num1 % num2;
        }

        return answer;
    }

}
