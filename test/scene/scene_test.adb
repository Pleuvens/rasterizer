with AUnit.Assertions; use AUnit.Assertions;
with Color; use Color;
with Triangle; use Triangle;
with Scene; use Scene;
with Scene_Test;

package body Scene_Test is

  procedure Test_Scene_Create (Sc : in out Scene_Test) is
    S : Scene.Scene(10, 10, 100, 3);
  begin
    Assert (S.Height = 10, "1: Height is incorrect");
    Assert (S.Width = 10, "1: Width is incorrect");
    Assert (S.Nb_Triangles = 3, "1: Nb_Triangles is incorrect");
  end Test_Scene_Create;

  procedure Test_Scene_Get_Px (Sc : in out Scene_Test) is
  begin
    Assert (0.0 = 0.0, "1: basic get pixel");
  end Test_Scene_Get_Px;

  procedure Test_Scene_Get_Triangle (Sc : in out Scene_Test) is
  begin
    Assert (0.0 = 0.0, "1: basic get triangle");
  end Test_Scene_Get_Triangle;

  procedure Test_Scene_Get_Height (Sc : in out Scene_Test) is
  begin
    Assert (0.0 = 0.0, "1: basic get pixel");
  end Test_Scene_Get_Height;

  procedure Test_Scene_Get_Width (Sc : in out Scene_Test) is
  begin
    Assert (0.0 = 0.0, "1: basic get pixel");
  end Test_Scene_Get_Width;

  procedure Test_Scene_Set_Px (Sc: in out Scene_Test) is
  begin
    Assert (0.0 = 0.0, "1: basic get pixel");
  end Test_Scene_Set_Px;

  procedure Test_Scene_Set_Triangle (Sc : in out Scene_Test) is
  begin
    Assert (0.0 = 0.0, "1: basic get pixel");
  end Test_Scene_Set_Triangle;

  procedure Test_Scene_Set_Height (Sc : in out Scene_Test) is
  begin
    Assert (0.0 = 0.0, "1: basic get pixel");
  end Test_Scene_Set_Height;

  procedure Test_Scene_Set_Width (Sc : in out Scene_Test) is
  begin
    Assert (0.0 = 0.0, "1: basic get pixel");
  end Test_Scene_Set_Width;
 
end Scene_Test;
