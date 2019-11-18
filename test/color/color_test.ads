with AUnit; use AUnit;
with AUnit.Test_Fixtures;
with Color; use Color;


package Color_Test is

  type Color_Test is new Test_Fixtures.Test_Fixture with null record;

  -- procedure Register_Tests (T: in out Vector_Test);
  -- Register routines to be run

  -- function Name (T: Vector_Test) return Message_String;
  -- Provide name identifying the test case

  -- Test Routines:
  procedure Test_Color_Create (T : in out Color_Test);

  procedure Test_Color_Get (T : in out Color_Test);
  procedure Test_Color_Set (T : in out Color_Test);

  procedure Test_Color_Equals (T : in out Color_Test);

  procedure Test_Color_Add (T : in out Color_Test);
  procedure Test_Color_Sub (T : in out Color_Test);
  procedure Test_Color_Mult (T : in out Color_Test);
end Color_Test;
