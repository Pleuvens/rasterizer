with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

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
      Bitmap_Buffer.Set_Source (HAL.Bitmap.Yellow);
      Bitmap_Buffer.Draw_Rect ((Position => (Width / 2 - 30, Height / 2 -50 ),
                                Width  => Width / 3,
                                Height => Height / 3 ));

      if User_Button.Has_Been_Pressed then
         LCD_Std_Out.Put_Line("TESTTT BOUTON");
      end if;

      declare
         State : constant TP_State := Touch_Panel.Get_All_Touch_Points;
      begin
         if State'Length = 0 then
            LCD_Std_Out.Put_Line("STATE 00000");
         elsif State'Length = 1 then
            LCD_Std_Out.Put_Line("STATE 1111111111");
         end if;

      end;


      Display.Update_Layers;
      end loop;
end Menu;

