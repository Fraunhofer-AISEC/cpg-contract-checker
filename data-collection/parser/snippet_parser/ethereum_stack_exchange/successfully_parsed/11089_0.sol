contract Test {

    struct MyBool {
        bool initialized; 
        bool value;
    }

    struct Patient {
        uint8 age;
        uint8 bp;
        uint8 sg;
        int8 al;
        int8 su;
        MyBool rbc;
        MyBool pc;
        MyBool pcc;
        MyBool ba;
        uint16 bgr;
        uint8 bu;
        uint8 sc;
        uint16 sod;
        uint8 pot;
        uint8 hemo;
        uint8 pcv;
        uint8 wc;
        uint8 rc;
        MyBool htn;
        MyBool dm;
        MyBool cad;
        MyBool appet;
        MyBool pe;
        MyBool ane;
    }

    uint nextPatientId;
    mapping (uint256 => Patient) private patients;

    function Test() {
        
        addPatient(4, 0, 20, 1, 0, -1, 1, 0, 0, 99, 23, 145);
    }

    function setMyBool(int8 value) private returns (bool initialized, bool newValue) {
        if (value < -1  || value > 1) {
            throw;
        }
        
        if (-1 != value) {
            initialized = true;
            newValue = (value==1) ? true : false;
        }
    }

    function getMyBool(MyBool patientField) private returns (int8) {
        if (patientField.initialized == true) {
            return (int8)((patientField.value) ? 1 : 0); 
        } else {
            return 127;
        }
    }

    function getNextPatientId() constant returns (uint) {
        return nextPatientId;
    }

    function addPatient(uint8 age, uint8 bp, uint8 sg, int8 al, int8 su,
                        int8 rbc, int8 pc, int8 pcc, int8 ba,
                        uint16 bgr, uint8 bu, uint16 sod) returns (uint id) {
        var patient = patients[nextPatientId];

        patient.age = age; patient.bp = bp; patient.sg = sg; patient.al = al; patient.su = su;
        (patient.rbc.initialized, patient.rbc.value) = setMyBool(rbc);
        (patient.pc.initialized, patient.pc.value) = setMyBool(pc);
        (patient.pcc.initialized, patient.pcc.value) = setMyBool(pcc);
        (patient.ba.initialized, patient.ba.value) = setMyBool(ba);
        patient.bgr = bgr; patient.bu = bu; patient.sod = sod;

        nextPatientId++;
        id = nextPatientId;
    }

    function getMyPatient(uint id) constant returns (uint8 age, uint8 bp, uint8 sg, int8 al, int8 su,
                        int8 rbc, int8 pc, int8 pcc, int8 ba,
                        uint16 bgr, uint8 bu, uint16 sod) {
        age = patients[id].age; bp = patients[id].bp; sg = patients[id].sg; al = patients[id].al; su = patients[id].su;
        rbc = getMyBool(patients[id].rbc); pc = getMyBool(patients[id].pc); pcc = getMyBool(patients[id].pcc); ba = getMyBool(patients[id].ba);
        bgr = patients[id].bgr; bu = patients[id].bu; sod = patients[id].sod;
    }

}
