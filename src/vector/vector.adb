with Vector;

package body Vector is
    function Vector_Create(X, Y, Z: Float) return Vector is
    begin
      return (X, Y, Z);
    end Vector_Create;

    function Vector_Get(This: Vector;
                        Index: Integer) return Float is
    begin
      return This(Index);
    end Vector_Get;

    procedure Vector_Set(This: in out Vector;
                         Index: Integer;
                         Value: Float) is
    begin
      This(Index) := Value;
    end Vector_Set;

    function Vector_Equals(U, V: Vector) return Boolean is
    begin
      return U(1) = V(1) and U(2) = V(2) and U(3) = V(3);
    end Vector_Equals;

    function Vector_Add(U, V: Vector) return Vector is
    begin
      return (U(1) + V(1), U(2) + V(2), U(3) + V(3));
    end Vector_Add;

    function Vector_Sub(U, V: Vector) return Vector is
    begin
      return (U(1) - V(1), U(2) - V(2), U(3) - V(3));
    end Vector_Sub;

    function Vector_Dot(U, V: Vector) return Vector is
    begin
      return (U(1) * V(1), U(2) * V(2), U(3) * V(3));
    end Vector_Dot;

    function Vector_Mult(U, V: Vector) return Vector is
    begin
      return (U(2)*V(3) - U(3)*V(2), U(3)*V(1) - U(1)*V(3), U(1)*V(2) - U(2)*V(1));
    end Vector_Mult;

    function Vector_Mult(V: Vector;
                         Value: Float) return Vector is
    begin
      return (V(1) * Value, V(2) * Value, V(3) * Value);
    end Vector_Mult;
end Vector;
