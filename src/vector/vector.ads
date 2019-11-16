package Vector is
    type Vector is array (1..3) of Float;

    function Vector_Create(X, Y, Z: Float) return Vector;
    function Vector_Get(This: Vector;
                        Index: Integer) return Float;
    procedure Vector_Set(This: in out Vector;
                         Index: Integer;
                         Value: Float);
    function Vector_Equals(U, V: Vector) return Boolean;
    function Vector_Add(U, V: Vector) return Vector;
    function Vector_Sub(U, V: Vector) return Vector;
    function Vector_Dot(U, V: Vector) return Vector;
    function Vector_Mult(U, V: Vector) return Vector;
    function Vector_Mult(V: Vector;
                         Value: Float) return Vector;
end Vector;
