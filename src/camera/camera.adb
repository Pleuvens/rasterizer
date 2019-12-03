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

end Camera;
