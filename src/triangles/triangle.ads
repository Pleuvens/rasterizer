with Vector; use Vector;
with Color; use Color;

package Triangle is

    type Vector_Arr is array (1..3) of Vector.Vector;
    type Color_Arr is array (1..3) of Color.Color;

    type Triangle is record
        Vectors : Vector_Arr;
        Vector_Normals : Vector_Arr;
        T_Colors: Color_Arr;
    end record;

    function Triangle_Create(Vectors: Vector_Arr;
                             Vector_Normals: Vector_Arr;
                             Colors : Color_Arr) return Triangle;
    function Triangle_Equals(T, T2: Triangle) return Boolean;
    function Triangle_Get_Vector(This: Triangle;
                                 Index: Integer) return Vector.Vector;
    function Triangle_Get_Vector_Normal(This: Triangle;
                                       Index: Integer) return Vector.Vector;
    function Triangle_Get_Color(This: Triangle;
                                Index: Integer) return Color.Color;
    procedure Triangle_Set_Vector(This: in out Triangle;
                                  Index: Integer;
                                  Value: Vector.Vector);
    procedure Triangle_Set_Vector_Normal(This: in out Triangle;
                                  Index: Integer;
                                  Value: Vector.Vector);
    procedure Triangle_Set_Color(This: in out Triangle;
                                 Index: Integer;
                                 Value: Color.Color);
    function Triangle_Point_Is_Inside(This: Triangle;
                                      P: Vector.Vector;
                                      Barycentric_Coord: out Vector.Vector) return boolean;
end Triangle;
