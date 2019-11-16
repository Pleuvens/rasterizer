package Color is
    type Color is array (1..3) of Float;

    function Color_Create(R, G, B: Float) return Color;
    function Color_Get(This: Color;
                        Index: Integer) return Float;
    procedure Color_Set(This: in out Color;
                         Index: Integer;
                         Value: Float);
    function Color_Equals(C, C2: Color) return Boolean;
    function Color_Add(C, C2: Color) return Color;
    function Color_Sub(C, C2: Color) return Color;
    function Color_Mult(C, C2: Color) return Color;
    function Color_Mult(C: Color;
                        Value: Float) return Color;
end Color;
