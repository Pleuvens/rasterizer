with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.
with Vector;                use Vector;
with Color;
with STM32.Board;           use STM32.Board;
with HAL.Bitmap;            use HAL.Bitmap;
with HAL.Touch_Panel;       use HAL.Touch_Panel;
with STM32.User_Button;     use STM32;
with BMP_Fonts;
with LCD_Std_Out;
--with STM32.DMA2D;         use STM32.DMA2D;
with STM32.DMA2D_Bitmap;  use STM32.DMA2D_Bitmap;
--with HAL;                 use HAL;

procedure Menu is

  BG : constant Bitmap_Color := (Alpha => 255, others => 64);

  function Bitmap_Buffer return not null Any_Bitmap_Buffer;
  -- function Buffer return DMA2D_Buffer;

   -------------------
   -- Bitmap_Buffer --
   -------------------

   function Bitmap_Buffer return not null Any_Bitmap_Buffer is
   begin
      if Display.Hidden_Buffer (1).all not in DMA2D_Bitmap_Buffer then
         raise Program_Error with "We expect a DM2D buffer here";
      end if;

      return Display.Hidden_Buffer (1);
   end Bitmap_Buffer;

   ------------
   -- Buffer --
   ------------

   --function Buffer return DMA2D_Buffer is
   --begin
     -- return To_DMA2D_Buffer (Display.Hidden_Buffer (1).all);
   --end Buffer;


   -----------
   -- Clear --
   -----------

   procedure Clear is
   begin
      Display.Hidden_Buffer (1).Set_Source (BG);
      Display.Hidden_Buffer (1).Fill;


      LCD_Std_Out.Clear_Screen;
      LCD_Std_Out.Put_Line ("RASTERIZER");

      Display.Update_Layer (1, Copy_Back => True);
   end Clear;

   --function Color_to_Bitmap_Color(C: Color.Color) return Bitmap_Color is
   --begin
   --    return (255, UInt8(C(1) * 255.0), UInt8(C(2) * 255.0), UInt8(C(3) * 255.0));
   --end;

   procedure Rasterize(W, H: Natural) is
      V0, V1, V2, P: Vector.Vector;
      C0, C1, C2: Color.Color;

      Area, W0, W1, W2, R, G, B: Float;
   begin
      V0 := (491.407, 411.407, 0.0);
      V1 := (148.593, 68.5928, 0.0);
      V2 := (148.593, 411.407, 0.0);
      C0 := (1.0, 0.0, 0.0);
      C1 := (0.0, 1.0, 0.0);
      C2 := (0.0, 0.0, 1.0);

      for J in Natural range 1 .. H loop
          for I in Natural range 1 .. W loop
              P := (Float(I) + 0.5, Float(J) + 0.5, 0.0);
              W0 := Vector_Edge(V1, V2, P);
              W1 := Vector_Edge(V2, V0, P);
              W2 := Vector_Edge(V0, V1, P);
              if W0 >= 0.0 and W1 >= 0.0 and W2 >= 0.0 then
                  W0 := W0 / Area;
                  W1 := W1 / Area;
                  W2 := W2 / Area;
                  R := W0 * C0(1) + W1 * C1(1) + W2 * C2(1);
                  G := W0 * C0(2) + W1 * C1(2) + W2 * C2(2);
                  B := W0 * C0(3) + W1 * C1(3) + W2 * C2(3);
                  --Bitmap_Buffer.Set_Source(Color_To_Bitmap_Color((R, G, B)));
                  Bitmap_Buffer.Set_Source(HAL.Bitmap.White);
              else
                  Bitmap_Buffer.Set_Source(HAL.Bitmap.Black);
              end if;
              Bitmap_Buffer.Draw_Rect((Position => (I, J), Width => 1, Height => 1));
         end loop;
      end loop;
   end Rasterize;

   Width  : Natural;
   Height : Natural;

begin
   --  Initialize LCD
   Display.Initialize;
   Display.Initialize_Layer (1, HAL.Bitmap.ARGB_8888);

   -- Initialize touch panel
   Touch_Panel.Initialize;
   -- Initialize button
   User_Button.Initialize;

   LCD_Std_Out.Set_Font(BMP_Fonts.Font12x12);
   LCD_Std_Out.Current_Background_Color := BG;
   --LCD_Std_Out.Put_Line("RASTERIZER");



   Clear;

   Width := Display.Hidden_Buffer (1).Width;
   Height := Display.Hidden_Buffer (1).Height;

   loop

      --Bitmap_Buffer.Set_Source (HAL.Bitmap.Dark_Blue);
      --Bitmap_Buffer.Fill;

      --  Drawn yellow rectangle outline in the lower left corner
      --Bitmap_Buffer.Set_Source (HAL.Bitmap.Yellow);
      --Bitmap_Buffer.Draw_Rect ((Position => (Width / 2 - 30, Height / 2 -50 ),
      --                          Width  => Width / 3,
      --                          Height => Height / 3 ));

      --if User_Button.Has_Been_Pressed then
      --   LCD_Std_Out.Put_Line("TESTTT BOUTON");
      --end if;

     -- declare
      --   State : constant TP_State := Touch_Panel.Get_All_Touch_Points;
      --begin
      --   if State'Length = 0 then
      --      LCD_Std_Out.Put_Line("STATE 00000");
     --    elsif State'Length = 1 then
     --       LCD_Std_Out.Put_Line("STATE 1111111111");
      --   end if;

      --end;
      Rasterize(Width, Height);

      Display.Update_Layers;
      end loop;
end Menu;

