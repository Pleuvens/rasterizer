use Vector_RZ
    Color_RZ;

package Triangle_RZ is
    type Triangle is
        record
            Vectors : Vector_RZ.Vector(1..3);
            Color: Color_RZ.Color;
        end record;

    function Triangle_Create(Vectors: Vector_RZ.Vector(1..3);
                             Color  : Color_RZ.Color) return Triangle;
    function Triangle_Get_Vector(This: in out Triangle;
                                 Index: Integer) return Vector_RZ.Vector;
    procedure Triangle_Set_Vector(This: in out Triangle;
                                  Index: Integer;
                                  Value: Vector_RZ.Vector);
    function Triangle_Get_Color(This: in out Triangle) return Color_RZ.Color;
    procedure Triangle_Set_Color(This: in outTriangle;
                                 Value: Color_RZ.Color);
end Triangle_RZ;
