with AUnit; use AUnit;
with AUnit.Test_Fixtures;
with Triangle; use Triangle;


package Triangle_Test is

  type Triangle_Test is new Test_Fixtures.Test_Fixture with null record;

  -- procedure Register_Tests (T: in out Triangle_Test);
  -- Register routines to be run

  -- function Name (T: Triangle_Test) return Message_String;
  -- Provide name identifying the test case

  -- Test Routines:
  procedure Test_Triangle_Create (T : in out Triangle_Test);

  procedure Test_Triangle_Equals (T : in out Triangle_Test);

  procedure Test_Triangle_Get_Vector (T : in out Triangle_Test);
  procedure Test_Triangle_Get_Color (T : in out Triangle_Test);

  procedure Test_Triangle_Set_Vector (T : in out Triangle_Test);
  procedure Test_Triangle_Set_Color (T : in out Triangle_Test);
end Triangle_Test;
