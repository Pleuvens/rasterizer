with AUnit.Test_Caller;
with Vector_Test;

package body Test_Suite is
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
      return Ret;
   end Suite;
end Test_Suite;