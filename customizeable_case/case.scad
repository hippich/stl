include <./boxes.scad>;

width = 170; 
height = 257;
depth = 10;
corner_radius = 10;
wall_thickness = 2;
edge_width = 17;

top_left_hole_width = 50;
top_right_hole_width = 70;
bottom_left_hole_width = 60;
bottom_right_hole_width = 60;

left_top_hole_width = 60;
left_bottom_hole_width = 0;
right_top_hole_width = 0;
right_bottom_hole_width = 0;

front_camera_x = 7;
front_camera_y = 128.5;
front_camera_r = 6;

back_camera_x = 28;
back_camera_y = 29;
back_camera_r = 5;

pocket_cut_height = 5;

difference() {
  // Shell
  roundedBox([width + wall_thickness * 2, height + wall_thickness * 2, depth + wall_thickness * 2], corner_radius, true);

  // Gadget
  roundedBox([width, height, depth], corner_radius, true);

  // Screen window
  translate([0, 0, wall_thickness * 2])
    cube(size = [width - edge_width, height - edge_width, depth], center = true);

  // Top holes
  translate([width / 2 - top_left_hole_width / 2 - edge_width / 2, wall_thickness * corner_radius, 0])
    cube(size = [top_left_hole_width, height + wall_thickness, depth], center = true);
  translate([-1 * (width / 2 - top_right_hole_width / 2 - edge_width / 2), wall_thickness * corner_radius, 0])
    cube(size = [top_right_hole_width, height + wall_thickness, depth], center = true);

  // Bottom holes
  translate([width / 2 - bottom_left_hole_width / 2 - edge_width / 2, -1 * wall_thickness * corner_radius, 0])
    cube(size = [bottom_left_hole_width, height + wall_thickness, depth], center = true);
  translate([-1 * (width / 2 - bottom_right_hole_width / 2 - edge_width / 2), -1 * wall_thickness * corner_radius, 0])
    cube(size = [bottom_right_hole_width, height + wall_thickness, depth], center = true);

  // Left top hole
  translate([wall_thickness * corner_radius, height / 2 - left_top_hole_width / 2 - edge_width / 2, 0])
    cube(size = [width + wall_thickness, left_top_hole_width, depth], center = true);
  // Left bottom hole
  translate([wall_thickness * corner_radius, -1 * (height / 2 - left_bottom_hole_width / 2 - edge_width / 2), 0])
    cube(size = [width + wall_thickness, left_bottom_hole_width, depth], center = true);

  // Right top hole
  translate([-1 * wall_thickness * corner_radius, height / 2 - right_top_hole_width / 2 - edge_width / 2, 0])
    cube(size = [width + wall_thickness, right_top_hole_width, depth], center = true);
  // Right bottom hole
  translate([-1 * wall_thickness * corner_radius, -1 * (height / 2 - right_bottom_hole_width / 2 - edge_width / 2), 0])
    cube(size = [width + wall_thickness, right_bottom_hole_width, depth], center = true);

  // Front camera
  translate([width/2 - front_camera_x, height/2 - front_camera_y, wall_thickness * 2])
    cylinder(h = depth + wall_thickness * 2, r = front_camera_r, center = true);

  // Back camera
  translate([width/2 - back_camera_x, height/2 - back_camera_y, -1 * wall_thickness * 2])
    cylinder(h = depth + wall_thickness * 2, r = back_camera_r, center = true);

  // Pocket cut
  cube(size = [width - corner_radius * 2, height + 4 * wall_thickness, pocket_cut_height], center = true);
}




