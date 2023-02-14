Prosumer[] public ProsumeArray;

struct Prosumer{
    uint ProsumerID;
    uint Pros_power;
    uint per_unit_rate;
}

function setPros(uint ProsumerID, uint Pros_power,uint per_unit_rate)public {
    Prosumer memory newProsumer=Prosumer({
        ProsumerID: ProsumerID,
        Pros_power: Pros_power,
        per_unit_rate: per_unit_rate
    });
    ProsumeArray.push(newProsumer);
}

function ChoosePro(uint n) public view returns(uint ){
    return ProsumeArray[n];
}
