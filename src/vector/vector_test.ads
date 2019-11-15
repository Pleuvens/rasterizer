with AUnit; use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;
with Vector; use Vector;


package Vector_Test is

  type Vector_Test is new Test_Cases.Test_Case with null record;

  procedure Register_Tests (T: in out Vector_Test);
  -- Register routines to be run

  function Name (T: Vector_Test) return Message_String;
  -- Provide name identifying the test case

  -- Test Routines:
  procedure Test_Vector_Create (T : in out Test_Cases.Test_Case'Class);
end Vector_Test;
