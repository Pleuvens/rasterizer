use Color_RZ;
    Triangle_RZ;

package Scene_RZ is

    type Color_Arr is array(Positive range <>) of Color_RZ.Color;
    type Triangle_Arr is array(Positive range <>) of Triangle_RZ.Triangle;

    type Scene is record
        Img: Color_Arr;
        Triangles: Triangle_Arr;
    end record;

    function Scene_Create(Img: Color_Arr;
                          Triangle: Triangle_Arr) return Scene;
    function Scene_Get_Px(This: Scene;
                          Index: Positive) return Color_RZ.Color;
    procedure Scene_Set_Px(This: in out Scene;
                           Index: Positive;
                           Value: Color_RZ.Color);
    function Scene_Get_Triangle(This: Scene;
                                Index: Positive) return Triangle_RZ.Triangle;
    procedure Scene_Set_Triangle(This: in out Scene;
                                 Index: Positive;
                                 Triangle: Triangle_RZ.Triangle);
end Scene_RZ;
