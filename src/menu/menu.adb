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
with STM32.DMA2D;         use STM32.DMA2D;
with STM32.DMA2D_Bitmap;  use STM32.DMA2D_Bitmap;
with HAL;                 use HAL;

procedure Menu is
  function Bitmap_Buffer return not null Any_Bitmap_Buffer;
   function Buffer return DMA2D_Buffer;

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

   function Buffer return DMA2D_Buffer is
   begin
      return To_DMA2D_Buffer (Display.Hidden_Buffer (1).all);
   end Buffer;

   Width  : Natural;
   Height : Natural;
   X, Y   : Natural;

   L4_CLUT : array (UInt4) of DMA2D_Color;
   L8_CLUT : array (UInt8) of DMA2D_Color;

   type L4_Bitmap is array (UInt4) of UInt4 with Pack;
   type L8_Bitmap is array (UInt8) of UInt8 with Pack;

   L4_Data : L4_Bitmap with Size => 16 * 4;
   L8_Data : L8_Bitmap with Size => 256 * 8;

   L4_Buffer : constant DMA2D_Buffer :=
     (Color_Mode      => L4,
      Addr            => L4_Data (0)'Address,
      Width           => 4,
      Height          => 4,
      CLUT_Color_Mode => ARGB8888,
      CLUT_Addr       => L4_CLUT (0)'Address);
   L8_Buffer : constant DMA2D_Buffer :=
     (Color_Mode      => L8,
      Addr            => L8_Data (0)'Address,
      Width           => 16,
      Height          => 16,
      CLUT_Color_Mode => ARGB8888,
      CLUT_Addr       => L8_CLUT (0)'Address);
begin
   --  Initialize LCD
   Display.Initialize;
   Display.Initialize_Layer (1, HAL.Bitmap.ARGB_8888);

   Width := Display.Hidden_Buffer (1).Width;
   Height := Display.Hidden_Buffer (1).Height;

   loop
      Bitmap_Buffer.Set_Source (HAL.Bitmap.Dark_Blue);
      Bitmap_Buffer.Fill;

      --  Draw blue filled rectangle in the upper left corner
      --Bitmap_Buffer.Set_Source (HAL.Bitmap.Blue);
      --Bitmap_Buffer.Fill_Rect ((Position => (0, 0),
        --                        Width    => Width / 2,
      --                          Height   => Height / 2));

      --  Drawn yellow rectangle outline in the lower left corner
      Bitmap_Buffer.Set_Source (HAL.Bitmap.Yellow);
      Bitmap_Buffer.Draw_Rect ((Position => (Width / 2 - 30, Height / 2 -50 ),
                                Width  => Width / 3,
                                Height => Height / 3 ));


      --  Fill L4 CLUT
      for Index in UInt4 loop
         L4_CLUT (Index) := (255, 0, 0, UInt8 (Index) * 16);
      end loop;

      --  Fill L4 bitmap
      for Index in L4_Data'Range loop
         L4_Data (Index) := Index;
      end loop;

      --  Fill L8 CLUT
      for Index in UInt8 loop
         L8_CLUT (Index) := (255, 0, Index, 0);
      end loop;

      --  Fill L8 bitmap
      for Index in L8_Data'Range loop
         L8_Data (Index) := Index;
      end loop;




      Display.Update_Layers;
      end loop;
end Menu;

