with Vector; use Vector;
with Color; use Color;

package body Triangle is

    function Triangle_Create(Vectors: Vector_Arr;
                             C      : Color.Color) return Triangle is
    begin
      return (Vectors, C);
    end Triangle_Create;

    function Triangle_Equals(T, T2: Triangle) return Boolean is
    begin
      return Vector.Vector_Equals(T.Vectors(1), T2.Vectors(1)) and
             Vector.Vector_Equals(T.Vectors(2), T2.Vectors(2)) and
             Vector.Vector_Equals(T.Vectors(3), T2.Vectors(3)) and
             Color.Color_Equals(T.T_Color, T2.T_Color);
    end Triangle_Equals;

    function Triangle_Get_Vector(This: Triangle;
                                 Index: Integer) return Vector.Vector is
    begin
      return This.Vectors(Index);
    end Triangle_Get_Vector;
 
    function Triangle_Get_Color(This: Triangle) return Color.Color is
    begin
      return This.T_Color;
    end Triangle_Get_Color;

    procedure Triangle_Set_Vector(This: in out Triangle;
                                  Index: Integer;
                                  Value: Vector.Vector) is
    begin
      This.Vectors(Index) := Value;
    end Triangle_Set_Vector;

    procedure Triangle_Set_Color(This: in out Triangle;
                                 Value: Color.Color) is
    begin
      This.T_Color := Value;
    end Triangle_Set_Color;
end Triangle;
