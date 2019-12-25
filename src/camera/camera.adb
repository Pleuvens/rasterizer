with Vector;
with Matrix;

package body Camera is

    function Camera_Create(Pos, Dir, Up: Vector.Vector) return Camera is
    begin
        return (Pos, Dir, Up);
    end Camera_Create;

    function Camera_Equals(Cam, Cam2: Camera) return Boolean is
    begin
        return Vector.Vector_Equals(Cam.Position, Cam2.Position) and
        Vector.Vector_Equals(Cam.Direction, Cam2.Direction) and
        Vector.Vector_Equals(Cam.Up, Cam2.Up);
    end Camera_Equals;

    function Camera_Get_Pos(This: Camera) return Vector.Vector is
    begin
        return This.Position;
    end Camera_Get_Pos;

    function Camera_Get_Dir(This: Camera) return Vector.Vector is
    begin
        return This.Direction;
    end Camera_Get_Dir;

    function Camera_Get_Up(This: Camera) return Vector.Vector is
    begin
        return This.Up;
    end Camera_Get_Up;

    procedure Camera_Set_Pos(This: in out Camera; Value: Vector.Vector) is
    begin
        This.Position := Value;
    end Camera_Set_Pos;

    procedure Camera_Set_Dir(This: in out Camera; Value: Vector.Vector) is
    begin
        This.Direction := Value;
    end Camera_Set_Dir;

    procedure Camera_Set_Up(This: in out Camera; Value: Vector.Vector) is
    begin
        This.Up := Value;
    end Camera_Set_Up;

    function Vector_World_To_Camera_Space(This: Vector.Vector; Cam: Camera)
        return Vector.Vector is
        Eye_P: Vector.Vector := (1.0, 1.0, -5.0);
        View_Dir: Vector.Vector := (0.0, 0.0, -1.0);
        Up_Vect: Vector.Vector := (0.0, 1.0, 0.0);
        D, R, U: Vector.Vector;
        Vect_Matrix: Matrix.Matrix(1, 4, 3);
        M_T, M_R, Proj_Matrix: Matrix.Matrix(4, 4, 15);
    begin
        R := Vector.Vector_Mult(View_Dir, Up_Vect);
        U := Vector.Vector_Mult(R, View_Dir);
        R := Vector.Vector_Normalize(R);
        U := Vector.Vector_Normalize(U);
        D := Vector.Vector_Normalize(View_Dir);
        M_R := Matrix.Matrix_Create(4, 4,
        (Vector.Vector_Get(R, 1), Vector.Vector_Get(R, 1), Vector.Vector_Get(R, 1), 0.0,
         Vector.Vector_Get(U, 1), Vector.Vector_Get(U, 1), Vector.Vector_Get(U, 1), 0.0,
         -Vector.Vector_Get(D, 1), -Vector.Vector_Get(D, 1), -Vector.Vector_Get(D, 1), 0.0,
         0.0, 0.0, 0.0, 1.0));
        M_T := Matrix.Matrix_Create(4, 4, 
        (1.0, 0.0, 0.0, -Vector.Vector_Get(Eye_P, 1),
         0.0, 1.0, 0.0, -Vector.Vector_Get(Eye_P, 2),
         0.0, 0.0, 1.0, -Vector.Vector_Get(Eye_P, 3),
         0.0, 0.0, 0.0, 1.0));
        Proj_Matrix := Matrix.Matrix_Mult(M_R, M_T);
        Vect_Matrix := Matrix.Vector_To_Matrix(This);
        Vect_Matrix := Matrix.Matrix_Mult(Vect_Matrix, Proj_Matrix);
        return Matrix.Matrix_To_Vector(Vect_Matrix);
    end Vector_World_To_Camera_Space;


end Camera;
