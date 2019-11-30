with AUnit; use AUnit;
with AUnit.Test_Fixtures;
with Vector; use Vector;


package Vector_Test is

  type Vector_Test is new Test_Fixtures.Test_Fixture with null record;

  -- procedure Register_Tests (T: in out Vector_Test);
  -- Register routines to be run

  -- function Name (T: Vector_Test) return Message_String;
  -- Provide name identifying the test case

  -- Test Routines:
  procedure Test_Vector_Create (T : in out Vector_Test);

  procedure Test_Vector_Get (T : in out Vector_Test);
  procedure Test_Vector_Set (T : in out Vector_Test);

  procedure Test_Vector_Equals (T : in out Vector_Test);

  procedure Test_Vector_Add (T : in out Vector_Test);
  procedure Test_Vector_Sub (T : in out Vector_Test);
  procedure Test_Vector_Dot (T : in out Vector_Test);
  procedure Test_Vector_Mult (T : in out Vector_Test);

  procedure Test_Vector_Mult (T : in out Vector_Test);

  procedure Test_Vector_Camera_To_Raster_Space (T : in out Vector_Test);
end Vector_Test;
