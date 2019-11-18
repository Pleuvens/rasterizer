with AUnit.Test_Caller;
with Scene_Test;

package body Scene_Test_Suite is
	package Scene_Caller is new AUnit.Test_Caller
      (Scene_Test.Scene_Test);

   function Suite return Aunit.Test_Suites.Access_Test_Suite is
      Ret : AUnit.Test_Suites.Access_Test_Suite :=
      AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Creation",
              Scene_Test.Test_Scene_Create'Access));
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Get Pixel",
              Scene_Test.Test_Scene_Get_Px'Access));
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Get Triangle",
              Scene_Test.Test_Scene_Get_Triangle'Access));
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Get Height",
              Scene_Test.Test_Scene_Get_Height'Access));
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Get Width",
              Scene_Test.Test_Scene_Get_Width'Access));
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Set Pixel",
              Scene_Test.Test_Scene_Set_Px'Access));
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Set Triangle",
              Scene_Test.Test_Scene_Set_Triangle'Access));
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Set Height",
              Scene_Test.Test_Scene_Set_Height'Access));
      Ret.Add_Test
         (Scene_Caller.Create
            ("Scene Test : Test Scene Set Width",
              Scene_Test.Test_Scene_Set_Width'Access));
      return Ret;
   end Suite;
end Scene_Test_Suite;
