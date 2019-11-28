with OBJ_Parser; use OBJ_Parser;
with Scene; use Scene;

procedure Simple_Scene is
    S: Scene.Scene(256, 256, 65536, 512);
    Cam: Vector.Vector;
begin
    S := Parse("samples/cube.obj"); 
    Scene_Render(S);
end Simple_Scene;
