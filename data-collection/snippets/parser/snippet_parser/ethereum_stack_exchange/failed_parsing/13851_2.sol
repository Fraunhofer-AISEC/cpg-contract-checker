contract Child{

    uint8 public age = 1;


    function birthDay() { <-- gas used: 26933 
        age = age + 1;
    }

    function nextYearIllBe() constant returns (uint8){
        return age + 1;
    }


    function newBirthDay() { <-- gas used 26991
        age = nextYearIllBe();
    }
}
