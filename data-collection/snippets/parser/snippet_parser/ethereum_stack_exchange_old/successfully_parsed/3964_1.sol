contract Gizmo
{
    int public value;
    function Gizmo(int v) {
        value = v;
    }
}

contract Factory
{
    address gizmoAddr;
    function Create(int _value) returns (address) {
        gizmoAddr = new Gizmo(_value);
        return gizmoAddr;
    }
}
