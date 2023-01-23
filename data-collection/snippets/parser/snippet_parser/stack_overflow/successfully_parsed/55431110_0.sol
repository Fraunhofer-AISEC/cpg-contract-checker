pragma solidity ^0.4.17;
contract Prescribe {

struct Prescription {
        address patients_address;
        string medicament;
        string dosage_form;
        uint amount;
        uint date;
        
 }

mapping (address => Prescription[]) public ownerOfPrescription;
address [] public patients;

function createPrescription(address patients_address, string 
medicament, string dosage_form, uint amount, uint date) public  
restricted {

ownerOfPrescription[patients_address].push(Prescription({
     patients_address: patients_address,
     medicament: medicament,
     dosage_form: dosage_form,
     amount: amount,
     date: date
}));
patients.push(patients_address);
}

function getOverview(address patient) public view restricted 
returns(string, string, uint, uint) {

for(uint i = 0; i < ownerOfPrescription[patient].length; i++) {
 if(ownerOfPrescription[patient][i].patients_address == patient) {
   return(ownerOfPrescription[patient][i].medicament, 
          ownerOfPrescription[patient][i].dosage_form, 
          ownerOfPrescription[patient][i].amount, 
          ownerOfPrescription[patient][i].date);
    }
  }

}
}