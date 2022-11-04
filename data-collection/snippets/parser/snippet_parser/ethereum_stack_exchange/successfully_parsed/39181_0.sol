contract CheckBet is usingOraclize {
    struct Weather {
        uint curr_temperature;
        uint high_temperature;
        uint low_temperature;
    }
    Weather weather;

function get_weather_status() payable{
    Log("Oraclize query was sent, waiting for the answer.."); 
    (oraclize_query("URL","json(http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22).main.temp_min"));

}


function __callback(bytes32 _myid, string _result) {
    require (msg.sender == oraclize_cbAddress());
    Log(_result);
    assign_value_to_weather[low_temperature]= parseInt(_result, 2); 
}
}