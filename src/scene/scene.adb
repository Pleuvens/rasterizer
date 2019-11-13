use Triangle_RZ;

package Scene_RZ is
    type Scene is
        record
            Image: String;
            Triangles: Triangle_RZ.Triangle;
        end record;
end Scene_RZ;
