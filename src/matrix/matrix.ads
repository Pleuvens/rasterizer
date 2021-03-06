with Vector;

package Matrix with
    SPARK_Mode => On
is

    type Float_Arr is array (Natural range <>) of Float
        with Default_Component_Value => 0.0;

    type Matrix(H, W, Size: Positive) is record
        Height: Natural := H;
        Width: Natural := W;
        Values: Float_Arr (0 .. Size);
    end record;

    function Matrix_Create(H, W: Natural; Values: Float_Arr) return Matrix;
    function Matrix_Coord_Valid(This: Matrix; J, I: Natural) return Boolean;
    function Matrix_Identity(H, W, Size: Natural) return Matrix with
        Pre => H * W - 1 = Size;
    function Matrix_Translation(X, Y, Z: Float) return Matrix;
    function Matrix_Scaling(X, Y, Z: Float) return Matrix;
    function Matrix_Rotation_X(R: Float) return Matrix;
    function Matrix_Rotation_Y(R: Float) return Matrix;
    function Matrix_Rotation_Z(R: Float) return Matrix;
    function Matrix_Get_Value(This: Matrix; J, I: Natural) return Float with
        Pre => J <= This.Height and I <= This.Width;
    procedure Matrix_Set_Value(This: in out Matrix; J, I: Natural; Value: Float) with
        Pre => J <= This.Height and I <= This.Width;
    function Matrix_Transpose(This: Matrix) return Matrix;
    function Matrix_Equals(M, M2: Matrix) return Boolean;
    function Matrix_Add(M, M2: Matrix) return Matrix with
        Pre => M.Width = M2.Width and M.Height = M2.Height;
    function Matrix_Mult(M, M2: Matrix) return Matrix with
        Pre => M.Width = M2.Height;
    function Matrix_Mult(M: Matrix; Value: Float) return Matrix;
    function Vector_To_Matrix(V: Vector.Vector) return Matrix;
    function Matrix_To_Vector(M: Matrix) return Vector.Vector;
end Matrix;
