with Vector;
with Scene;

package OBJ_Parser is
 
    type Vector_Arr is array (Positive range <>) of Vector.Vector;

    function Parse(FileName: String) return Scene.Scene;
end OBJ_Parser;
