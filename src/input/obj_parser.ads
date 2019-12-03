with Vector;
with Triangle;
with Scene;

package OBJ_Parser is
 
    type Vector_Arr is array (Positive range <>) of Vector.Vector;
    type Triangle_Arr is array (Positive range <>) of Triangle.Triangle;

    function Parse(File_Name: String;
                   S: out Scene.Scene) return Boolean;
end OBJ_Parser;
