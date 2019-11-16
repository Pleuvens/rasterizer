with AUnit.Assertions; use AUnit.Assertions;
with Vector; use Vector;
with Vector_Test;

package body Vector_Test is

   procedure Test_Vector_Create (T : in out Vector_Test) is
      X, Y, Z : Float;
      V       : Vector.Vector;
   begin
      X := 1.0; Y := 2.0; Z := 3.0;
      V := Vector_Create(X, Y, Z);
      Assert(Vector_Equals(V, Vector_Create(X, Y, Z)), "1: basic create");
   end Test_Vector_Create;

  procedure Test_Vector_Get (T : in out Vector_Test) is
    V   : Vector.Vector;
  begin
    V := Vector_Create(1.0, 2.0, 3.0);
    Assert (Vector_Get(V, 1) = 1.0, "1: X is incorrect");
    Assert (Vector_Get(V, 2) = 2.0, "1: Y is incorrect");
    Assert (Vector_Get(V, 3) = 3.0, "1: Z is incorrect");
  end Test_Vector_Get;

  procedure Test_Vector_Set (T : in out Vector_Test) is
    V : Vector.Vector;
  begin
    V := Vector_Create(1.0, 2.0, 3.0);
    Vector_Set(V, 1, 4.0);
    Vector_Set(V, 2, 5.0);
    Vector_Set(V, 3, 6.0);
    Assert(Vector_Equals(V, Vector_Create(4.0, 5.0, 6.0)), "1: basic vector set");
  end Test_Vector_Set;

  procedure Test_Vector_Equals (T : in out Vector_Test) is
    U, V: Vector.Vector;
  begin
    U := Vector_Create(1.0, 2.0, 3.0);
    V := Vector_Create(1.0, 2.0, 3.0);
    Assert(Vector_Equals(U, V) = true, "1: Should be equals");
  end Test_Vector_Equals;

  procedure Test_Vector_Add (T : in out Vector_Test) is
    U, V, Res: Vector.Vector;
  begin
    U := Vector_Create(1.0, 2.0, 3.0);
    V := Vector_Create(1.0, 2.0, 3.0);
    Res := Vector_Add(U, V);
    Assert(Vector_Equals(Res, Vector_Create(2.0, 4.0, 6.0)), "1: Simple addition");
  end Test_Vector_Add;

  procedure Test_Vector_Sub (T : in out Vector_Test) is
    U, V, Res: Vector.Vector;
  begin
    U := Vector_Create(1.0, 2.0, 3.0);
    V := Vector_Create(1.0, 2.0, 3.0);
    Res := Vector_Sub(U, V);
    Assert(Vector_Equals(Res, Vector_Create(0.0, 0.0, 0.0)), "1: Simple substraction");
  end Test_Vector_Sub;

  procedure Test_Vector_Dot (T : in out Vector_Test) is
    U, V, Res: Vector.Vector;
  begin
    U := Vector_Create(1.0, 2.0, 3.0);
    V := Vector_Create(1.0, 2.0, 3.0);
    Res := Vector_Dot(U, V);
    Assert(Vector_Equals(Res, Vector_Create(1.0, 4.0, 9.0)), "1: Simple scalar product");
  end Test_Vector_Dot;

  procedure Test_Vector_Mult (T : in out Vector_Test) is
    U, V, Res: Vector.Vector;
  begin
    U := Vector_Create(1.0, 2.0, 3.0);
    V := Vector_Create(1.0, 2.0, 3.0);
    Res := Vector_Mult(U, V);
    Assert(Vector_Equals(Res, Vector_Create(0.0, 0.0, 0.0)), "1: Simple vector multiplication");
  end Test_Vector_Mult;


end Vector_Test;
