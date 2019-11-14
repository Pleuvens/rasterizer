with Float; use Float;

package body Vector is
    function Vector_Create(X, Y, Z: Float.Float) return Vector
    begin
      return Vector(X, Y, Z);
    end;

    function Vector_Get(This: Vector;
                        Index: Integer) return Float.Float
    begin
      return This(Index);
    end

    procedure Vector_Set(This: in out Vector;
                         Index: Integer;
                         Value: Float.Float)
    begin
      This(Index) := Value;
    end

    function Vector_Add(U, V: Vector) return Vector;
    begin
      return Vector(U(0) + V(0), U(1) + V(1), U(2) + V(2));
    end

    function Vector_Sub(U, V: Vector) return Vector;
    begin
      return Vector(U(0) - V(0), U(1) - V(1), U(2) - V(2));
    end

    function Vector_Dot(U, V: Vector) return Vector;
    begin
      return Vector(U(0) * V(0), U(1) * V(1), U(2) * V(2));
    end

    function Vector_Mult(U, V: Vector) return Vector;
    begin
      return Vector(U(0) + V(0), U(1) + V(1), U(2) + V(2));
    end

    function Vector_Mult(V: Vector;
                         Value: Float.Float) return Vector;
    begin
      return Vector(U(0) * Value, U(1) * Value, U(2) * Value);
    end
end Vector;
