contract Puppy {

  enum State { good, bad }

  State public status;
  State public constant INITIAL_STATUS = State.good;

  function Puppy() {
    status = INITIAL_STATUS;
  }
}
