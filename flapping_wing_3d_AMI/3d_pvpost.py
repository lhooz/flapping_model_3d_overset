# trace generated using paraview version 5.7.0
#
#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

pvstate_file = '/home/hao/OpenFOAM/hao-v1912/run/flapping_wing_test/flapping_wing_3d_AMI_test/backGround/paraview/3d_wing_post.pvsm'
foam_file = '/home/hao/OpenFOAM/hao-v1912/run/flapping_wing_test/flapping_wing_3d_AMI_test/backGround/open.foam'
output_files = '/home/hao/OpenFOAM/hao-v1912/run/flapping_wing_test/flapping_wing_3d_AMI_test/backGround/paraview/New Folder/test.jpeg'
# load state
LoadState(
    pvstate_file,
    LoadStateDataFileOptions='Choose File Names',
    # DataDirectory='/home/hao/OpenFOAM/hao-v1912/run/flapping_wing_test/flapping_wing_3d_AMI_test/backGround/paraview',
    backGroundfoamFileName=foam_file)

# get animation scene
animationScene1 = GetAnimationScene()

# get the time-keeper
timeKeeper1 = GetTimeKeeper()

# find view
renderView1 = FindViewOrCreate('RenderView1', viewtype='RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1478, 810]

# set active view
SetActiveView(renderView1)

# current camera placement for renderView1
renderView1.CameraPosition = [
    -8.746407558780213, -0.7331330123904345, 3.922666030987598
]
renderView1.CameraFocalPoint = [
    1.0778468006383204, 1.337318514675117, -0.9961812840468874
]
renderView1.CameraViewUp = [
    0.3876532797138383, 0.26096602192631246, 0.8840936998571249
]
renderView1.CameraParallelScale = 1.6333953242291757

# save animation
SaveAnimation(
    output_files,
    renderView1,
    ImageResolution=[772, 338],
    OverrideColorPalette='BlackBackground',
    FrameWindow=[490, 499],
    # JPEG options
    Quality=100)
