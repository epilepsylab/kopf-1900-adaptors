difference () {
    union () {
        cylinder (50, r=2, center = true, $fn = 50);
        cylinder (10, r = 3.25, center = true, $fn =50);
    }
    union () {
        cylinder (55, r=1, center = true, $fn = 50);
        translate ([0,0,-25]) cylinder (5, r=1.3, center = true, $fn = 50);
        translate ([-15, -15, 8]) cube ([30, 30, 30], center = false);
    }
}