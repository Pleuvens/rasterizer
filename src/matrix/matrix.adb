with Ada.Text_IO; use Ada.Text_IO;

with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

with Vector;

package body Matrix
is

    function Matrix_Create(H, W: Natural; Values: Float_Arr) return Matrix is
        M: Matrix(H, W, H * W - 1);
    begin
        M.Values := Values;
        return M;
    end;

    function Matrix_Coord_Valid(This: Matrix; J, I: Natural) return Boolean is
    begin
        return J <= This.Height and I <= This.Width;
    end;

    function Matrix_Identity(H, W, Size: Natural) return Matrix 
    is
        M: Matrix(H, W, Size);
    begin
        for I in Natural range 0 .. (H - 1) loop
            Matrix_Set_Value(M, I, I, 1.0);
        end loop;
        return M;
    end;

    function Matrix_Translation(X, Y, Z: Float) return Matrix is
        M: Matrix(4, 4, 15);
    begin
        M.Values := (1.0, 0.0, 0.0,   X,
                     0.0, 1.0, 0.0,   Y,
                     0.0, 0.0, 1.0,   Z,
                     0.0, 0.0, 0.0, 1.0);
        return M;
    end;

    function Matrix_Scaling(X, Y, Z: Float) return Matrix is
        M: Matrix(4, 4, 15);
    begin
        M.Values := (  X, 0.0, 0.0, 0.0,
                     0.0,   Y, 0.0, 0.0,
                     0.0, 0.0,   Z, 0.0,
                     0.0, 0.0, 0.0, 1.0);
        return M;
    end;

    function Matrix_Rotation_X(R: Float) return Matrix is
        M: Matrix(4, 4, 15);
    begin
        M.Values := (1.0,    0.0,       0.0, 0.0,
                     0.0, Cos(R), (-Sin(R)), 0.0,
                     0.0, Sin(R),    Cos(R), 0.0,
                     0.0,    0.0,       0.0, 1.0);
        return M;
    end;

    function Matrix_Rotation_Y(R: Float) return Matrix is
        M: Matrix(4, 4, 15);
    begin
        M.Values := (   Cos(R),    0.0,    Sin(R), 0.0,
                           0.0,    1.0,       0.0, 0.0,
                     (-Sin(R)),    0.0,    Cos(R), 0.0,
                           0.0,    0.0,       0.0, 1.0);
        return M;
    end;

    function Matrix_Rotation_Z(R: Float) return Matrix is
        M: Matrix(4, 4, 15);
    begin
        M.Values := (Cos(R), (-Sin(R)), 0.0, 0.0,
                     Sin(R),    Cos(R), 0.0, 0.0,
                        0.0,       0.0, 1.0, 0.0,
                        0.0,       0.0, 0.0, 1.0);
        return M;
    end;


    function Matrix_Get_Value(This: Matrix; J, I: Natural) return Float
    is
    begin
        return This.Values(J * This.Width + I);
    end;

    procedure Matrix_Set_Value(This: in out Matrix; J, I: Natural; Value: Float)
    is
    begin
        This.Values(J * This.Width + I) := Value;
    end;

    function Matrix_Transpose(This: Matrix) return Matrix is
        M: Matrix(This.Width, This.Height, This.Width * This.Height);
    begin
        for J in Natural range 1 .. This.Height loop
            for I in Natural range 1 .. This.Width loop
               Matrix_Set_Value(M, I, J, Matrix_Get_Value(This, J, I));
            end loop;
        end loop;
        return M;
    end;

    function Matrix_Equals(M, M2: Matrix) return Boolean is
    begin
        if M.Width /= M2.Width then
            return false;
        end if;
        if M.Height /= M2.Height then
            return false;
        end if;
        for J in Natural range 0 .. (M.Height - 1) loop
            for I in Natural range 0 .. (M.Width - 1) loop
                if Matrix_Get_Value(M, J, I) /= Matrix_Get_Value(M2, J, I) then
                    return false;
                end if;
            end loop;
        end loop;
        return true;
    end;

    function Matrix_Add(M, M2: Matrix) return Matrix
    is
        Res: Matrix(M.Height, M.Width, M.Height * M.Width - 1);
    begin
        for J in Natural range 0 .. (M.Height - 1) loop
            For I in Natural range 0 .. (M.Width - 1) loop
                Matrix_Set_Value(Res, J, I, Matrix_Get_Value(M, J, I)
                + Matrix_Get_Value(M2, J, I));
            end loop;
        end loop;
        return Res;
    end;

    function Matrix_Mult(M, M2: Matrix) return Matrix
    is
        Res: Matrix(M.Height, M2.Width, M.Height * M2.Width - 1);
    begin
        for J in Natural range 0 .. (M.Height - 1) loop
            For I in Natural range 0 .. (M2.Width - 1) loop
                Matrix_Set_Value(Res, J, I, 0.0);
                for K in Natural range 0 .. (M2.Height - 1) loop
                    Matrix_Set_Value(Res, J, I, Matrix_Get_Value(Res, J, I)
                    + Matrix_Get_Value(M, J, K)
                    * Matrix_Get_Value(M2, K, I));
                end loop;
            end loop;
        end loop;
        return Res;
    end;

    function Matrix_Mult(M: Matrix; Value: Float) return Matrix is
        Res: Matrix(M.Height, M.Width, M.Height * M.Width);
    begin
        for J in Natural range 0 .. (M.Height - 1) loop
            For I in Natural range 0 .. (M.Width - 1) loop
                Matrix_Set_Value(Res, J, I, Matrix_Get_Value(M, J, I) * Value);
            end loop;
        end loop;
        return Res;
    end;

    function Vector_To_Matrix(V: Vector.Vector) return Matrix is
        M: Matrix(1, 4, 3);
    begin
        M.Values := (Vector.Vector_Get(V, 1),
        Vector.Vector_Get(V, 2), Vector.Vector_Get(V, 3), 1.0);
        return M;
    end;

    function Matrix_To_Vector(M: Matrix) return Vector.Vector is
        V: Vector.Vector;
    begin
        Vector.Vector_Set(V, 1, Matrix_Get_Value(M, 0, 0));
        Vector.Vector_Set(V, 2, Matrix_Get_Value(M, 0, 1));
        Vector.Vector_Set(V, 3, Matrix_Get_Value(M, 0, 2));
        return V;
    end;

end Matrix;
