with AUnit.Assertions; use AUnit.Assertions;
with Color; use Color;
with Color_Test;

package body Color_Test is

   procedure Test_Color_Create (T : in out Color_Test) is
      R, G, B : Float;
      V       : Color.Color;
   begin
      R := 1.0; G := 2.0; B := 3.0;
      V := Color_Create(R, G, B);
      Assert(Color_Equals(V, Color_Create(R, G, B)), "1: basic create");
   end Test_Color_Create;

  procedure Test_Color_Get (T : in out Color_Test) is
    V   : Color.Color;
  begin
    V := Color_Create(1.0, 2.0, 3.0);
    Assert (Color_Get(V, 1) = 1.0, "1: X is incorrect");
    Assert (Color_Get(V, 2) = 2.0, "1: Y is incorrect");
    Assert (Color_Get(V, 3) = 3.0, "1: Z is incorrect");
  end Test_Color_Get;

  procedure Test_Color_Set (T : in out Color_Test) is
    V : Color.Color;
  begin
    V := Color_Create(1.0, 2.0, 3.0);
    Color_Set(V, 1, 4.0);
    Color_Set(V, 2, 5.0);
    Color_Set(V, 3, 6.0);
    Assert(Color_Equals(V, Color_Create(4.0, 5.0, 6.0)), "1: basic color set");
  end Test_Color_Set;

  procedure Test_Color_Equals (T : in out Color_Test) is
    U, V: Color.Color;
  begin
    U := Color_Create(1.0, 2.0, 3.0);
    V := Color_Create(1.0, 2.0, 3.0);
    Assert(Color_Equals(U, V) = true, "1: Should be equals");
  end Test_Color_Equals;

  procedure Test_Color_Add (T : in out Color_Test) is
    U, V, Res: Color.Color;
  begin
    U := Color_Create(1.0, 2.0, 3.0);
    V := Color_Create(1.0, 2.0, 3.0);
    Res := Color_Add(U, V);
    Assert(Color_Equals(Res, Color_Create(2.0, 4.0, 6.0)), "1: Simple addition");
  end Test_Color_Add;

  procedure Test_Color_Sub (T : in out Color_Test) is
    U, V, Res: Color.Color;
  begin
    U := Color_Create(1.0, 2.0, 3.0);
    V := Color_Create(1.0, 2.0, 3.0);
    Res := Color_Sub(U, V);
    Assert(Color_Equals(Res, Color_Create(0.0, 0.0, 0.0)), "1: Simple substraction");
  end Test_Color_Sub;

  procedure Test_Color_Mult (T : in out Color_Test) is
    U, V, Res: Color.Color;
  begin
    U := Color_Create(1.0, 2.0, 3.0);
    V := Color_Create(1.0, 2.0, 3.0);
    Res := Color_Mult(U, V);
    Assert(Color_Equals(Res, Color_Create(0.0, 0.0, 0.0)), "1: Simple vector multiplication");
  end Test_Color_Mult;


end Color_Test;
