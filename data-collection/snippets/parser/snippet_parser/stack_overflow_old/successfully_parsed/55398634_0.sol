struct Prescription {
    address patients_address;
    string medicament;
    string dosage_form;
    uint amount;
    uint date;
}

mapping (address => Prescription) ownerOfPrescription;

address [] public patients;

function createPrescription(address patients_address, string medicament, string dosage_form, uint amount, uint date) public restricted {
    var newPrescription = ownerOfPrescription[patients_address];

    newPrescription.medicament = medicament;
    newPrescription.dosage_form = dosage_form;
    newPrescription.amount = amount;
    newPrescription.date = date;

    patients.push(patients_address) -1;
}

function getPre(address _address)view public returns (string, string, uint, uint){ 
    return( 
        ownerOfPrescription[_address].medicament, 
        ownerOfPrescription[_address].dosage_form, 
        ownerOfPrescription[_address].amount, 
        ownerOfPrescription[_address].date);
}
