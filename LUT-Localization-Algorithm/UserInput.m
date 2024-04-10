%% This code allows a user to input magnetic data, and then returns the predicted location based on the lookup table

m = readmatrix('[INSERT LOOKUP TABLE FILE]');

prompt = "What is the magnetic field |Bx+Bz|?";
xz_in = input(prompt)

prompt = "What is the magnetic field |By+Bz|?";
yz_in = input(prompt)

prompt = "What is the magnetic field |Bz|?";
z_in = input(prompt)

x_coord = 0;
y_coord = 0;
z_coord = 0;

difference = 0;
lowest_difference = sqrt((m(1,4) - xz_in)^2 + (m(1,5) - yz_in)^2 + (m(1,6) - z_in)^2);

for i = 1:length(m(:,1))
    difference = sqrt((m(i,4) - xz_in)^2 + (m(i,5) - yz_in)^2 + (m(i,6) - z_in)^2);
    if difference < lowest_difference
        z_coord = m(i,1);
        y_coord = m(i,2);
        x_coord = m(i,3);
        lowest_difference = difference;
    end
end

disp('The coordinates closest to the magnetic field values is')
fprintf('%f , %f , %f\n', x_coord, y_coord, z_coord)

