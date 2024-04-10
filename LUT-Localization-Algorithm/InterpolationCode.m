%% Used to interpolate data from experimentally measured data

m_B = readmatrix('flat_XYZ_combined.csv'); %% Reads in the magnetic field data (w/o interpolation)
m = [m_B(:,1) m_B(:,2) m_B(:,3) m_B(:,13) m_B(:,14) m_B(:,15)]; % Structure of this depends on the structure of the data file

% define the ranges and step sizes for x, y, and z
x_range = -10:0.1:10;
y_range = -10:0.1:10;
z_range = 1:0.1:21;

% create arrays of x, y, and z coordinates using meshgrid
[x, y, z] = meshgrid(x_range, y_range, z_range);

i_Bxz = interp3(m(:,3),m(:,2),m(:,1),magnetic1,i_coords(:,1),i_coords(:,2),i_coords(:,3), 'makima');
i_Byz = interp3(m(:,3),m(:,2),m(:,1),magnetic2,i_coords(:,1),i_coords(:,2),i_coords(:,3), 'makima');
i_Bz = interp3(m(:,3),m(:,2),m(:,1),magnetic3,i_coords(:,1),i_coords(:,2),i_coords(:,3), 'makima');

interp_coord_data = [i_coords i_Bxz i_Byz i_Bz];