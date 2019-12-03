with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

with Vector;
with Camera;

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

    function Vector_Normalize(V: Vector) return Vector is
    begin
        return (V(1) / Ada.Numerics.Elementary_Functions.Sqrt(V(1) * V(1) + V(2) * V(2)
        + V(3) * V(3))
            , V(2) / Ada.Numerics.Elementary_Functions.Sqrt(V(1) * V(1) + V(2) * V(2)
            + V(3) * V(3))
            , V(3) / Ada.Numerics.Elementary_Functions.Sqrt(V(1) * V(1) + V(2) * V(2)
            + V(3) * V(3)));
    end Vector_Normalize;

    function Vector_World_To_Camera_Space(This: Vector; Cam: Camera.Camera) return Vector is
        D, R, U: Vector;
    begin
        D := Camera.Camera_Get_Dir(Cam);
        R := Vector_Mult(D, Camera.Camera_Get_Up(Cam));
        U := Vector_Mult(R, D);
        D := Vector_Normalize(D);
        R := Vector_Normalize(R);
        U := Vector_Normalize(U);
        return (This(1) * R(1) + This(2) * U(1) + This(3) * (-D(1))
            , This(1) * R(2) + This(2) * U(2) + This(3) * (-D(2))
            , This(1) * R(3) + This(2) * U(3) + This(3) * (-D(3)));
    end Vector_World_To_Camera_Space;

    function Vector_Camera_To_Raster_Space(This: Vector;
	                                   L, R, T, B, H, W: Integer) return Vector is
      Near_Clipping_Plane : Float := 0.1;
      X, Y: Float;
      Screen_S, Ndc: Vector;
    begin
      X := Near_Clipping_Plane * This(1) / (-This(3));
      Y := Near_Clipping_Plane * This(2) / (-This(3));
      Screen_S := (X, Y, This(3));
      X := 2.0 * Screen_S(1) / Float(R - L) - Float(R + L) / Float(R - L);
      Y := 2.0 * Screen_S(2) / Float(T - B) - Float(T + B) / Float(T - B);
      Ndc := (X, Y, Screen_S(3));
      X := (Ndc(1) + 1.0) / 2.0 * Float(W);
      Y := (1.0 - Ndc(2)) / 2.0 * Float(H);
      return (X, Y, (-This(3)));
    end Vector_Camera_To_Raster_Space;

    function Vector_Edge(U, V, P: Vector) return Float is
    begin
        return (P(1) - U(1)) * (V(2) - U(2)) - (P(2) - U(2)) * (V(1) - U(1));
    end Vector_Edge;

    
    procedure Vector_Print(This: Vector) is
    begin
        Put_Line(Float'Image(This(1)) & ", " & Float'Image(This(2)) & " ,"
        & Float'Image(This(3)));
    end Vector_Print;
end Vector;
