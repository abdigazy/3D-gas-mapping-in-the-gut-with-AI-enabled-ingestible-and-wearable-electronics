%% Used to interpolate data from experimentally measured data
clear; close all;

m_B = readmatrix('flat_XYZ_combined.csv'); %% Reads in the magnetic field data (w/o interpolation)
m = [m_B(:,1) m_B(:,2) m_B(:,3) m_B(:,13) m_B(:,14) m_B(:,15)]; % Structure of this depends on the structure of the data file

% define the ranges and step sizes for x, y, and z
x_range = -10:0.05:10;
y_range = -10:0.05:10;
z_range = 1:0.05:21;

% create arrays of x, y, and z coordinates using meshgrid
[x, y, z] = meshgrid(x_range, y_range, z_range);

% combine the x, y, and z arrays into a single 3-column array
i_coords = [reshape(x,[],1), reshape(y,[],1), reshape(z,[],1)];

aaa = -10:10;
bbb = -10:10;
ccc = 1:21;
[X, Y, Z] = meshgrid(aaa, bbb, ccc);

MAG1 = zeros(21, 21, 21);
MAG2 = zeros(21, 21, 21);
MAG3 = zeros(21, 21, 21);

for i = 1:21
    for j = 1:21
        for k = 1:16
            w = 1;
            while ((m(w,3)~=X(i,j,k)) || (m(w,2)~=Y(i,j,k)) || (m(w,1)~=Z(i,j,k)))
                w = w + 1;
            end
            MAG1(i,j,k) = m(w,4);
            MAG2(i,j,k) = m(w,5);
            MAG3(i,j,k) = m(w,6);
        end
    end
end

%%%%%%%%%%%%%

i_Bxz = interp3(X,Y,Z,MAG1,i_coords(:,1),i_coords(:,2),i_coords(:,3), 'makima');
i_Byz = interp3(X,Y,Z,MAG2,i_coords(:,1),i_coords(:,2),i_coords(:,3), 'makima');
i_Bz = interp3(X,Y,Z,MAG3,i_coords(:,1),i_coords(:,2),i_coords(:,3), 'makima');


interp_coord_data = [i_coords i_Bxz i_Byz i_Bz];
csvwrite('flat_interpolated_005cm.csv', interp_coord_data);
