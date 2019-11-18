with Vector_Test_Suite;
with Color_Test_Suite;
with Triangle_Test_Suite;
with AUnit.Tests;

package body Test_Suite is
  use AUnit.Test_Suites;

   --  Here we dynamically allocate the suite using the New_Suite function
   --  We use the 'Suite' functions provided in This_Suite and That_Suite
   --  We also use Ada 2005 distinguished receiver notation to call Add_Test

   function Suite return Access_Test_Suite is
      Result : Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Result.Add_Test (Vector_Test_Suite.Suite);
      Result.Add_Test (Color_Test_Suite.Suite);
      Result.Add_Test (Triangle_Test_Suite.Suite);
      return Result;
   end Suite;
end Test_Suite;
