with Color; use Color;
with Triangle; use Triangle;

package body Scene is

    function Scene_Create(H, W, Nb_Tr: Positive) return Scene is
      S : Scene(H, W, H * W, Nb_Tr);
    begin
      return S; 
    end Scene_Create;

    function Scene_Get_Px(This: Scene;
                          Y, X: Positive) return Color.Color is
    begin
      return This.Img(Y * This.Width + X);
    end Scene_Get_Px;

    function Scene_Get_Triangle(This: Scene;
                                Index: Positive) return Triangle.Triangle is
    begin
      return This.Triangles(Index);
    end Scene_Get_Triangle;

    function Scene_Get_Height(This: Scene) return Positive is
    begin
      return This.Height;
    end Scene_Get_Height;

    function Scene_Get_Width(This: Scene) return Positive is
    begin
      return This.Width;
    end Scene_Get_Width;

    procedure Scene_Set_Px(This: in out Scene;
                           Y, X: Positive;
                           Value: Color.Color) is
    begin
      This.Img(Y * This.Width + X) := Value;
    end Scene_Set_Px;

    procedure Scene_Set_Triangle(This: in out Scene;
                                 Index: Positive;
                                 Value: Triangle.Triangle) is
    begin
       This.Triangles(Index) := Value;
    end Scene_Set_Triangle;

    procedure Scene_Set_Height(This: in out Scene;                                        
                              H: Positive) is
    begin
      This.Height := H;
    end Scene_Set_Height;

    procedure Scene_Set_Width(This: in out Scene;                                         
                              W: Positive) is
    begin
      This.Width := W;
    end Scene_Set_Width;

end Scene;
