[ 42%] Building CXX object libsolidity/CMakeFiles/solidity.dir/formal/Z3Interface.cpp.o
/my/path/to/solidity/libsolidity/formal/Z3Interface.cpp: In member function ‘z3::expr dev::solidity::smt::Z3Interface::toZ3Expr(const dev::solidity::smt::Expression&)’:
/my/path/to/solidity/libsolidity/formal/Z3Interface.cpp:166:14: error: ‘mod’ is not a member of ‘z3’
   return z3::mod(arguments[0], arguments[1]);
              ^~~
/my/path/to/solidity/libsolidity/formal/Z3Interface.cpp:166:14: note: suggested alternative: ‘cond’
   return z3::mod(arguments[0], arguments[1]);
              ^~~
              cond
libsolidity/CMakeFiles/solidity.dir/build.make:1166: recipe for target 'libsolidity/CMakeFiles/solidity.dir/formal/Z3Interface.cpp.o' failed
make[2]: *** [libsolidity/CMakeFiles/solidity.dir/formal/Z3Interface.cpp.o] Error 1
CMakeFiles/Makefile2:389: recipe for target 'libsolidity/CMakeFiles/solidity.dir/all' failed
make[1]: *** [libsolidity/CMakeFiles/solidity.dir/all] Error 2
Makefile:129: recipe for target 'all' failed
make: *** [all] Error 2

