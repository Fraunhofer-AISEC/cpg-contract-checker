def no_reentrancy(to_wrap):
  def wrapped(self, *args, **kwargs):
    if self._locked is True:
      raise Exception(...)
    self._locked = True

    return_val = to_wrap(self, *args, **kwargs)

    self._locked = False
    return return_val
  return wrapped

class MyClass:
  @no_reentrancy
  def sensitive(self, ...):
    ...
