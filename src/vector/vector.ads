use Float_RZ;

package Vector_RZ is
    type Vector is array (1..3) of Float_RZ.Float;

    function Vector_Create(X, Y, Z: Float_RZ.Float) return Vector;
    function Vector_Get(This: Vector;
                        Index: Integer) return Float_RZ.Float;
    procedure Vector_Set(This: in out Vector;
                         Index: Integer;
                         Value: Float_RZ.Float);
    function Vector_Add(U, V: Vector) return Vector;
    function Vector_Sub(U, V: Vector) return Vector;
    function Vector_Dot(U, V: Vector) return Vector;
    function Vector_Mult(U, V: Vector) return Vector;
    function Vector_Mult(V: Vector;
                         Value: Float_RZ.Float) return Vector;
end Vector_RZ;
