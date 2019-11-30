with Ada.Text_IO;  use Ada.Text_IO;

with Vector; use Vector;
with Color; use Color;
with Triangle; use Triangle;

package body Scene is

    function Scene_Create(H, W, Nb_Tr: Positive;
                          Cam: Vector.Vector) return Scene is
      S : Scene(H, W, H * W, Nb_Tr);
    begin
        S.Camera := Cam;
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
        Frame_Buffer : Frame := (1 .. (This.Width * This.Height) => (0.0, 0.0, 0.0));
    begin 
        for T in Natural range 1 .. This.Nb_Triangles loop
            V0 := Triangle_Get_Vector(This.Triangles(T), 1);
            V1 := Triangle_Get_Vector(This.Triangles(T), 2);
            V2 := Triangle_Get_Vector(This.Triangles(T), 3);
            C0 := Triangle_Get_Color(This.Triangles(T), 1);
            C1 := Triangle_Get_Color(This.Triangles(T), 2);
            C2 := Triangle_Get_Color(This.Triangles(T), 3);
            Area := Vector_Edge(V0, V1, V2); 

            for J in Natural range 1 .. This.Height loop
                for I in Natural range 1 .. This.Width loop
                    P := (Float(I) + 0.5, Float(J) + 0.5, 0.0);
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
                        Frame_Buffer(J * This.Width + I) := (R, G, B); 
                    else
                        Frame_Buffer(J * This.Width + I) := (0.0, 0.0, 0.0);
                    end if;
                end loop;
            end loop;
        end loop;
        Create(F, Out_File, "/tmp/test2.ppm");
        Put_Line(F, "P3");
        Put_Line(F, Natural'Image(This.Width) & " " & Natural'Image(This.Height));
        Put_Line(F, "255");
        for J in Natural range 1 .. This.Height loop
            for I in Natural range 1 .. This.Width loop
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
