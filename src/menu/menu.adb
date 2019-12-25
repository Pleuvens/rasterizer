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

procedure Menu is
   BG : constant Bitmap_Color := (Alpha => 255, others => 64);

   procedure Clear is
   begin
      Display.Hidden_Buffer (1).Set_Source (BG);
      Display.Hidden_Buffer (1).Fill;

      LCD_Std_Out.Clear_Screen;
      LCD_Std_Out.Put_Line ("This application is a ");
      LCD_Std_Out.Put_Line ("Rasterizer");

      Display.Update_Layer (1, Copy_Back => True);
   end Clear;

begin
    --  Initialize LCD
   Display.Initialize;
   Display.Initialize_Layer (1, ARGB_8888);

   --  Initialize touch panel
   Touch_Panel.Initialize;

   --  Initialize button
   User_Button.Initialize;

   LCD_Std_Out.Set_Font (BMP_Fonts.Font8x8);
   LCD_Std_Out.Current_Background_Color := BG;

   --  Clear LCD (set background)
   Clear;

   loop
      LCD_Std_Out.Put_Line ("test");
   end loop;
end Menu;
