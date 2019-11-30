with Ada.Text_IO; use Ada.Text_IO;

with Color; use Color;
with Triangle; use Triangle;
with Scene; use Scene;

package body OBJ_Parser is

    procedure Skip_Spaces(Line: String; I: in out Natural) is
    begin
        while I < Line'Last and Line(I) = ' ' loop
            I := I + 1;
        end loop;
    end Skip_Spaces;

    procedure Get_Next_Token_End_Index(Line: String; I: in out Natural) is
    begin
        while I < Line'Last and Line(I) /= ' ' loop
            I := I + 1;
        end loop;
    end Get_Next_Token_End_Index;

    function Read_3_Float(Line: String;
        V: in out Vector.Vector) return Boolean is
        I, T1_Start, T1_End, T2_Start, T2_End, T3_Start, T3_End: Natural := Line'First;
    begin 
        Get_Next_Token_End_Index(Line, I);
        Skip_Spaces(Line, I); 
        if I = Line'Last then
            return false;
        end if;
        T1_Start := I;
        Get_Next_Token_End_Index(Line, I);
        T1_End := I;
        Skip_Spaces(Line, I);
        if I = Line'Last then
            return false;
        end if;
        T2_Start := I;
        Get_Next_Token_End_Index(Line, I);
        T2_End := I;
        Skip_Spaces(Line, I);
        T3_Start := I;
        Vector.Vector_Set(V, 1, Float'Value(Line(T1_Start .. T1_End)));
        Vector.Vector_Set(V, 2, Float'Value(Line(T2_Start .. T2_End)));
        Vector.Vector_Set(V, 3, Float'Value(Line(T3_Start .. Line'Last)));
        Vector.Vector_Print(V);
        return true;
    end Read_3_Float;

    function Parse(File_Name: String;
        S: out Scene.Scene) return Boolean is
        Nb_V, Nb_Vn, Nb_G, Nb_f, I, Tr_Cnt : Natural := 0;
        File: File_Type;
        V, Vn : Vector.Vector;
        Vs, Vns : Vector_Arr(1 .. 65000);
        C: Color.Color := (0.0, 0.0, 0.0);
    begin
        Open (File => File,
        Mode => In_File,
        Name => File_Name);
        while not  End_Of_File (File) Loop
            declare
                Line : String := Get_Line(File);
            begin
                if Line'Last > Line'First then 
                    if Line(Line'First..(Line'First + 1)) = "vn" 
                    then
                        if not Read_3_Float(Line, Vn) then
                            return false;
                        end if;
                        Vns(Nb_Vn + 1) := Vn;
                        Nb_Vn := Nb_Vn + 1; 
                    elsif Line(Line'First) = 'v'
                    then
                        if not Read_3_Float(Line, V) then
                            return false;
                        end if;
                        Vs(Nb_V + 1) := V;
                        Nb_V := Nb_V + 1;
                    end if;
                end if;
            end;
        end loop;
        Close (File);
        Put_Line(Natural'Image(Nb_V));
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
