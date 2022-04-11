pkg load image;
image_shaded = imread("tungsten_filament_shaded.tif");
##imshow (image_shaded)
shadding_image = imread("tungsten_sensor_shading.tif");
##imshow (shadding_image)
is = im2double (image_shaded);
##imshow (si)
si = im2double (shadding_image);
##imshow (sm)
final_image = is ./ si;
imshow (final_image)
imwrite(final_image,"final_image.tif")
