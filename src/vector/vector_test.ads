with AUnit; use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;
use Vector;


package Vector_Tests is

  type Vector_Test is new Test_Cases.Test_Case with null record;

  procedure Register_Tests (T: in out Money_Test);
  -- Register routines to be run

  function Name (T: Money_Test) return Message_String;
  -- Provide name identifying the test case

  -- Test Routines:
  procedure Test_Vector_Create (T : in out Test_Cases.Test_Case'Class);
end Vector_Tests
