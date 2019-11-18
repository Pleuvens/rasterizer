with Vector; use Vector;
with Color; use Color;

package Triangle is

    type Vector_Arr is array (1..3) of Vector.Vector;

    type Triangle is record
        Vectors : Vector_Arr;
        T_Color: Color.Color;
    end record;

    function Triangle_Create(Vectors: Vector_Arr;
                             C      : Color.Color) return Triangle;
    function Triangle_Equals(T, T2: Triangle) return Boolean;
    function Triangle_Get_Vector(This: Triangle;
                                 Index: Integer) return Vector.Vector;
    function Triangle_Get_Color(This: Triangle) return Color.Color;
    procedure Triangle_Set_Vector(This: in out Triangle;
                                  Index: Integer;
                                  Value: Vector.Vector);
    procedure Triangle_Set_Color(This: in out Triangle;
                                 Value: Color.Color);
end Triangle;
