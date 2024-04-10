%% This code takes data from a dataset and returns the locations in the variable "testing" based on the lookup table
%% This code needs to be adjusted depending on the structure of your files (columns, rows, etc)

m = readmatrix('[LOOKUP TABLE]');
t = readmatrix('[LOCALIZATION DATA]');

testing = zeros(1,3);
for z = 1:length(t(:,1))
    xz_in = t(z,3);
    yz_in = t(z,4);
    z_in = t(z,2);

    x_coord = 0;
    y_coord = 0;
    z_coord = 0;

    difference = 0;
    lowest_difference = sqrt((m(1,4) - xz_in)^2 + (m(1,5) - yz_in)^2 + (m(1,6) - z_in)^2);

    for i = 1:length(m(:,1))
        difference = sqrt((m(i,4) - xz_in)^2 + (m(i,5) - yz_in)^2 + (m(i,6) - z_in)^2);
        if difference < lowest_difference
            z_coord = m(i,3);
            y_coord = m(i,2); 
            x_coord = m(i,1);
            lowest_difference = difference;
        end
    end

    temp = [x_coord, y_coord, z_coord];
    testing = [testing ; temp];
end
testing(1,:) = [];


