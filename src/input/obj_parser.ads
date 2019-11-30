with Vector;
with Scene;

package OBJ_Parser is
 
    type Vector_Arr is array (Positive range <>) of Vector.Vector;

    function Parse(File_Name: String;
                   S: out Scene.Scene) return Boolean;
end OBJ_Parser;
