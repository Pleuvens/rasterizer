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
      Assert (V(1) = X, "X is incorrect");
      Assert (V(2) = Y, "Y is incorrect");
      Assert (V(3) = Z, "Z is incorrect");
   end Test_Vector_Create;

   -- Register test routines to call
  -- procedure Register_Tests (T: in out Vector_Test) is
    --  use AUnit.Test_Cases.Registration;
   --begin
      -- Repeat for each test routine:
   --   Register_Routine (T, Test_Vector_Create'Access, "Test Vector Creation");
   --end Register_Tests;

   -- Identifier of test case

   --function Name (T: Vector_Test) return Test_String is
   --begin
    --  return Format ("Vector Tests");
   --end Name;

end Vector_Test;
