with OBJ_Parser; use OBJ_Parser;
with Vector; use Vector;
with Scene; use Scene;

procedure Simple_Scene is
    S: Scene.Scene(128, 128, 128 * 128, 2);
    Cam: Vector.Vector;
    File_Name : String(1 .. 17) := "samples/cube0.obj";
begin
    if not Parse(File_Name, S) then
        return;
    end if;
    Scene_Render(S);
end Simple_Scene;
