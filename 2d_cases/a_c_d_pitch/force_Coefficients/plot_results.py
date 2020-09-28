"""plotting cfd run results"""
import os

from functions_plotting import cf_plotter, read_cfd_data, read_ref_data, append_kinematics_array

#-------------input plot control----------
cfd_data_list = ['cfd']
# ref_data_lst = ['exp_cl', 'impulse_cl']
ref_data_lst = []
#-----------------------------------------
data_to_plot = ['cfd']
#---------------------------------------
time_to_plot = 'all'
coeffs_show_range = 'all'
# time_to_plot = [0, 1500]
# coeffs_show_range = [-0.5, 3]
#---------------------------------------
cwd = os.getcwd()
image_out_path = cwd
#---------------------------------------
cf_array = []
for cfi in cfd_data_list:
    cfd_datai = os.path.join(cwd, cfi)
    cf_arrayi = read_cfd_data(cfd_datai)

    # cfd_kinematics_datai = os.path.join(cwd, 'kinematics/' + cfi + '.dat')
    # cf_arrayi = append_kinematics_array(cf_arrayi, cfd_kinematics_datai)

    cf_array.append(cf_arrayi)

ref_array = []
for refi in ref_data_lst:
    ref_datai = os.path.join(cwd, refi + '.csv')
    ref_arrayi = read_ref_data(ref_datai)

    ref_array.append(ref_arrayi)

data_array = [cf_array, ref_array]
legends = [cfd_data_list, ref_data_lst]
#---------------------------------------

cf_plotter(data_array, legends, data_to_plot, time_to_plot, coeffs_show_range,
           image_out_path, 'against_t')
