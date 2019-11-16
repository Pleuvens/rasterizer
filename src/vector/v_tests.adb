with Vector_Test_Suite;
with AUnit.Run;
with AUnit.Reporter.Text;

procedure V_Tests is
   procedure Run is new AUnit.Run.Test_Runner (Vector_Test_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Run (Reporter);
end V_Tests;
