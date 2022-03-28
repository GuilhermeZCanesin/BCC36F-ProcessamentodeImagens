pkg load image;
shaded_image = imread("tungsten_filament_shaded.tif");
shadding_mask = imread("tungsten_sensor_shading.tif");
x = im2double (shaded_image);
y = im2double (shadding_mask);
z = x ./ y;
imshow (z)
imwrite(z,"shadded.tif")
