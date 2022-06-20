function addPatient(uint8 age, uint8 bp, uint8 sg, int8 al, int8 su,
            int8 rbc, int8 pc, int8 pcc, int8 ba,
            uint16 bgr, uint8 bu, uint16 sod, 
            uint8 pot, uint8 hemo, uint8 pcv, uint8 wc, uint8 rc,
            int8 htn, int8 dm, int8 cad, int8 appet, int8 pe, int8 ane) returns (uint id) {
    var patient = patients[nextPatientId];

    patient.age = age; patient.bp = bp; patient.sg = sg; patient.al = al; patient.su = su;
    (patient.rbc.initialized, patient.rbc.value) = setMyBool(rbc);
    (patient.pc.initialized, patient.pc.value) = setMyBool(pc);
    (patient.pcc.initialized, patient.pcc.value) = setMyBool(pcc);
    (patient.ba.initialized, patient.ba.value) = setMyBool(ba);
    patient.bgr = bgr; patient.bu = bu; patient.sod = sod;

    patient.pot = pot; patient.hemo = hemo; patient.pcv = pcv; patient.wc = wc; patient.rc = rc;
    (patient.htn.initialized, patient.htn.value) = setMyBool(htn);
    (patient.dm.initialized, patient.dm.value) = setMyBool(dm);
    (patient.cad.initialized, patient.cad.value) = setMyBool(cad);
    (patient.appet.initialized, patient.appet.value) = setMyBool(appet);
    (patient.pe.initialized, patient.pe.value) = setMyBool(pe);
    (patient.ane.initialized, patient.ane.value) = setMyBool(ane);


    nextPatientId++;
    id = nextPatientId;
}
