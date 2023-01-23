interface IAnimal {
  function walk() external;
  function run() external;
}

interface ICat is IAnimal {
   function meow() external;
   function jumps() external;
}
