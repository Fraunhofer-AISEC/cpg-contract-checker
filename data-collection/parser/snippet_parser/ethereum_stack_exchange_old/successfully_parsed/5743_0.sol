contract InvalidJump {
    uint[5] data;

    function invalidJump1() {
       uint i = 6000;
       data[i] = 1;
    }
}
