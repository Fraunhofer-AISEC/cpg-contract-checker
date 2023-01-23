string string1 = '\\n{\"jsonrpc\":\"2.0\",\"method\":\"generateIntegers\",\"params\":{\"apiKey\":\"${[decrypt] BA3g1TNRkJ0lqv18s+v3chf2FoZEzUXuyhOUWCcoBDKrmv51clDqUvw36lLEDJizgDrCyX7GREX7YVOfctHAT/lhLiTZNQFNjw11mq/y9mJ2gXKWw+EP/13AUnvvtDcjLek7KaBsYxk2qYuKn78Nt+EAasij}\",\"n\":1,\"min\":1,\"max\":';

uint number = 5;

string string3 = ',\"replacement\":true${[identity] \"}\"},\"id\":1${[identity] \"}\"}';

oraclize_query(1, "nested", "[URL] ['json(https://api.random.org/json-rpc/1/invoke).result.random.data.0', strConcat(string1, uint2str(number), string3)]");  
