use Float_RZ;

package Color_RZ is
    type Color is array (1..3) of Float_RZ.Float;

    function Color_Create(R, G, B: Float_RZ.Float) return Color;
    function Color_Get(This: in out Color;
                        Index: Integer) return Float_RZ.Float;
    procedure Color_Set(This: in out Color;
                         Index: Integer;
                         Value: Float_RZ.Float);
    function Color_Add(C, C2: Color) return Color;
    function Color_Sub(C, C2: Color) return Color;
    function Color_Mult(C, C2: Color) return Color;
    function Color_Mult(C: Color;
                        Value: Float_RZ.Float) return Color;
end Color_RZ;
