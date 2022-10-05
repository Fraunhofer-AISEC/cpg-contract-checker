    string string1 = '\n{"jsonrpc":"2.0","method":"generateIntegers","params":{"apiKey":${[decrypt]BF8gEz7O4gvAdzdJK/FTWHheGo3TuV5VIFku1rAEG78AxzX6AFEbWJSLZ0sCdEwGzppPsPltUXvIvxNaV5Yvnh3qfmzndRy/nfGjlWESfvNL3S1Fl4y2zqGmGi9DA4D+UokY83Awrw6tZd918KtRAvKe2Bos},"n":1,"min":0,"max":';

    string string3 = ',"replacement":true,"base":10},"id":1}';

    function update() payable {

         bytes32 data = bytes32(number - 1);

         strConcat(string1, bytes32ToString(data), string3);

        oraclize_query(60, "URL", "json(https://api.random.org/json-rpc/1/invoke).result.random.data.0", strConcat(string1, bytes32ToString(data2), string3));
}