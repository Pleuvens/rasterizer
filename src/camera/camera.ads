with Vector;
with Matrix;

package Camera is

    type Camera is record
        Position: Vector.Vector;
        Look_At : Vector.Vector;
        Up: Vector.Vector;
        Right: Vector.Vector;
        FOV: Float;
        Near: Float;
        Far: Float;
    end record;

    function To_Degree(Value: Float) return Float;
    function To_Radian(Value: Float) return Float;

    function Camera_Create(Pos, Look_At, Up, Right: Vector.Vector;
                           FOV, Near, Far: Float) return Camera;
    function Camera_Equals(Cam, Cam2: Camera) return Boolean;

    function Camera_Get_Position(This: Camera) return Vector.Vector;
    function Camera_Get_Look_At(This: Camera) return Vector.Vector;
    function Camera_Get_Up(This: Camera) return Vector.Vector;
    function Camera_Get_Right(This: Camera) return Vector.Vector;
    
    procedure Camera_Set_Position(This: in out Camera; Value: Vector.Vector);
    procedure Camera_Set_Look_At(This: in out Camera; Value: Vector.Vector);
    procedure Camera_Set_Up(This: in out Camera; Value: Vector.Vector);
    procedure Camera_Set_Right(This: in out Camera; Value: Vector.Vector);

    procedure Init_Perspective_Proj_Matrix(This: Camera; H, W: Positive;
                                           M : out Matrix.Matrix);
    procedure Init_Camera_Transform_Matrix(Cam: Camera; M: out Matrix.Matrix);
    function Get_Transform_Matrix(This: Camera; V: Vector.Vector; H, W: Positive)
        return Matrix.Matrix;
end Camera;
