contract BookStore {

event Hello(string indexed bello);

function hello() external {
emit Hello("bello");
}  

}
