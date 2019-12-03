with Ada.Text_IO; use Ada.Text_IO;

with Color; use Color;
with Triangle; use Triangle;
with Scene; use Scene;

package body OBJ_Parser is

    procedure Skip_Char(Line: String; I: in out Natural; C: Character) is
    begin
        while I < Line'Last and Line(I) = C loop
            I := I + 1;
        end loop;
    end Skip_Char;

    procedure Get_Next_Char(Line: String; I: in out Natural; C: Character) is
    begin
        while I < Line'Last and Line(I) /= C loop
            I := I + 1;
        end loop;
    end Get_Next_Char;

    function Read_Vector(Line: String;
        V: in out Vector.Vector) return Boolean is
        I, T1_Start, T1_End, T2_Start, T2_End, T3_Start: Natural := Line'First;
    begin 
        Get_Next_Char(Line, I, ' ');
        Skip_Char(Line, I, ' '); 
        if I = Line'Last then
            return false;
        end if;
        T1_Start := I;
        Get_Next_Char(Line, I, ' ');
        T1_End := I;
        Skip_Char(Line, I, ' ');
        if I = Line'Last then
            return false;
        end if;
        T2_Start := I;
        Get_Next_Char(Line, I, ' ');
        T2_End := I;
        Skip_Char(Line, I, ' ');
        T3_Start := I;
        Vector.Vector_Set(V, 1, Float'Value(Line(T1_Start .. T1_End)));
        Vector.Vector_Set(V, 2, Float'Value(Line(T2_Start .. T2_End)));
        Vector.Vector_Set(V, 3, Float'Value(Line(T3_Start .. Line'Last)));
        return true;
    end Read_Vector;

    procedure Read_Face_V_Vn_Without_Texture(Token: String;
        Vs, Vns: Vector_Arr;
        V_Index, Vn_Index: in out Natural) is
        I, V_Start, V_End, Vn_Start: Natural := Token'First;
    begin
        Get_Next_Char(Token, I, '/');
        V_End := I - 1;
        Skip_Char(Token, I, '/');
        Vn_Start := I;
        if V_Start = V_End then
            V_Index := Character'Pos(Token(V_Start)) - 48;
        else
            V_Index := Natural'Value(Token(V_Start .. V_End));
        end if;
        if Vn_Start = Token'Last then
            Vn_Index := Character'Pos(Token(Vn_Start)) - 48;
        else
            Vn_Index := Natural'Value(Token(Vn_Start .. Token'Last));
        end if;
    end Read_Face_V_Vn_Without_Texture;

    function Read_Face(Line: String;
        Vs, Vns: Vector_Arr;
        T: in out Triangle.Triangle) return Boolean is
        I, T1_Start, T1_End, T2_Start, T2_End, T3_Start, V_Index, Vn_Index: Natural
        := Line'First;
    begin
        Get_Next_Char(Line, I, ' ');
        Skip_Char(Line, I, ' ');
        if I = Line'Last then
            return false;
        end if;
        T1_Start := I;
        Get_Next_Char(Line, I, ' ');
        T1_End := I;
        Skip_Char(Line, I, ' ');
        if I = Line'Last then
            return false;
        end if;
        T2_Start := I;
        Get_Next_Char(Line, I, ' ');
        T2_End := I;
        Skip_Char(Line, I, ' ');
        T3_Start := I;

        Read_Face_V_Vn_Without_Texture(Line(T1_Start .. T1_End), Vs, Vns, V_Index,
        Vn_Index);
        Triangle.Triangle_Set_Vector(T, 1, Vs(V_Index));
        Triangle.Triangle_Set_Vector_Normal(T, 1, Vns(Vn_Index));
        Read_Face_V_Vn_Without_Texture(Line(T2_Start .. T2_End), Vs, Vns, V_Index,
        Vn_Index);
        Triangle.Triangle_Set_Vector(T, 2, Vs(V_Index));
        Triangle.Triangle_Set_Vector_Normal(T, 2, Vns(Vn_Index));
        Read_Face_V_Vn_Without_Texture(Line(T3_Start .. Line'Last), Vs, Vns, V_Index,
        Vn_Index);
        Triangle.Triangle_Set_Vector(T, 3, Vs(V_Index));
        Triangle.Triangle_Set_Vector_Normal(T, 3, Vns(Vn_Index));
        return true;
    end Read_Face;

    function Parse(File_Name: String;
        S: out Scene.Scene) return Boolean is
        Nb_V, Nb_Vn, Nb_G, Nb_f, I, Nb_T, Tr_Cnt : Natural := 0;
        File: File_Type;
        V, Vn : Vector.Vector;
        Vs, Vns : Vector_Arr(1 .. 128);
        T : Triangle.Triangle;
        Ts : Triangle_Arr(1 .. 128);
        C: Color.Color := (1.0, 1.0, 1.0);
    begin
        T := Triangle.Triangle_Create((V, V, V), (V, V, V), (C, C, C));
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
                        if not Read_Vector(Line, Vn) then
                            return false;
                        end if;
                        Vns(Nb_Vn + 1) := Vn;
                        Nb_Vn := Nb_Vn + 1; 
                    elsif Line(Line'First) = 'v'
                    then
                        if not Read_Vector(Line, V) then
                            return false;
                        end if;
                        Vs(Nb_V + 1) := V;
                        Nb_V := Nb_V + 1;
                    elsif Line(Line'First) = 'f'
                    then
                        if not Read_Face(Line, Vs, Vns, T) then
                            return false;
                        end if;
                        Ts(Nb_T + 1) := T;
                        Nb_T := Nb_T + 1;
                    end if;
                end if;
            end;
        end loop;
        Close (File);
        S := Scene.Scene_Create(128, 128, Nb_T, (0.5, 0.5, 0.0));
        while Tr_Cnt < Nb_T loop
            Scene_Set_Triangle(S, Tr_Cnt + 1, Ts(Tr_Cnt + 1));
            Tr_Cnt := Tr_Cnt + 1;
        end loop;
        return true;
    end Parse;

end OBJ_Parser;
