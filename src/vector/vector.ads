with Float; use Float;

package Vector is
    type Vector is array (1..3) of Float.Float;

    function Vector_Create(X, Y, Z: Float.Float) return Vector;
    function Vector_Get(This: Vector;
                        Index: Integer) return Float.Float;
    procedure Vector_Set(This: in out Vector;
                         Index: Integer;
                         Value: Float.Float);
    function Vector_Add(U, V: Vector) return Vector;
    function Vector_Sub(U, V: Vector) return Vector;
    function Vector_Dot(U, V: Vector) return Vector;
    function Vector_Mult(U, V: Vector) return Vector;
    function Vector_Mult(V: Vector;
                         Value: Float.Float) return Vector;
end Vector;
