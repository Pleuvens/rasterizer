with AUnit.Test_Caller;
with Color_Test;

package body Color_Test_Suite is
	package Color_Caller is new AUnit.Test_Caller
      (Color_Test.Color_Test);

   function Suite return Aunit.Test_Suites.Access_Test_Suite is
      Ret : AUnit.Test_Suites.Access_Test_Suite :=
      AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test
         (Color_Caller.Create
            ("Color Test : Test Color Creation",
              Color_Test.Test_Color_Create'Access));
      Ret.Add_Test
         (Color_Caller.Create
            ("Color Test : Test Color Get",
              Color_Test.Test_Color_Get'Access));
      Ret.Add_Test
         (Color_Caller.Create
            ("Color Test : Test Color Set",
              Color_Test.Test_Color_Set'Access));
      Ret.Add_Test
         (Color_Caller.Create
            ("Color Test : Test Color Equals",
              Color_Test.Test_Color_Equals'Access));
      Ret.Add_Test
         (Color_Caller.Create
            ("Color Test : Test Color Add",
              Color_Test.Test_Color_Add'Access));
      Ret.Add_Test
         (Color_Caller.Create
            ("Color Test : Test Color Sub",
              Color_Test.Test_Color_Sub'Access));
      Ret.Add_Test
         (Color_Caller.Create
            ("Color Test : Test Color Mult",
              Color_Test.Test_Color_Mult'Access));
      return Ret;
   end Suite;
end Color_Test_Suite;
