with Ada.Text_IO;  use Ada.Text_IO;

with Vector; use Vector;
with Color; use Color;
with Triangle; use Triangle;
with Camera; use Camera;
with Matrix; use Matrix;

package body Scene is

    function Scene_Create(H, W, Nb_Tr: Positive;
                          Cam: Vector.Vector) return Scene is
      S : Scene(H, W, (H * W - 1), Nb_Tr);
    begin
        S.Cam := Camera.Camera_Create(Cam, (0.0, 0.0, 1.0), (0.0, 1.0, 0.0),
        (1.0, 0.0, 0.0), 30.0, 0.1, 1000.0);
        return S; 
    end Scene_Create;

    function Scene_Get_Px(This: Scene;
                          Y, X: Positive) return Color.Color is
    begin
      return This.Img(Y * This.Width + X);
    end Scene_Get_Px;

    function Scene_Get_Triangle(This: Scene;
                                Index: Positive) return Triangle.Triangle is
    begin
      return This.Triangles(Index);
    end Scene_Get_Triangle;

    function Scene_Get_Height(This: Scene) return Positive is
    begin
      return This.Height;
    end Scene_Get_Height;

    function Scene_Get_Width(This: Scene) return Positive is
    begin
      return This.Width;
    end Scene_Get_Width;

    procedure Scene_Set_Px(This: in out Scene;
                           Y, X: Positive;
                           Value: Color.Color) is
    begin
      This.Img(Y * This.Width + X) := Value;
    end Scene_Set_Px;

    procedure Scene_Set_Triangle(This: in out Scene;
                                 Index: Positive;
                                 Value: Triangle.Triangle) is
    begin
       This.Triangles(Index) := Value;
    end Scene_Set_Triangle;

    procedure Scene_Set_Height(This: in out Scene;                                        
                              H: Positive) is
    begin
      This.Height := H;
    end Scene_Set_Height;

    procedure Scene_Set_Width(This: in out Scene;                                         
                              W: Positive) is
    begin
      This.Width := W;
    end Scene_Set_Width;
 
    --procedure Scene_Render_Triangle(This: Scene) is
    --begin 
    --end Scene_Render_Triangle;

    procedure Scene_Render(This: Scene) is
        F : File_Type;
        V0, V1, V2, P: Vector.Vector;
        C0, C1, C2: Color.Color;
        Area, W0, W1, W2, R, G, B: Float;
        Frame_Buffer : Frame := (0 .. (This.Width * This.Height - 1) => (0.0, 0.0, 0.0));
    begin 
        for T in Natural range 1 .. This.Nb_Triangles loop
            Put_Line(Natural'Image(T) & ":");
            V0 := Matrix.Matrix_To_Vector(
                Matrix_Mult(
                    Vector_To_Matrix(Triangle_Get_Vector(This.Triangles(T), 1)),
                    Camera.Get_Transform_Matrix(This.Cam,
                        Triangle_Get_Vector(This.Triangles(T), 1),
                        128, 128)));
            V1 := Matrix.Matrix_To_Vector(
                Matrix_Mult(
                    Vector_To_Matrix(Triangle_Get_Vector(This.Triangles(T), 2)),
                    Camera.Get_Transform_Matrix(This.Cam,
                        Triangle_Get_Vector(This.Triangles(T), 2),
                        128, 128)));
            V2 := Matrix.Matrix_To_Vector(
                Matrix_Mult(
                    Vector_To_Matrix(Triangle_Get_Vector(This.Triangles(T), 3)),
                    Camera.Get_Transform_Matrix(This.Cam,
                        Triangle_Get_Vector(This.Triangles(T), 3),
                        128, 128))); 
            V0 := Vector.Vector_Camera_To_Raster_Space(V0, 0, 127, 0, 127, 128, 128);
            V1 := Vector.Vector_Camera_To_Raster_Space(V1, 0, 127, 0, 127, 128, 128);
            V2 := Vector.Vector_Camera_To_Raster_Space(V2, 0, 127, 0, 127, 128, 128);
            Vector.Vector_Print(V0);
            Vector.Vector_Print(V1);
            Vector.Vector_Print(V2);
            C0 := Triangle_Get_Color(This.Triangles(T), 1);
            C1 := Triangle_Get_Color(This.Triangles(T), 2);
            C2 := Triangle_Get_Color(This.Triangles(T), 3);
            Area := Vector_Edge(V0, V1, V2);  
            for J in Natural range 0 .. (This.Height - 1) loop
                for I in Natural range 0 .. (This.Width - 1) loop
                    P := (Float(I), Float(J), 0.0);
                    W0 := Vector_Edge(V1, V2, P);
                    W1 := Vector_Edge(V2, V0, P);
                    W2 := Vector_Edge(V0, V1, P);
                    if W0 >= 0.0 and W1 >= 0.0 and W2 >= 0.0 then
                        W0 := W0 / Area;
                        W1 := W1 / Area;
                        W2 := W2 / Area;
                        R := W0 * C0(1) + W1 * C1(1) + W2 * C2(1);
                        G := W0 * C0(2) + W1 * C1(2) + W2 * C2(2);
                        B := W0 * C0(3) + W1 * C1(3) + W2 * C2(3);
                        Frame_Buffer(J * This.Width + I) := (1.0, 1.0, 1.0); 
                        Put_Line(Natural'Image(J) & " " & Natural'Image(I));
                    end if;
                end loop;
            end loop;
        end loop;

        Create(F, Out_File, "/tmp/test2.ppm");
        Put_Line(F, "P3");
        Put_Line(F, Natural'Image(This.Width) & " " & Natural'Image(This.Height));
        Put_Line(F, "255");
        for J in Natural range 0 .. (This.Height - 1) loop
            for I in Natural range 0 .. (This.Width - 1) loop
                Put(F, Natural'Image(Natural(Color_Get(Frame_Buffer(J * This.Width + I),
                1) * 255.0))
                & " " & Natural'Image(Natural(Color_Get(Frame_Buffer(J * This.Width
                + I), 2) * 255.0))
                & " " & Natural'Image(Natural(Color_Get(Frame_Buffer(J * This.Width
                + I), 3) * 255.0)) & " ");
            end loop;
        end loop;
        Close(F);
    end Scene_Render;

end Scene;
