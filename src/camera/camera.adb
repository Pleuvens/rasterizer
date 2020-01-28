with Vector;
with Matrix;

with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body Camera is

    function To_Degree(Value: Float) return Float is
    begin
        return (Value * 180.0) / Ada.Numerics.Pi;
    end;

    function To_Radian(Value: Float) return Float is
    begin
        return (Value * Ada.Numerics.Pi) / 180.0;
    end;

    function Camera_Create(Pos, Look_At, Up, Right: Vector.Vector;
                           FOV, Near, Far: Float) return Camera is
    begin
        return (Pos, Look_At, Up, Right, FOV, Near, Far);
    end Camera_Create;

    function Camera_Equals(Cam, Cam2: Camera) return Boolean is
    begin
        return Vector.Vector_Equals(Cam.Position, Cam2.Position) and
        Vector.Vector_Equals(Cam.Look_At, Cam2.Look_At) and
        Vector.Vector_Equals(Cam.Up, Cam2.Up) and
        Vector.Vector_Equals(Cam.Right, Cam2.Right);
    end Camera_Equals;

    function Camera_Get_Position(This: Camera) return Vector.Vector is
    begin
        return This.Position;
    end;

    function Camera_Get_Look_At(This: Camera) return Vector.Vector is
    begin
        return This.Look_At;
    end; 

    function Camera_Get_Up(This: Camera) return Vector.Vector is
    begin
        return This.Up;
    end Camera_Get_Up;

    function Camera_Get_Right(This: Camera) return Vector.Vector is
    begin
        return This.Right;
    end;

    procedure Camera_Set_Position(This: in out Camera; Value: Vector.Vector) is
    begin
        This.Position := Value;
    end;

    procedure Camera_Set_Look_At(This: in out Camera; Value: Vector.Vector) is
    begin
        This.Look_At := Value;
    end;

    procedure Camera_Set_Up(This: in out Camera; Value: Vector.Vector) is
    begin
        This.Up := Value;
    end Camera_Set_Up;

    procedure Camera_Set_Right(This: in out Camera; Value: Vector.Vector) is
    begin
        This.Right := Value;
    end;

    procedure Init_Perspective_Proj_Matrix(This: Camera; H, W: Positive;
                                           M : out Matrix.Matrix) is
        Aspect_Ratio, Z_Range, Half_V_FOV: Float;
    begin
        Aspect_Ratio := Float(W) / Float(H);
        Z_Range := This.Near - This.Far;
        Half_V_FOV := Tan(To_Radian(This.FOV / 2.0));
        Matrix.Matrix_Set_Value(M, 0, 0, (1.0 / (Half_V_FOV * Aspect_Ratio)));
        Matrix.Matrix_Set_Value(M, 1, 1, (1.0 / Half_V_FOV ));
        Matrix.Matrix_Set_Value(M, 2, 2, (((-This.Near) - This.Far) / Z_Range));
        Matrix.Matrix_Set_Value(M, 2, 3, ((2.0 * This.Near * This.Far) / Z_Range));
        Matrix.Matrix_Set_Value(M, 3, 2, 1.0);
    end;


    procedure Init_Camera_Transform_Matrix(Cam: Camera; M: out Matrix.Matrix) is
        U, V, N: Vector.Vector;
    begin
        N := Vector.Vector_Normalize(Cam.Look_At);
        U := Vector.Vector_Mult(Cam.Up, Cam.Look_At);
        U := Vector.Vector_Normalize(U);
        V := Vector.Vector_Mult(N, U);

        Matrix.Matrix_Set_Value(M, 0, 0, Vector.Vector_Get(U, 1));
        Matrix.Matrix_Set_Value(M, 0, 1, Vector.Vector_Get(U, 2));
        Matrix.Matrix_Set_Value(M, 0, 2, Vector.Vector_Get(U, 3));
        Matrix.Matrix_Set_Value(M, 1, 0, Vector.Vector_Get(V, 1));
        Matrix.Matrix_Set_Value(M, 1, 1, Vector.Vector_Get(V, 2));
        Matrix.Matrix_Set_Value(M, 1, 2, Vector.Vector_Get(V, 3));
        Matrix.Matrix_Set_Value(M, 2, 0, Vector.Vector_Get(N, 1));
        Matrix.Matrix_Set_Value(M, 2, 1, Vector.Vector_Get(N, 2));
        Matrix.Matrix_Set_Value(M, 2, 2, Vector.Vector_Get(N, 3));
        Matrix.Matrix_Set_Value(M, 3, 3, 1.0);
    end;

    function Get_Transform_Matrix(This: Camera; V: Vector.Vector; H, W: Positive)
        return Matrix.Matrix is
        Scale, Rotate, Translate, Camera_Translate, Camera_Rotate, Perspective_Matrix: Matrix.Matrix(4, 4, 15);
    begin
        Scale := Matrix.Matrix_Identity(4, 4, 15);--Matrix.Matrix_Scaling(1.0, 1.0, 1.0);
        Rotate := Matrix.Matrix_Identity(4, 4, 15);--Matrix.Matrix_Rotation_X?(0.0, 0.0, 0.0);
        Translate :=
            Matrix.Matrix_Translation(Vector.Vector_Get(V, 1),
                Vector.Vector_Get(V, 2),
                Vector.Vector_Get(V, 3));
        Camera_Translate := 
            Matrix.Matrix_Translation((-Vector.Vector_Get(This.Position, 1)),
                (-Vector.Vector_Get(This.Position, 2)),
                (-Vector.Vector_Get(This.Position, 3)));
        Init_Camera_Transform_Matrix(This, Camera_Rotate);
        Init_Perspective_Proj_Matrix(This, H, W, Perspective_Matrix);
        return Matrix.Matrix_Mult(Perspective_Matrix,
                Matrix.Matrix_Mult(Camera_Rotate,
                Matrix.Matrix_Mult(Camera_Translate,
                Matrix.Matrix_Mult(Translate,
                Matrix.Matrix_Mult(Rotate, Scale)))));
    end; 

end Camera;
