pkg load image;
shaded_image = imread("tungsten_filament_shaded.tif");
##imshow (shaded_image)
shadding_mask = imread("tungsten_sensor_shading.tif");
##imshow (shadding_mask)
si = im2double (shaded_image);
##imshow (si)
sm = im2double (shadding_mask);
##imshow (sm)
image = si ./ sm;
imshow (image)
imwrite(image,"shadded.tif")
