with AUnit; use AUnit;
with AUnit.Test_Fixtures;
with Scene; use Scene;


package Scene_Test is

  type Scene_Test is new Test_Fixtures.Test_Fixture with null record;

  -- procedure Register_Tests (T: in out Scene_Test);
  -- Register routines to be run

  -- function Name (T: Scene_Test) return Message_String;
  -- Provide name identifying the test case

  -- Test Routines:
  procedure Test_Scene_Create (Sc : in out Scene_Test);

  procedure Test_Scene_Get_Px (Sc : in out Scene_Test);
  procedure Test_Scene_Get_Triangle (Sc : in out Scene_Test);
  procedure Test_Scene_Get_Height (Sc : in out Scene_Test);
  procedure Test_Scene_Get_Width (Sc : in out Scene_Test);

  procedure Test_Scene_Set_Px (Sc : in out Scene_Test);
  procedure Test_Scene_Set_Triangle (Sc : in out Scene_Test);
  procedure Test_Scene_Set_Height (Sc : in out Scene_Test);
  procedure Test_Scene_Set_Width (Sc : in out Scene_Test);
end Scene_Test;
