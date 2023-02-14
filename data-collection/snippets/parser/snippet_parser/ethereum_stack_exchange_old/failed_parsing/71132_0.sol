pragma solidity >=0.4.22 < 0.6.0;
pragma experimental ABIEncoderV2;

contract BloodDonationProcess {
    struct LongTermInformation {
        bool allergies;
        bool diabetes;
        bool piercing;
        bool gay;
        bool transfusionRelatedAcuteLungInjury;
        bool drugs;
        bool cancer;
    }
    struct ShortTermInformation{
        bool childBirth;
        bool cholestrol;
        bool dentist;
        bool soreThroat;
        bool tickBite;
        bool cold;
        bool vaccination;
    }
    struct Person{
        string name;
        uint age;
        uint weight;
        LongTermInformation longTermInformation;
        ShortTermInformation shortTermInformation;
     }

    mapping (address => Person)person;
     Person tempPerson;

    constructor(string memory name,uint age,uint weight,LongTermInformation 
 memory longTermInformation,
     ShortTermInformation memory shortTermInformation) public {
         tempPerson.name =name;
         tempPerson.age=age;
         tempPerson.weight =weight;
         tempPerson.longTermInformation =longTermInformation;
         tempPerson.shortTermInformation =shortTermInformation;
     }


     ShortTermInformation public shortTermInformation;
     LongTermInformation public longTermInformation;

     BloodDonationProcess bloodDonationProcess;


    function canDonate(Person memory p) public returns(bool) {
          return ((!p.longTermInformation.drugs) && (!p.longTermInformation.gay)) &&
         ((!p.shortTermInformation.soreThroat) && (!p.shortTermInformation.tickBite));
    }

    function _generateRandomNumber(Person memory p ) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(p.name)));
        return rand;
    }

}   
 ***this is the code I've written at the solidity remix and I've written the uinttest for that.***

pragma solidity >=0.4.22 <0.6.0;
import "./blood_donation_process.sol";

contract BloodDonationProcessUnitTest {

    BloodDonationProcess bloodDonationProcessToTest;
   function test (address account, uint age,string memory name,uint weight,LongTermInformation longTermInformation,ShortTermInformation shortTermInformation) public{
        tempPerson=person[_account];
        tempPerson.age=age;
        tempPerson.name=name;
        tempPerson.weight=weight;
        tempPerson.longTermInformation=longTermInformation;
        tempPerson.shortTermInformation=shortTermInformation;
    }


   function beforeAll () public {
        bloodDonationProcessToTest.shortTermInformation = ShortTermInformation(true,true,true,false,false,true,false);
        bloodDonationProcessToTest.longTermInformation = LongTermInformation(false,false,false,false,false,false,true);
        bloodDonationProcessToTest.personToTest = Person("Person1",25,75,shortTermInformation,longTermInformation);
        bloodDonationProcessToTest = new BloodDonationProcess(personToTest);
    }

    function shouldBeAbleToDonate() public {
        bool isAbleToDonate = bloodDonationProcessToTest.canDonate(personToTest);
        Assert.equal(isAbleToDonate,true);
    }
}
