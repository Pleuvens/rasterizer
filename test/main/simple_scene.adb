with Scene; use Scene;

procedure Simple_Scene is
    S: Scene.Scene(256, 256, 65536, 512);
    Cam: Vector.Vector;
begin
    -- Parse input
    S := Scene_Create(256, 256, ?, Cam);
    Scene_Render(S);
end Simple_Scene;
