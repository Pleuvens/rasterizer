with AUnit.Test_Caller;
with Triangle_Test;

package body Triangle_Test_Suite is
	package Triangle_Caller is new AUnit.Test_Caller
      (Triangle_Test.Triangle_Test);

   function Suite return Aunit.Test_Suites.Access_Test_Suite is
      Ret : AUnit.Test_Suites.Access_Test_Suite :=
      AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test
         (Triangle_Caller.Create
            ("Triangle Test : Test Triangle Creation",
              Triangle_Test.Test_Triangle_Create'Access));
      Ret.Add_Test
         (Triangle_Caller.Create
            ("Triangle Test : Test Triangle Equals",
              Triangle_Test.Test_Triangle_Equals'Access));
      Ret.Add_Test
         (Triangle_Caller.Create
            ("Triangle Test : Test Triangle Get Vector",
              Triangle_Test.Test_Triangle_Get_Vector'Access));
      Ret.Add_Test
         (Triangle_Caller.Create
            ("Triangle Test : Test Triangle Get Color",
              Triangle_Test.Test_Triangle_Get_Color'Access));
      Ret.Add_Test
         (Triangle_Caller.Create
            ("Triangle Test : Test Triangle Set Vector",
              Triangle_Test.Test_Triangle_Set_Vector'Access));
      Ret.Add_Test
         (Triangle_Caller.Create
            ("Triangle Test : Test Triangle Set Color",
              Triangle_Test.Test_Triangle_Set_Color'Access));
      return Ret;
   end Suite;
end Triangle_Test_Suite;
