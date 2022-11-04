TypeError: Derived contract must override function "lives". Two or more base classes define function with same name and parameter types.
Since one of the bases defines a public state variable which cannot be overridden, you have to change the inheritance layout or the names of the functions.
