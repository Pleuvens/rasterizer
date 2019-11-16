  with Color;

package body Color is
    function Color_Create(R, G, B: Float) return Color is
    begin
      return (R, G, B);
    end Color_Create;

    function Color_Get(This: Color;
                        Index: Integer) return Float is
    begin
      return This(Index);
    end Color_Get;

    procedure Color_Set(This: in out Color;
                         Index: Integer;
                         Value: Float) is
    begin
      This(Index) := Value;
    end Color_Set;

    function Color_Equals(C, C2: Color) return Boolean is
    begin
      return C(1) = C2(1) and C(2) = C2(2) and C(3) = C2(3);
    end Color_Equals;

    function Color_Add(C, C2: Color) return Color is
    begin
      return (C(1) + C2(1), C(2) + C2(2), C(3) + C2(3));
    end Color_Add;

    function Color_Sub(C, C2: Color) return Color is
    begin
      return (C(1) - C2(1), C(2) - C2(2), C(3) - C2(3));
    end Color_Sub;

    function Color_Mult(C, C2: Color) return Color is
    begin
      return (C(1) * C2(1), C(2) * C2(2), C(3) * C2(3));
    end Color_Mult;

    function Color_Mult(C: Color;
                        Value: Float) return Color is
    begin
      return (C(1) * Value, C(2) * Value, C(3) * Value);
    end Color_Mult;

end Color;
