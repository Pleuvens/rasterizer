with Color;
with Triangle;

package Scene is

    type Color_Arr is array (Positive range <>) of Color.Color;
    type Triangle_Arr is array (Positive range <>) of Triangle.Triangle;

    type Scene(H, W, Img_Size, Nb_Tr: Positive) is record
        Height: Positive := H;
        Width: Positive := W;
        Nb_Triangles: Positive := Nb_Tr;
        Img: Color_Arr(1..Img_Size) := (others => <>);
        Triangles: Triangle_Arr(1..Nb_Tr) := (others => <>);
    end record;

    function Scene_Create(H, W, Nb_Tr: Positive) return Scene;
    function Scene_Get_Px(This: Scene;
                          Y, X: Positive) return Color.Color;
    function Scene_Get_Triangle(This: Scene;
                                Index: Positive) return Triangle.Triangle;
    function Scene_Get_Height(This: Scene) return Positive;
    function Scene_Get_Width(This: Scene) return Positive;
    procedure Scene_Set_Px(This: in out Scene;
                           Y, X: Positive;
                           Value: Color.Color);
    procedure Scene_Set_Triangle(This: in out Scene;
                                 Index: Positive;
                                 Value: Triangle.Triangle);
    procedure Scene_Set_Height(This: in out Scene;
                              H: Positive);
    procedure Scene_Set_Width(This: in out Scene;
                              W: Positive);
end Scene;
