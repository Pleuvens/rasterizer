with Vector; use Vector;
with Color; use Color;
with Triangle; use Triangle;
-- with PPM_Parser; use PPM_Parser;
with Ada.Text_IO; use Ada.Text_IO;

procedure Simple_Triangle is

    type Frame_B is array(1 .. 262144) of Color.Color;

    V0, V1, V2, P: Vector.Vector;
    C0, C1, C2: Color.Color;
    W, H: Natural;
    Area, W0, W1, W2, R, G, B: Float;
    Frame_Buffer : Frame_B := (1 .. 262144 => (0.0, 0.0, 0.0));
    F : File_Type;
begin
    V0 := (491.407, 411.407, 0.0);
    V1 := (148.593, 68.5928, 0.0);
    V2 := (148.593, 411.407, 0.0);
    C0 := (1.0, 0.0, 0.0);
    C1 := (0.0, 1.0, 0.0);
    C2 := (0.0, 0.0, 1.0);
    W := 512;
    H := 512;
    Area := Vector_Edge(V0, V1, V2);

    Create(F, Out_File, "/tmp/test.ppm");
    Put_Line(F, "P3");
    Put_Line(F, Natural'Image(W) & " " & Natural'Image(H));
    Put_Line(F, "255");

    for J in Natural range 1 .. H loop
        for I in Natural range 1 .. W loop
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
                Frame_Buffer(J * W + I) := (R, G, B);
                Put(F, Natural'Image(Natural(R * 255.0)) & " "
                & Natural'Image(Natural(G * 255.0)) & " "
                & Natural'Image(Natural(B * 255.0)) & " ");
            else
                Put(F, Natural'Image(0) & " "
                & Natural'Image(0) & " "
                & Natural'Image(0) & " ");
            end if;
        end loop;
    end loop;
    Close(F);

end Simple_Triangle;
