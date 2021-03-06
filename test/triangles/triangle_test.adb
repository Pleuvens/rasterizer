with AUnit.Assertions; use AUnit.Assertions;
with Vector; use Vector;
with Color; use Color;
with Triangle; use Triangle;
with Triangle_Test;

package body Triangle_Test is

   procedure Test_Triangle_Create (T : in out Triangle_Test) is
      U, V, W : Vector.Vector;
      C       : Color.Color;
      Tr       : Triangle.Triangle;
   begin
      U := (0.0, 0.0, 0.0); V := (1.0, 1.0, 1.0); W := (2.0, 2.0, 2.0);
      C := (0.0, 0.0, 0.0);
      Tr := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
      Assert(Color_Equals(Tr.T_Colors(1), C), "1: basic create - Color 1");
      Assert(Color_Equals(Tr.T_Colors(2), C), "1: basic create - Color 2");
      Assert(Color_Equals(Tr.T_Colors(3), C), "1: basic create - Color 3");
      Assert(Vector_Equals(Tr.Vectors(1), U), "1: basic create - Vector 1");
      Assert(Vector_Equals(Tr.Vectors(2), V), "1: basic create - Vector 2");
      Assert(Vector_Equals(Tr.Vectors(3), W), "1: basic create - Vector 3");
      Assert(Vector_Equals(Tr.Vector_Normals(1), U), "1: basic create - Vector Normal 1");
      Assert(Vector_Equals(Tr.Vector_Normals(2), V), "1: basic create - Vector Normal 2");
      Assert(Vector_Equals(Tr.Vector_Normals(3), W), "1: basic create - Vector Normal 3");

   end Test_Triangle_Create;

  procedure Test_Triangle_Equals (T : in out Triangle_Test) is
    U, V, W : Vector.Vector;
    C       : Color.Color;
    Tr, Tr2   : Triangle.Triangle;
  begin
    U := (0.0, 0.0, 0.0); V := (1.0, 1.0, 1.0); W := (2.0, 2.0, 2.0);
    C := (0.0, 0.0, 0.0);
    Tr  := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
    Tr2 := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
    Assert(Triangle_Equals(Tr, Tr2) = true, "1: Should be equals");
  end Test_Triangle_Equals;

  procedure Test_Triangle_Get_Vector (T : in out Triangle_Test) is
    U, V, W : Vector.Vector;
    C       : Color.Color;
    Tr       : Triangle.Triangle;
  begin
    U := (0.0, 0.0, 0.0); V := (1.0, 1.0, 1.0); W := (2.0, 2.0, 2.0);
    C := (0.0, 0.0, 0.0);
    Tr := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
    Assert (Triangle_Get_Vector(Tr, 1) = U, "1: Vector 1 is incorrect");
    Assert (Triangle_Get_Vector(Tr, 2) = V, "1: Vector 2 is incorrect");
    Assert (Triangle_Get_Vector(Tr, 3) = W, "1: Vector 3 is incorrect");
  end Test_Triangle_Get_Vector;

  procedure Test_Triangle_Get_Vector_Normal (T : in out Triangle_Test) is
    U, V, W : Vector.Vector;
    C       : Color.Color;
    Tr       : Triangle.Triangle;
  begin
    U := (0.0, 0.0, 0.0); V := (1.0, 1.0, 1.0); W := (2.0, 2.0, 2.0);
    C := (0.0, 0.0, 0.0);
    Tr := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
    Assert (Triangle_Get_Vector_Normal(Tr, 1) = U, "1: Vector Normal 1 is incorrect");
    Assert (Triangle_Get_Vector_Normal(Tr, 2) = V, "1: Vector Normal 2 is incorrect");
    Assert (Triangle_Get_Vector_Normal(Tr, 3) = W, "1: Vector Normal 3 is incorrect");
  end Test_Triangle_Get_Vector_Normal;

  procedure Test_Triangle_Get_Color (T : in out Triangle_Test) is
    U, V, W : Vector.Vector;
    C       : Color.Color;
    Tr       : Triangle.Triangle;
  begin
    U := (0.0, 0.0, 0.0); V := (1.0, 1.0, 1.0); W := (2.0, 2.0, 2.0);
    C := (0.0, 0.0, 0.0);
    Tr := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
    Assert (Triangle_Get_Color(Tr, 1) = C, "1: Color is incorrect");
  end Test_Triangle_Get_Color;

  procedure Test_Triangle_Set_Vector (T : in out Triangle_Test) is
    U, V, W : Vector.Vector;
    C       : Color.Color;
    Tr       : Triangle.Triangle;
  begin
    U := (0.0, 0.0, 0.0); V := (1.0, 1.0, 1.0); W := (2.0, 2.0, 2.0);
    C := (0.0, 0.0, 0.0);
    Tr := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
    U := (5.0, 5.0, 5.0);
    Triangle_Set_Vector(Tr, 1, U);
    Triangle_Set_Vector(Tr, 2, U);
    Triangle_Set_Vector(Tr, 3, U);
    Assert(Vector_Equals(Triangle_Get_Vector(Tr, 1), U), "1: basic vector 1 set");
    Assert(Vector_Equals(Triangle_Get_Vector(Tr, 2), U), "1: basic vector 1 set");
    Assert(Vector_Equals(Triangle_Get_Vector(Tr, 3), U), "1: basic vector 1 set");
  end Test_Triangle_Set_Vector;

  procedure Test_Triangle_Set_Vector_Normal (T : in out Triangle_Test) is
    U, V, W : Vector.Vector;
    C       : Color.Color;
    Tr       : Triangle.Triangle;
  begin
    U := (0.0, 0.0, 0.0); V := (1.0, 1.0, 1.0); W := (2.0, 2.0, 2.0);
    C := (0.0, 0.0, 0.0);
    Tr := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
    U := (5.0, 5.0, 5.0);
    Triangle_Set_Vector_Normal(Tr, 1, U);
    Triangle_Set_Vector_Normal(Tr, 2, U);
    Triangle_Set_Vector_Normal(Tr, 3, U);
    Assert(Vector_Equals(Triangle_Get_Vector_Normal(Tr, 1), U), "1: basic vector 1 set");
    Assert(Vector_Equals(Triangle_Get_Vector_Normal(Tr, 2), U), "1: basic vector 1 set");
    Assert(Vector_Equals(Triangle_Get_Vector_Normal(Tr, 3), U), "1: basic vector 1 set");
  end Test_Triangle_Set_Vector_Normal;

  procedure Test_Triangle_Set_Color (T : in out Triangle_Test) is
    U, V, W : Vector.Vector;
    C       : Color.Color;
    Tr       : Triangle.Triangle;
  begin
    U := (0.0, 0.0, 0.0); V := (1.0, 1.0, 1.0); W := (2.0, 2.0, 2.0);
    C := (0.0, 0.0, 0.0);
    Tr := Triangle_Create((U, V, W), (U, V, W), (C, C, C));
    C := (1.0, 1.0, 1.0);
    Triangle_Set_Color(Tr, 1, C);
    Assert(Color_Equals(Triangle_Get_Color(Tr, 1), C), "1: basic color set");
  end Test_Triangle_Set_Color;
 
end Triangle_Test;
