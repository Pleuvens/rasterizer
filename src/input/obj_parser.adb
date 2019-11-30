with Ada.Text_IO; use Ada.Text_IO;

with Color; use Color;
with Triangle; use Triangle;
with Scene; use Scene;

package body OBJ_Parser is

    function Read_3_Float(Line: String;
                           V: in out Vector.Vector) return Boolean is
        I, I1, I2, I3: Natural := 0;
    begin
        while I < Line'Last and Line(I) /= ' ' loop
            I := I + 1;
        end loop;
        if I = Line'Last then
            return false;
        end if;
        I1 := I;
        while I < Line'Last and Line(I) /= ' ' loop
            I := I + 1;
        end loop;
        if I = Line'Last then
            return false;
        end if;
        I2 := I;
        while I < Line'Last and Line(I) /= ' ' loop
            I := I + 1;
        end loop;
        if I = Line'Last then
            return false;
        end if;
        I3 := I;
        Vector.Vector_Set(V, 1, Float'Value(Line((I1 + 1) .. (I2 - 1))));
        Vector.Vector_Set(V, 2, Float'Value(Line((I2 + 1) .. (I3 - 1))));
        Vector.Vector_Set(V, 3, Float'Value(Line((I3 + 1) .. Line'Last)));
        return true;
    end Read_3_Float;

    function Parse(File_Name: String;
                   S: out Scene.Scene) return Boolean is
        Nb_V, Nb_Vn, Nb_G, Nb_f, I, Tr_Cnt : Natural := 0;
        File: File_Type;
        Line: String(1 .. 2);
        V, Vn : Vector.Vector;
        Vs, Vns : Vector_Arr(1 .. 65000);
        C: Color.Color := (0.0, 0.0, 0.0);
    begin
        Open (File => File,
        Mode => In_File,
        Name => File_Name);
        while not  End_Of_File (File) Loop
            Put_Line(Get_Line (File));
            --if Line(1) = '#' then
            --    goto Continue;
            --end if;
            if false then
            V := Vector.Vector_Create(0.0, 0.0, 0.0);
            if Line(Line'First..(Line'First + 1)) = "vn" and Read_3_Float(Line, V) then
                Vs(Nb_V) := V;
                Nb_V := Nb_V + 1;
            elsif Line(Line'First) = 'v' and Read_3_Float(Line, Vn) then
                Vns(Nb_Vn) := Vn;
                Nb_Vn := Nb_Vn + 1;
            --elsif Line(1) = 'g' then
                --Scene_Add_Group(S, G);
            --elsif Line(1) = 'f' then
                --Scene_Add_Face(S);
            end if;
        end if;
        end loop;
        Close (File);
        if false then
        S := Scene.Scene_Create(128, 128, Nb_V / 3, (0.0, 0.0, 0.0));
        if Nb_V /= Nb_Vn or Nb_V mod 3 /= 0 then
            return false;
        end if;

        while I < Nb_V loop
            Scene_Set_Triangle(S, Tr_Cnt, Triangle.Triangle_Create((Vs(I),
            Vs(I + 1), Vs(I + 2)),
            (Vns(I), Vns(I + 1), Vns(I + 2)), (C, C, C)));
            I := I + 3;
            Tr_Cnt := Tr_Cnt + 1;
        end loop;
    end if;
        return true;
    end Parse;

end OBJ_Parser;
