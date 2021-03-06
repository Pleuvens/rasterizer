with AUnit.Test_Caller;
with Vector_Test;

package body Vector_Test_Suite is
	package Vector_Caller is new AUnit.Test_Caller
      (Vector_Test.Vector_Test);

   function Suite return Aunit.Test_Suites.Access_Test_Suite is
      Ret : AUnit.Test_Suites.Access_Test_Suite :=
      AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Creation",
              Vector_Test.Test_Vector_Create'Access));
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Get",
              Vector_Test.Test_Vector_Get'Access));
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Set",
              Vector_Test.Test_Vector_Set'Access));
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Equals",
              Vector_Test.Test_Vector_Equals'Access));
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Add",
              Vector_Test.Test_Vector_Add'Access));
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Sub",
              Vector_Test.Test_Vector_Sub'Access));
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Dot",
              Vector_Test.Test_Vector_Dot'Access));
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Mult",
              Vector_Test.Test_Vector_Mult'Access));
      Ret.Add_Test
         (Vector_Caller.Create
            ("Vector Test : Test Vector Camera To Raster Space",
              Vector_Test.Test_Vector_Camera_To_Raster_Space'Access));
      return Ret;
   end Suite;
end Vector_Test_Suite;
