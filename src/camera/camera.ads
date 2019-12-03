with Vector;

package Camera is

    type Camera is record
        Position : Vector.Vector;
        Direction: Vector.Vector;
        Up: Vector.Vector;
    end record;

    function Camera_Create(Pos, Dir, Up: Vector.Vector) return Camera;
    function Camera_Equals(Cam, Cam2: Camera) return Boolean;

    function Camera_Get_Pos(This: Camera) return Vector.Vector;
    function Camera_Get_Dir(This: Camera) return Vector.Vector;
    function Camera_Get_Up(This: Camera) return Vector.Vector;
    
    procedure Camera_Set_Pos(This: in out Camera; Value: Vector.Vector);
    procedure Camera_Set_Dir(This: in out Camera; Value: Vector.Vector);
    procedure Camera_Set_Up(This: in out Camera; Value: Vector.Vector);

    function Vector_World_To_Camera_Space(This: Vector.Vector; Cam: Camera)
        return Vector.Vector;

end Camera;
