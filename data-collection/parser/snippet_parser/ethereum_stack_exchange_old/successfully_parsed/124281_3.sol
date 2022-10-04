constructor() {
    owner = msg.sender;

    uint8 tarifPercent = 134;
    for (uint8 tarifDuration = 7; tarifDuration <= 30; tarifDuration++) {
        tarifs[tarifDuration] = Tarif(tarifDuration, tarifPercent);
        tarifPercent+= 5;
    }
}
