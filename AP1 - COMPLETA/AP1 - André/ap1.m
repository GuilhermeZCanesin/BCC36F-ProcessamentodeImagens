pkg load image;
shaded_image = imread("tungsten_filament_shaded.tif");
image(shaded_image)
shadding_mask = imread("tungsten_sensor_shading.tif");
image(shadding_mask)

x = im2double (shaded_image)
y = im2double (shadding_mask)

z = x ./ y;

image (z)
