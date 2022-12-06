pragma solidity 0.4.15; 

contract monitoring {

uint8 public temperature;
address sensor;
address led;

event Instruction (address device, string instruction);

function monitoring (address _sensor, address LED ){
    sensor = _sensor;
    led = LED;
}

function updateTemp(uint temp){
    if(msg.sender != sensor) throw;
    temperature = temp;
    if (temperature > 90) {
        instruction(led, "ON");
    {
    else instruction(led, "OFF");
}
}
