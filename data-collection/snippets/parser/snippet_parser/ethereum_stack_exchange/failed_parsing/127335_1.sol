1  import "IHello.sol";
2
3  library HelloUtils {
4      
5      hello(
6          string text,
7          string extraText
8      ) external view returns (string);
9  }
10
11 contract Hello is IHello {
12     using HelloUtils for string;
13
14     function message(string name) external view returns (string) {
15         return name.hello("the great");
16     }
17 }
