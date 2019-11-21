with Vector; use Vector;
with Color; use Color;

package body Triangle is

    function Triangle_Create(Vectors: Vector_Arr;
                             Vector_Normals: Vector_Arr;
                             Colors : Color_Arr) return Triangle is
    begin
      return (Vectors, Vector_Normals, Colors);
    end Triangle_Create;

    function Triangle_Equals(T, T2: Triangle) return Boolean is
    begin
      return Vector.Vector_Equals(T.Vectors(1), T2.Vectors(1)) and
             Vector.Vector_Equals(T.Vectors(2), T2.Vectors(2)) and
             Vector.Vector_Equals(T.Vectors(3), T2.Vectors(3)) and
             Vector.Vector_Equals(T.Vector_Normals(1), T2.Vector_Normals(1)) and
             Vector.Vector_Equals(T.Vector_Normals(2), T2.Vector_Normals(2)) and
             Vector.Vector_Equals(T.Vector_Normals(3), T2.Vector_Normals(3)) and
             Color.Color_Equals(T.T_Colors(1), T2.T_Colors(1)) and
             Color.Color_Equals(T.T_Colors(2), T2.T_Colors(2)) and
             Color.Color_Equals(T.T_Colors(3), T2.T_Colors(3));
    end Triangle_Equals;

    function Triangle_Get_Vector(This: Triangle;
                                 Index: Integer) return Vector.Vector is
    begin
      return This.Vectors(Index);
    end Triangle_Get_Vector;
 
    function Triangle_Get_Vector_Normal(This: Triangle;
                                 Index: Integer) return Vector.Vector is
    begin
      return This.Vector_Normals(Index);
    end Triangle_Get_Vector_Normal;

    function Triangle_Get_Color(This: Triangle;
                                Index: Integer) return Color.Color is
    begin
      return This.T_Colors(Index);
    end Triangle_Get_Color;

    procedure Triangle_Set_Vector(This: in out Triangle;
                                  Index: Integer;
                                  Value: Vector.Vector) is
    begin
      This.Vectors(Index) := Value;
    end Triangle_Set_Vector;

    procedure Triangle_Set_Vector_Normal(This: in out Triangle;
                                  Index: Integer;
                                  Value: Vector.Vector) is
    begin
      This.Vector_Normals(Index) := Value;
    end Triangle_Set_Vector_Normal;

    procedure Triangle_Set_Color(This: in out Triangle;
                                 Index: Integer;
                                 Value: Color.Color) is
    begin
      This.T_Colors(Index) := Value;
    end Triangle_Set_Color;

    function Triangle_Point_Is_Inside(This: Triangle;
                                      P: Vector.Vector) return boolean is
    begin
        return Vector_Edge(This.Vectors(1), This.Vectors(2), P) >= 0.0 and
        Vector_Edge(This.Vectors(2), This.Vectors(3), P) >= 0.0 and
        Vector_Edge(This.Vectors(3), This.Vectors(1), P) >= 0.0; 
    end Triangle_Point_Is_Inside;
end Triangle;
