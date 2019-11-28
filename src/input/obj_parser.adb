with Ada.Text_IO; use Ada.Text_IO;

with Scene; use Scene;

package body OBJ_Parser is

    function Read_3_Float(Line: String;
                           V: in out Vector.Vector) return Boolean is
        I, I1, I2, I3: Natural := 0;
    begin
        while I < Line'Last and Line(I) != ' ' loop
            I := I + 1;
        end loop;
        if I = Line'Last then
            return false;
        end if;
        I1 := I;
        while I < Line'Last and Line(I) != ' ' loop
            I := I + 1;
        end loop;
        if I = Line'Last then
            return false;
        end if;
        I2 := I;
        while I < Line'Last and Line(I) != ' ' loop
            I := I + 1;
        end loop;
        if I = Line'Last then
            return false;
        end if;
        I3 := I;
        Vector_Set(V, 1, Float(Line((I1 + 1) .. (I2 - 1))));
        Vector_Set(V, 2, Float(Line((I2 + 1) .. (I3 - 1))));
        Vector_Set(V, 3, Float(Line((I3 + 1) .. Line'Last)));
        return true;
    end Read_3_Values;

    function Parse(FileName: String;
                   S: out Scene.Scene) return Scene.Scene is
        Nb_V, Nb_Vn, Nb_G, Nb_f, I, Tr_Cnt : Natural := 0;
        File: File_Type;
        Line: String;
        V, Vn : Vector_Arr(1 .. 512);
    begin
        Open (File => File,
        Mode => In_File,
        Name => FileName);
        While not  End_Of_File (File) Loop
            Line := Get_Line (File);
            if Line(1) = '#' then
                continue;
            end if;
            V := Create_Vector(0.0, 0.0, 0.0);
            if Line(1..2) = "vn" and Read_3_Float(Line, V) then
                V(Nb_V) := V;
                Nb_V := Nb_V + 1;
            elsif Line(1) = 'v' and Read_3_Float(Line, V) then
                Vn(Nb_Vn) := Vn;
                Nb_Vn := Nb_Vn + 1;
            elsif Line(1) = 'g' then
                --Scene_Add_Group(S, G);
            elsif Line(1) = 'f' then
                --Scene_Add_Face(S);
            end if;
        end loop;
        Close (File);
        S := Create_Scene(H, W, Nb_V / 3, (0.0, 0.0, 0.0)); 
        if Nb_V != Nb_Vn or Nb_V mod 3 != 0 then
            return false;
        end if;

        while I < Nb_V loop
            Scene_Set_Triangle(S, Tr_Cnt, Triangle_Create((V(I), V(I + 1), V(I + 2)),
            (Vn(I), Vn(I + 1), Vn(I + 2)), (0.0, 0.0, 0.0));
            I := I + 3;
            Tr_Cnt := Tr_Cnt + 1;
        end loop;
        return true;
    end Parse;

end OBJ_Parser;
