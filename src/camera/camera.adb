with Vector;

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
        D, R, U: Vector.Vector;
    begin
        D := Cam.Direction;
        R := Vector.Vector_Mult(D, Cam.Up);
        U := Vector.Vector_Mult(R, D);
        D := Vector.Vector_Normalize(D);
        R := Vector.Vector_Normalize(R);
        U := Vector.Vector_Normalize(U);
        return (This(1) * R(1) + This(2) * U(1) + This(3) * (-D(1))
            , This(1) * R(2) + This(2) * U(2) + This(3) * (-D(2))
            , This(1) * R(3) + This(2) * U(3) + This(3) * (-D(3)));
    end Vector_World_To_Camera_Space;


end Camera;
