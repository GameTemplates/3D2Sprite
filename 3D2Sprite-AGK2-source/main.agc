
remstart
***************************************************
***        Project name: 3D2Sprite              ***
***        Version: 0.7.6                       ***
***        Author: GameTemplates                ***
***        Web:  gametemplates.itch.io          ***
***        Date:   29.02.2016                   ***
***        License: MIT                         ***
***************************************************
remend



//******* INCLUDED LIBRARIES *******
#include "keys.agc" //store keycodes inside global variables for easy access
#include "functions.agc" //store useful functions

global_variables:
//******** GLOBAL VARIABLES ***********

//camera
global camspeed  as float = 0.5 //speed of camera movement
global cameraposX as Integer = 0 //X position of camera
global cameraposY as Integer = 0 //Y position of camera
global cameraposZ as Integer = -100 //Z position of camera
global cam_angX as float //variable used to calculate camera angle X
global cam_angY as float //variable used to calculate camera angle Y
//global cam_flashlightON as integer = 0 //check if flashlight is on or off
//global cam_flashlightR as integer = 255 //red component of flashlight color
//global cam_flashlightG as integer = 255 //Green component of flashlight color
//global cam_flashlightB as integer = 255 //Blue component of flashlight color
//global cam_flashlightRadius as integer = 3000 //radious of flashlight

//parent mesh
global parent_mesh_loaded as integer //to store if a mesh is loaded or not
global parent_mesh_animation_loaded as integer //to store if parent mesh animation is loaded or not
global parentMeshPath as string //variable used to store path of the 3D file
global parentAnimMeshPath as string //used to load animation 
global parentImageD as string //variable used to store path of the diffuse texture image of parent object
//global parentImageN as string //variable used to store path of the normal map texture image of parent object
//global parentImageL as string //variable used to store path of the light map texture image of parent object
global parentPreviewD as Integer = 0 // used to store id numbers of images used in texture preview of parent object
//global parentPreviewN as integer = 0
//global parentPreviewL as integer = 0
//global parentScale as float = 0.01 //scale of mesh
global objectposX as float = 1 //X position of mesh
global objectposY as float = 0 //Y position of mesh
global objectposZ as float = 0 //Z position of mesh
global objectStartFrame as integer = 0 //start frame of object animation
global objectEndFrame as integer = 0 //end frame of object animtion
global objectAnimSpeed as Integer = 10 //animation speed of object animation
global objectAnimLoop as integer = 1 //object animation 1=loop 0=no loop
global meshspeed as float = 1 //speed of mesh rotation speed
global object_transperancy as integer = 0 //variable used to store transparency value of mesh 0=not transparent 1=trasparent
global objectanimation_number as integer //variable used to store animation number of mesh
global parentTransparentR as integer = 255 //RGB and Alpha color to use as transparency on the images
global parentTransparentG as integer = 0
global parentTransparentB as integer = 255
global parentTransparentAlpha as integer = 255
global parentTextureSelectionMenu_displayed as integer = 0 //check if the menu displayed or not
global set_parenttransparent_color as integer = 0 //check of we are about to set the transparent color of parent mesh

//child mesh
global child_mesh_loaded as integer //to chekc if mesh is loaded or not
global child_mesh_animation_loaded as integer //to store if parent mesh animation is loaded or not
global childMeshPath as string //varaible to store path of 3D fole
//global childAnimMeshPath as string //used to load animation 
global childImageD as string //variable used to store path of the diffuse texture image of parent object
//global childImageN as string //variable used to store path of the normal map texture image of parent object
//global childImageL as string //variable used to store path of the light map texture image of parent object
global childPreviewD as Integer = 0 // used to store id numbers of images used in texture preview of parent object
//global childPreviewN as integer = 0
//global childPreviewL as integer = 0
global childNameOfBone as string = "" //name of bone that we can use to assing the child to
global childLocalX as float = 0.2 //local X position of Child 
//global childLocalY as float = 0 //local y position of child
//global childLocalZ as float = 0 //local z position of child
global childRotateX as float = 0.2 //rotation on X axes
//global childRotateY as float = 0 //rotation on Y axes
//global childRotateZ as float = 0 //rotation on Z axes
global childScale as float = 0.01 //scale of mesh
global childTransparentR as integer = 255 //RGB and Alpha color to use as transparency on the images
global childTransparentG as integer = 0
global childTransparentB as integer = 255
global childTransparentAlpha as integer = 255
global childTextureSelectionMenu_displayed as integer= 0 //check if texture selection menu displayed or not
global set_childtransparent_color as integer = 0 //check of we are about to set the transparent color of the child mesh

//drawbox
global drawBoxStartX as Float //draw box start X position
global drawBoxStartY as Float //draw box start Y position
global drawBoxEndX as Float //draw box end X position
global drawBoxEndY as float //draw box end Y position

//image capture
global saveImgWidth as integer //width of image to save
global saveImgHeight as integer //height of image to save
global imgnum as integer = 0 //count number of shots made
global filename as string //file name used to save screenshot image
global captureImageName as String //name of image to be captured
global overlayScreenActive as integer = 0 //check if owerlay screen is active such as enter name and size screen

//window
global windowX as float //current width of window
global windowY as float //current height of window
global oldwindowX as float //previous width of window
global oldwindowY as float //previous height of window
global ambientR as integer = 255 //Red component of ambient light
global ambientG as integer = 255 //Green component of ambient light
global ambientB as integer = 255 //Blue compoinent of ambient light
global sunLight_intensity as integer = 100 //intentsitiy of ambient color light
global light_options_displayed as integer = 0 //check if light options menu displayed or not


//camera control
global rmb_startX as float  //variable used to store start position of mouse on X axis when mouse button pressed
global rmb_startY as float //variable used to store start position of mouse on Y axis when mouse button pressed

//messages
global messageDisplayed as Integer = 0 //check if message displayed or not
global aboutDisplayed as integer = 0 //check if about is displayed or not


//FPSC MAP
global fpscmap_loaded_nolightmap as integer = 0 //chekc if fpsc map is loaded with no lightmap
global fpscmap_loaded_withlightmap as integer = 0 //check if fpsc map is loaded with lightmap
global fpscObjNum as integer = 0 //number of FPSC objects
global fpscObjMeshStartID as integer = 1700 //start ID of FPSC meshes to be loaded, the reason to put it in to a variable, becasue the ID range must be high so people can load big FPSC Levels and to keep it that way I may need to move the start value time to time as the tool grows
global fpscObjTextureStartID as integer = 2000 //stat ID of FPSC textures to be loaded, the reason to put it in to a variable, becasue the ID rang must be high in case poeple are loading big levels with lot of textures, to keep it that way I may need to move the start value time to time as the tool grows.

//object picking
global pickedObjID as integer //variable to store ID of picked object
global moveX_selected as integer = 0 //variable to chekc if the move x button is selected
global moveY_selected as integer = 0 //varaible to check if the move y button is selected
global moveZ_selected as integer = 0 //variable to check if the move z button is selected

global rotateX_selected as integer = 0 //varaible to check if the rotate X button is selected
global rotateY_selected as integer = 0 //varaible to check if the rotate Y button is selected
global rotateZ_selected as integer = 0 //varaible to check if the rotate Z button is selected

global scaleX_selected as integer = 0 //varaible to check if the scale X button is selected
global scaleY_selected as integer = 0 //variable to check if the scale Y button is selected
global scaleZ_selected as integer = 0 //varaible to check if the scale Z button is selected
global scaleXYZ_selected as integer = 0 //variable to check if the scale XYZ button is selected

//point lights
global maxPointLight as integer = 2 //number of maximum point lights to load
global pointLightCounter as integer = 0 //count number of point light
global Dim pointLightLoaded[2,2] as integer //check if a point light is loaded
global Dim pointLightColorR[2,2] as integer //to store red color of point lights
global Dim pointLightColorG[2,2] as integer //to store green color of point light
global Dim pointLightColorB[2,2] as integer //to store blue color of point light
global Dim pointLightRadious[2,2] as integer //to store radious of point light
global pointLightEditBoxR as integer = 255 //default red value of editbox
global pointLightEditBoxG as integer = 255 //default green value of editbox
global pointLightEditBoxB as integer = 255 //default blue color of editbox
global pointLightEditBoxRadious as integer = 100 //default value of radious editbox


//setup colors of color picker sprites this is gona be loooooooong
global set_ambient_color as integer = 0 //chekc if we are abotu to change the color of ambient light
global set_pointlight_color as integer = 0 //check if we are about to change the color of point light
global colorPicker_displayed as integer = 0 //check if color picker is displayed
global Dim colorPicker_sprite[45,3] as integer //array storing all the sprites and RGB colors for each sprite in colorpicker

colorPicker_sprite[1,1] = 255 //COLOR 1  
colorPicker_sprite[1,2] = 255
colorPicker_sprite[1,3] = 255

colorPicker_sprite[2,1] = 230 //COLOR 2  
colorPicker_sprite[2,2] = 230
colorPicker_sprite[2,3] = 230

colorPicker_sprite[3,1] = 200 //COLOR 3  
colorPicker_sprite[3,2] = 200
colorPicker_sprite[3,3] = 200

colorPicker_sprite[4,1] = 170 //COLOR 4  
colorPicker_sprite[4,2] = 170
colorPicker_sprite[4,3] = 170

colorPicker_sprite[5,1] = 140 //COLOR 5  
colorPicker_sprite[5,2] = 140
colorPicker_sprite[5,3] = 140

colorPicker_sprite[6,1] = 110 //COLOR 6  
colorPicker_sprite[6,2] = 110
colorPicker_sprite[6,3] = 110

colorPicker_sprite[7,1] = 90 //COLOR 7  
colorPicker_sprite[7,2] = 90
colorPicker_sprite[7,3] = 90

colorPicker_sprite[8,1] = 60 //COLOR 8  
colorPicker_sprite[8,2] = 60
colorPicker_sprite[8,3] = 60

colorPicker_sprite[9,1] = 30 //COLOR 9  
colorPicker_sprite[9,2] = 30
colorPicker_sprite[9,3] = 30

colorPicker_sprite[10,1] = 0 //COLOR 10  
colorPicker_sprite[10,2] = 0
colorPicker_sprite[10,3] = 0

colorPicker_sprite[11,1] = 255 //COLOR 11  
colorPicker_sprite[11,2] = 0
colorPicker_sprite[11,3] = 0

colorPicker_sprite[12,1] = 255 //COLOR 12  
colorPicker_sprite[12,2] = 42
colorPicker_sprite[12,3] = 0

colorPicker_sprite[13,1] = 255 //COLOR 13  
colorPicker_sprite[13,2] = 85
colorPicker_sprite[13,3] = 0

colorPicker_sprite[14,1] = 255 //COLOR 14  
colorPicker_sprite[14,2] = 128
colorPicker_sprite[14,3] = 0

colorPicker_sprite[15,1] = 255 //COLOR 15  
colorPicker_sprite[15,2] = 170
colorPicker_sprite[15,3] = 0

colorPicker_sprite[16,1] = 255 //COLOR 16  
colorPicker_sprite[16,2] = 213
colorPicker_sprite[16,3] = 0

colorPicker_sprite[17,1] = 255 //COLOR 17  
colorPicker_sprite[17,2] = 255
colorPicker_sprite[17,3] = 0

colorPicker_sprite[18,1] = 212 //COLOR 18  
colorPicker_sprite[18,2] = 255
colorPicker_sprite[18,3] = 0

colorPicker_sprite[19,1] = 170 //COLOR 19  
colorPicker_sprite[19,2] = 255
colorPicker_sprite[19,3] = 0

colorPicker_sprite[20,1] = 128 //COLOR 20  
colorPicker_sprite[20,2] = 255
colorPicker_sprite[20,3] = 0

colorPicker_sprite[21,1] = 85 //COLOR 21  
colorPicker_sprite[21,2] = 255
colorPicker_sprite[21,3] = 0

colorPicker_sprite[22,1] = 52 //COLOR 22  
colorPicker_sprite[22,2] = 255
colorPicker_sprite[22,3] = 0

colorPicker_sprite[23,1] = 0 //COLOR 23  
colorPicker_sprite[23,2] = 255
colorPicker_sprite[23,3] = 0

colorPicker_sprite[24,1] = 0 //COLOR 24  
colorPicker_sprite[24,2] = 255
colorPicker_sprite[24,3] = 85

colorPicker_sprite[25,1] = 0 //COLOR 25  
colorPicker_sprite[25,2] = 255
colorPicker_sprite[25,3] = 128

colorPicker_sprite[26,1] = 0 //COLOR 26  
colorPicker_sprite[26,2] = 255
colorPicker_sprite[26,3] = 170

colorPicker_sprite[27,1] = 0 //COLOR 27  
colorPicker_sprite[27,2] = 255
colorPicker_sprite[27,3] = 212

colorPicker_sprite[28,1] = 0 //COLOR 28  
colorPicker_sprite[28,2] = 255
colorPicker_sprite[28,3] = 255

colorPicker_sprite[29,1] = 0 //COLOR 29  
colorPicker_sprite[29,2] = 212
colorPicker_sprite[29,3] = 255

colorPicker_sprite[30,1] = 0 //COLOR 30  
colorPicker_sprite[30,2] = 170
colorPicker_sprite[30,3] = 255 

colorPicker_sprite[31,1] = 0 //COLOR 31  
colorPicker_sprite[31,2] = 128
colorPicker_sprite[31,3] = 255

colorPicker_sprite[32,1] = 0 //COLOR 32  
colorPicker_sprite[32,2] = 85
colorPicker_sprite[32,3] = 255

colorPicker_sprite[33,1] = 0 //COLOR 33  
colorPicker_sprite[33,2] = 43
colorPicker_sprite[33,3] = 255

colorPicker_sprite[34,1] = 0 //COLOR 34  
colorPicker_sprite[34,2] = 0
colorPicker_sprite[34,3] = 255

colorPicker_sprite[35,1] = 42 //COLOR 35  
colorPicker_sprite[35,2] = 0
colorPicker_sprite[35,3] = 255 

colorPicker_sprite[36,1] = 85 //COLOR 36  
colorPicker_sprite[36,2] = 0
colorPicker_sprite[36,3] = 255

colorPicker_sprite[37,1] = 128 //COLOR 37  
colorPicker_sprite[37,2] = 0
colorPicker_sprite[37,3] = 255

colorPicker_sprite[38,1] = 170 //COLOR 38  
colorPicker_sprite[38,2] = 0
colorPicker_sprite[38,3] = 255 

colorPicker_sprite[39,1] = 213 //COLOR 39  
colorPicker_sprite[39,2] = 0
colorPicker_sprite[39,3] = 255

colorPicker_sprite[40,1] = 255 //COLOR 40  
colorPicker_sprite[40,2] = 0
colorPicker_sprite[40,3] = 255 

colorPicker_sprite[41,1] = 255 //COLOR 41  
colorPicker_sprite[41,2] = 0
colorPicker_sprite[41,3] = 212

colorPicker_sprite[42,1] = 255 //COLOR 42  
colorPicker_sprite[42,2] = 0
colorPicker_sprite[42,3] = 170

colorPicker_sprite[43,1] = 255 //COLOR 43  
colorPicker_sprite[43,2] = 0
colorPicker_sprite[43,3] = 128

colorPicker_sprite[44,1] = 255 //COLOR 44  
colorPicker_sprite[44,2] = 0
colorPicker_sprite[44,3] = 85

colorPicker_sprite[45,1] = 255 //COLOR 45  
colorPicker_sprite[45,2] = 0
colorPicker_sprite[45,3] = 43   
  

//other bits
global fullscreen as integer = 0 //use variable to set application to full screen or window 0=window 1=full screen
global last_used_editbox as integer // store the id number of the last used editbox
global mouseOldX as float //to store the mosue previous X when needed
global mouseOldY as float //to store the mouse previous Y when needed

global license as integer //check if license info is valid or not

global DEBUG as integer //debug variable to check things
 


ID_numbers:
remstart
******* IMAGE, SPRITE AND OBJECT ID NUMBERS *************
*********************************************************
*** actual ID numbers are sorted in to groups/type    ***
*** Sprites/Images 1000 - 1086                        ***
*** Textures 1100 - 1105                              ***
*** Texts 1200 - 1254                                 ***
*** Edit Boxes 1300 - 1338                            ***
*** 3D Mesh 1400 - 1402                               ***
*** Lights  1500 - 1504                               ***
*** ColorPicker 1600 - 1699                           *** 
*** FPSC Mesh 1700 - 1999                             ***
*** FPSC Texture 2000 - as much as needed             ***
*********************************************************
remend 


//********************** CORE **********************************
global gui_image as integer = 1000 //gui image
global gui_sprite1 as integer = 1001 //right big panel
global gui_sprite2 as integer = 1002 //top small panel
global gui_sprite3 as integer = 1003 //popup panel
global addmesh_image as integer = 1004 //add mesh image
global addmesh_sprite as integer = 1005 //add mesh sprtie
global addtexture_image as integer = 1006 //add texture image
global addtexture_sprite as integer = 1007 // add texture sprite
global playAnimation_image as integer = 1008 //play animation image
global playAnimation_sprite as integer = 1009 //play animtion sprite
global camera_image as integer = 1009 //camera icon image
global camera_sprite as integer = 1010 //camera icon sprite
global about_image as integer = 1027 //about icon image
global about_sprite as integer = 1028 //about icon sprite
global help_image as integer = 1056 //help icon image
global help_sprite as integer = 1057 //sprite using the image
global nav_mesh as integer = 1402 //a 3D mesh used as navigation mesh for the camera


//load mesh items
global parentMesh as integer = 1400 //mesh loaded in to the program
global childMesh as integer = 1401 //child mesh loaded in to the porgram


//***************** LIGHTS*******************************

//global cam_pointlight as integer = 1500 //point light of camera can be toggled on/off




//*****CAMERA EDITBOXES************
global camspeedBox as Integer = 1300 //edit box displaying camera speed
global camposXBox as Integer = 1301 //edit box displaying camera X position
global camposYBox as Integer = 1302 //edit box displaying camera Y position
global camposZBox as integer = 1303 //edit box displaying camera Z position

//*****PARENT EDITBOXES**********
global textureTransparencyBox as Integer = 1304 //edit box displaying transparency value of texture 0 not transparent 1 transparent
global objectStartFrameBox as Integer = 1305 //edit box to display and set start frame of object animation
global objectEndFrameBox as Integer = 1306 //edit box to display and set end frame of AnimLoopobject animation
global objectAnimSpeedBox as Integer = 1307 //editbox to display and set object animation speed
global objectAnimLoopBox as integer = 1308 //edit box to display and set object animation loop
//global objectScaleBox as Integer = 1309


//********CHILD EDITBOXES************
global child_nameofbone_editbox as integer = 1313 //edit box to enter bone name
global child_localx_editbox as integer = 1314 //edit box to enter local X position of mesh
//global child_localy_editbox as integer = 1315 //edit box to enter local y position of mesh
//global child_localz_editbox as integer = 1316 //edit box to enter local z position of mesh
global child_rotatex_editbox as integer = 1317 //edit box to display rotateion on X axes
//global child_rotatey_editbox as integer = 1318 //edit box to display rotation on Y axes
//global child_rotatez_editbox as integer = 1319 //edit box to display rotation on Z axes
global child_scale_editbox as integer = 1320 //scale of child object




//**********CAMERA TEXTS**************
global camera_header_text as integer = 1228//header text in the right side of the panel
global camspeedText as Integer = 1203 //text to display "Camera speed"
global camposXText as Integer = 1204 //text to display "Camera X"
global camposYText as Integer = 1205 //text to display "Camera Y"
global camposZText as Integer = 1206 //Text to display "Camera Z"



//**********PARENT TEXTS**************
global parent_header_text as integer = 1229 //header text on the right side of the parent
global TextureTransparencyText as Integer = 1207 //text to display "Mesh Transperancy"
global objectStartFrameText as Integer = 1208 //text to display "Object Start Frame"
global objectEndFrameText as Integer = 1209 //text to display "Object End Frame"
global objectAnimSpeedText as Integer = 1210 //text to display "Animation Speed"
global objectAnimLoopText as Integer = 1211 //text to display "Animation loop"
//global objectScaleText as Integer = 1212 //text to display "Object scale"



//******CHILD TEXTS*********
global child_header_text as integer = 1230 //header text on the right side of the panel 
global child_nameofbone_text as integer = 1231 //name of bone text
global child_localx_text as integer = 1232 //local X position of mesh
//global child_localy_text as integer = 1233 //local Y position of mesh
//global child_localz_text as integer = 1234 //local Z position of mesh
global child_rotatex_text as integer = 1236 //rotation of mesh on X axes
//global child_rotatey_text as integer = 1237 //rotation of mesh on Y axes
//global child_rotatez_text as integer = 1238 //rotation of mesh on Z axes
global child_scale_text as integer = 1239 //scale of mesh


//************ MESH TEXTS**********************
global mesh_header_text as integer = 1250 //text displayed on the right side to keep mesh options to


 
//make screenshot menu items 
global imageNameBox as Integer = 1310 //edit box to enter image name
global bluredBackground_image as Integer = 1014 //blured background image used in screenshot menu
global bluredBackground_sprite as Integer = 1015 //sprite to display above image
global enterFileName_text as Integer = 1213 //text to display "Enter file name"
global enterImageSize_text as Integer = 1214 //text to display "Enter image size"
global enterImageWidthBox as Integer = 1311 //edit box used to enter image width 
global enterImageHeightBox as Integer = 1312 //edit box used to enter image height
global Xsign_text as Integer = 1215 //text used between the image width and height box to display an "X"
global makeScreenshotButton_image as integer = 1016 //image used for button
global enterImageNameButton_sprite as integer = 1017 //sprite used to display button to enrer image name
global enterImageSizeButton_sprite as Integer = 1018 //sprite used to display button to enter image size
global gui_sprite4 as integer = 1019 //screenshot menu background
global resizeCaptured_image as Integer = 1020 // image to resize
global resizeCaptured_sprite as Integer= 1021 //sprite used to resize image
global resizePreview_Image as Integer = 1022 //preview image in resize screen
global resizePreview_Sprite as Integer = 1023 //preview sprite using the above image

//message dialogs
global message_background_image as integer = 1034 //blured background image
global message_background_sprite as integer = 1035 //sprite displayed in the background
global message_text as Integer = 1216 //mesage displayed if no animation found
global okMessageButton_image as Integer = 1024 //ok button image
global okMessageButton_sprite as Integer = 1025 //ok button sprite
global gui_message_sprite as integer = 1026 //background sprite using gui_image


//about page
global about_gui_sprite as integer = 1029 //background using gui_image
global about_logo_image as integer = 1030 //logo of 3D2Sprite 
global about_logo_sprite as integer = 1031 // sprite displayed
global about_license_image as integer = 1032 //image of license
global about_license_sprite as integer = 1033 //sprite of license displayed on about page
global about_text1 as integer = 1217 //text in first line
global about_text2 as integer = 1218 //text in line 2
global about_text3 as integer = 1219 //text in line 3
global about_text4 as integer = 1220 //text in line 5
global about_text5 as integer = 1242 //click to read more text
global about_text6 as integer = 1251 //text displaying website

//add mesh menu
global addmesh_text1 as integer = 1221 //text display load parent mesh
global addmesh_text2 as integer = 1222 //text to display load child mesh
global addmesh_text3 as integer = 1235//remove child mesh text
global addmesh_gui_sprite as integer = 1036 //gui background of load mesh menu it using gui_image
global addmesh_selectionbox_image as integer = 1037 //image used to display behind text when mouse is over
global addmesh_selectionbox_sprite as integer = 1038 //sprite using the image


//add texture menu
global addtexture_text1 as integer = 1223 //text to diplay load Parent Texture
global addtexture_text2 as integer = 1224 //text to display load Child texture
global addtexture_gui_sprite as integer = 1039 //gui background of load texture menu it using gui_image
global addtexture_selectionbox_image as integer = 1040 //image used to display behind text when mouse is over
global addtexture_selectionbox_sprite as integer = 1041 //sprite using the image


//add texture selection menu PARENT
global parentTextureSelection_text1 as integer = 1200 //texture select text (diffuse)
//global parentTextureSelection_text2 as integer = 1201 //texture select text (normal)
//global ParentTextureSelection_text3 as integer = 1202 //texture select text (light)
global parentDiffusePreview_sprite as integer = 1011 //texture select preview sprite
//global parentNormalPreview_sprite as Integer = 1012 //texture select normal map preview sprite
//global parentLightmapPreview_sprite as Integer = 1013 //texture select light map preview sprite
global parentDiffuse_texture as integer = 1100 //diffsue texture of mesh
//global parentNormalmap_texture as integer = 1101 //normal map texture of mesh
//global parentLightmap_texture as integer = 1102 //light map texture of mesh
global parentTextureSelectionbox_image as integer = 1042 //image displayed when selecting texture
global parentTextureSelectionBox_sprite as integer = 1043 //sprite using the image
global parentTextureSelection_gui_sprite as integer = 1044 //gui background of texture selection menu
global parentTransparentColor_text as integer = 1240 //text of transparent color
global parentTransparentPreview_sprite as integer = 1054 //sprtie show preview of transparent color
global parentTransparentR_editbox as integer = 1321 //RGB editboxes to update transparent color
global parentTransparentG_editbox as integer = 1322
global parentTransparentB_editbox as integer = 1323


//add texture selection menu CHILD
global childTextureSelection_text1 as integer = 1225 //texture select text (diffuse)
//global childTextureSelection_text2 as integer = 1226 //texture select text (normal)
//global childTextureSelection_text3 as integer = 1227 //texture select text (light)
global childDiffusePreview_sprite as integer = 1046 //preview sprite
//global childNormalPreview_sprite as Integer = 1047 //texture select normal map preview sprite
//global childLightmapPreview_sprite as Integer = 1048 //texture select light map preview sprite
global childDiffuse_texture as integer = 1103 //diffsue texture of mesh
//global childNormalmap_texture as integer = 1104 //normal map texture of mesh
//global childLightmap_texture as integer = 1105 //light map texture of mesh
global childTextureSelectionbox_image as integer = 1052 //image displayed when selecting texture
global childTextureSelectionBox_sprite as integer = 1053 //sprite using the image
global childTextureSelection_gui_sprite as integer = 1045 //gui background of texture selection menu
global childTransparentColor_text as integer = 1241 //text of transparent color
global childTransparentPreview_sprite as integer = 1055 //sprtie show preview of transparent color
global childTransparentR_editbox as integer = 1324 //RGB editboxes to update transparent color
global childTransparentG_editbox as integer = 1325
global childTransparentB_editbox as integer = 1326



//light properties
global lightoptions_button_image as integer = 1058 //image of light button
global lightoptions_button_sprite as integer = 1059 //sprite of light button
global lightoptions_gui_sprite as integer = 1060 //sprite of light menu background using gui image
global lightoptions_text1 as integer = 1243 //ambient light text
global lightoptions_text2 as integer = 1244 //flashlight text
global lightoptions_text3 as integer = 1245 //flash light radius
global lightoptions_text4 as integer = 1246 //ambient light intensity
global lightoptions_ambientr_editbox as integer = 1327 //Red ambien color editbox
global lightoptions_ambientg_editbox as integer = 1328 //Green ambient color editboc
global lightoptions_ambientb_editbox as integer = 1329 //Blue ambient color editbox
global lightoptions_ambient_preview_sprite as integer = 1061 //ambient color preview sprite
//global lightoptions_flashr_editbox as integer = 1330 //Red component of flash light edit box
//global lightoptions_flashg_editbox as integer = 1331 //Green component of flash light edit box
//global lightoptions_flashb_editbox as integer = 1332 //Blue component of flash light edit box
//global lightoptions_flash_preview_sprite as integer = 1062 //flash color preview sprite
//global lightoptions_flashradius_editbox as integer = 1333 //flash light radius editbox
global lightoptions_sunlight_intensity_editbox as integer = 1334 //sun light intensity editbox
global lightoptions_selection_image as integer = 1063 //image used as selection image
global lightoptions_selection_sprite as integer = 1064 //sprite using the image



//load FPS map
global fpscmap_loadmesh_text as integer = 1247 //text displaye din add mesh menbu
global fpscmap_loadlight_text as integer = 1248 //text displayed in light properties to load lightmap of fps
global fpscmap_removelight_text as integer = 1249 //text displayed in light properties to remov elightmap


//display rotation and position buttons
global positionX_button_image as integer = 1065 //the image used for displaying the button
global positionX_button_sprite as integer = 1066 //sprite using the image
global positionY_button_image as integer = 1067 //the image used for displaying the button
global positionY_button_sprite as integer = 1068 //sprite using the image
global positionZ_button_image as integer = 1069 //the image used for displaying the button
global positionZ_button_sprite as integer = 1070 //sprite using the image 

global rotationX_button_image as integer = 1071 //the image used for displaying the button
global rotationX_button_sprite as integer = 1072 //sprite using the image 
global rotationY_button_image as integer = 1073 //the image used for displaying the button
global rotationY_button_sprite as integer = 1074 //sprite using the image
global rotationZ_button_image as integer = 1075 //the image used for displaying the button
global rotationZ_button_sprite as integer = 1076 //sprite using the image  

global scaleX_button_image as integer = 1077 //the image used for displaying the button
global scaleX_button_sprite as integer = 1078 //sprite using the image
global scaleY_button_image as integer = 1079 //the image used for displaying the button
global scaleY_button_sprite as integer = 1080 //sprite using the image
global scaleZ_button_image as integer = 1081 //the image used for displaying the button
global scaleZ_button_sprite as integer = 1082 //sprite using the image 
global scaleXYZ_button_image as integer = 1083 //the image used for displaying the button
global scaleXYZ_button_sprite as integer = 1084 //sprite using the image                          


//point lights
global Dim pointLight[2,2] as integer //array to store lihghts
pointLight[1,0] = 1501 //3D mesh representing point light 1
pointLight[1,1] = 1502 //point light 1
pointLight[2,0] = 1503 //3D mesh representing point light 2
pointLight[2,2] = 1504 //point light 2

global light_options_pointLight_text1 as integer = 1252 //point light color text
global light_options_pointlight_text2 as integer = 1253 //point light radious text
global light_options_pointlight_preview_sprite as integer = 1085 //sprtie displaying the actual color of the point light
global light_options_pointlightr_editbox as integer = 1335 //editbox to display and change RGB color of point light
global light_options_pointlightg_editbox as integer = 1336
global light_options_pointlightb_editbox as integer = 1337
global light_options_pointlight_radious_editbox as integer = 1338 //editbox to display and change radious of point light
global add_pointlight_text as integer = 1254 //text displayed to add point light


//color picker
global colorPicker_gui_sprite as integer = 1086 //gui background sprite of colorpicker using gui_image
global startColorPickerID as integer = 1600 //start ID of colorpicker sprites
global maxColorPickerSprite as integer = 45 //maximum number of sprites going to be used in color pikcer 

For cps = 1 to maxColorPickerSprite //assign ID numbers to all colorpicker sprite
	colorPicker_sprite[cps,0] = startColorPickerID + cps
Next cps




//******CHECK LICENSE INFO
checkLicenseInfo()

//****** BUILD THE PROGRAM ************
build_window:
setupWindow()
createGUI()
setupCamera()

//********** UPDATE/RUN THE PROGRAM **********
main_loop:
do
		
	If license = 1 //if license info is valid
		If aboutDisplayed = 0 //if about is not displayed
			If messageDisplayed = 0 //if no message displayed
				
				loadMesh()               //load the mesh
				loadMeshAnimation()      //load the mesh animation if it got any animation, otherwise display a message
				loadTexture()            //load texture of mesh
				moveCamera()             //camera control
				updateMesh()             // update mesh scale and transparency
				makeScreenShot()         //capture screen
				openHelp()               //open help document
				changeLightOptions()     //display light options menu    
				drawSelectionBox()       //draw red box to select area to capture
				pickObject()             //experimental feature to pick 3D object
				addPointLight()          //add point light
				pickColor()              //pick color and apply
				displayColorPicker()     //displaying color picker

			Else //If message displayed, delete message 
				If (MouseIsOnSprite(okMessageButton_sprite) and GetRawMouseLeftReleased()) or GetRawKeyReleased(KEY_ESCAPE) or (NOT MouseIsOnSprite(gui_message_sprite) and NOT MouseIsOnSprite(playAnimation_sprite) and GetRawMouseLeftReleased())
					deleteMessage()
				EndIF
			EndIF
			
		Else //If about is displayed, delete it
			If GetRawKeyReleased(KEY_ESCAPE) or (NOT MouseIsOnSprite(about_gui_sprite) and NOT MouseIsOnSprite(about_sprite) and GetRawMouseLeftReleased())
				deleteAboutInfo()
			EndIF
		EndIf
	
	Else//If license info is not valid, display message
		displayMessage("License Info is Invalid!") 	
	EndIf
	
				updateGUI()   //update position of GUI in case the window size is changed
				displayAboutInfo() //display info about the software when the icon is clicked
	Sync()
loop








//*******************************************************************************
//***                             FUNCTIONS                                   ***
//*******************************************************************************

//********* load mesh (also includes remove child mesh) *******************
Function loadMesh()
	
	//position selection box in the menu
	For i = addmesh_text1 to addmesh_text2
		If GetTextHitTest(i,GetRawMouseX(), GetRawMouseY())
			SetSpriteSize(addmesh_selectionbox_sprite,GetSpriteWidth(addmesh_gui_sprite), 20)
			SetSpritePosition(addmesh_selectionbox_sprite,GetSpriteX(addmesh_gui_sprite), GetTextY(i) - 2)
		EndIF
	Next i
	
	//selection box on FPSC text, added later so id does not fit the loop
	If GetTextHitTest(fpscmap_loadmesh_text,GetRawMouseX(), GetRawMouseY())
		SetSpriteSize(addmesh_selectionbox_sprite,GetSpriteWidth(addmesh_gui_sprite), 20)
		SetSpritePosition(addmesh_selectionbox_sprite,GetSpriteX(addmesh_gui_sprite), GetTextY(fpscmap_loadmesh_text) - 2)
	EndIF
	
	//selection box on remove FPSC mesh text, added later so it does not fit the for loop
	If GetTextHitTest(addmesh_text3,GetRawMouseX(), GetRawMouseY())
		SetSpriteSize(addmesh_selectionbox_sprite,GetSpriteWidth(addmesh_gui_sprite), 20)
		SetSpritePosition(addmesh_selectionbox_sprite,GetSpriteX(addmesh_gui_sprite), GetTextY(addmesh_text3) - 2)
	EndIF
	
	//display ad mesh menu when the icon is clicked
	If SpritePressed(addmesh_sprite,0)
		displayAddMeshMenu()
	EndIF
	
	//delete menu if mouse clicked outside the menu gui
	If NOT MouseIsOnSprite(addmesh_gui_sprite) and GetRawMouseLeftReleased()
		deleteAddMeshMenu()
	EndIF 
	
	
	//******************load PARENT mesh***********************************************
	
	If GetTextHitTest(addmesh_text1, GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		
		deleteAddMeshMenu() //delete menu after mesh is loaded
		
		//select 3d file and load it
		parentMeshPath = ChooseRawFile("*.x;*.fbx;*.dae;*.3ds;*.md3;*.smd;*.md5;*.lwo;*.ac;*.b3d;*.3d;*.lws;*.ms3d;*.blend;*.m3;*.obj;*.ago")
		
		If NOT parentMeshPath = "" //check if any file is selected or not
			parent_mesh_selected = 1 
		Else
			parent_mesh_selected = 0
		EndIF
		
		If parent_mesh_selected = 1 //only if a file is selected earlier
									//delete images and mesh from memory including child mesh
			DeleteObject(parentMesh)
			DeleteImage(parentDiffuse_texture)
			//DeleteImage(parentNormalmap_texture)
			//DeleteImage(parentLightmap_texture)
			
			DeleteObject(childMesh)
			DeleteImage(childDiffuse_texture)
			//DeleteImage(childNormalmap_texture)
			//DeleteImage(childLightmap_texture)
			
			deleteFPSCLevel()
			
			resetCameraInfo()
			resetParentMeshInfo()
			resetChildMeshInfo()
		
			//update camera
			SetCameraPosition(1,cameraposX,cameraposY,cameraposZ)
			SetCameraLookAt(1,GetObjectX(parentMesh), GetObjectY(parentMesh), GetObjectZ(parentMesh), 0)
			
			//load mesh and set position
			LoadObject(parentMesh,parentMeshPath)
			SetObjectPosition(parentMesh,objectposX,objectposY,objectposZ)
			SetObjectTransparency(parentMesh,object_transperancy)
			parentAnimMeshPath = parentMeshPath
			parentMeshPath = ""
			parent_mesh_loaded = 1
			parent_mesh_animation_loaded = 0 //no animtion is loaded	
		EndIF
	EndIF
	
	
	
	
	
	
	
	
	//********************load CHILD mesh****************************************
	
	If GetTextHitTest(addmesh_text2,GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		
		deleteAddMeshMenu() //delete menu after mesh is loaded
		
		//select 3d file and load it
		If parent_mesh_animation_loaded = 1 and parent_mesh_loaded = 1 //if parent mesh is loaded
			childMeshPath = ChooseRawFile("*.x;*.dae;*.3ds;*.md3;*.smd;*.md5;*.lwo;*.ac;*.b3d;*.3d;*.lws;*.ms3d;*.blend;*.m3;*.obj;*.ago")
		ElseIf parent_mesh_loaded = 0
			displayMessage("Need to load Parent mesh first!")
		ElseIF parent_mesh_animation_loaded = 0
			displayMessage("Need to load Parent Animation first!")
		EndIF
		
		//check if child mesh is selected or not
		If NOT childMeshPath = ""
			child_mesh_selected = 1
		Else
			child_mesh_selected = 0
		EndIF
		
		// only if child mesh is selected and animation of parent mesh is loaded
		If child_mesh_selected = 1 and parent_mesh_animation_loaded = 1
			//delete previous child mesh and textures and reset values
			DeleteObject(childMesh)
			DeleteImage(childDiffuse_texture)
			//DeleteImage(childNormalmap_texture)
			//DeleteImage(childLightmap_texture)
			
			resetChildMeshInfo()
			
			
			//load mesh and set position
			LoadObject(childMesh,childMeshPath)
			SetObjectPosition(childMesh,0,0,0)
			
			//fix to bone
			boneID = GetObjectBoneByName(parentMesh,GetEditBoxText(child_nameofbone_editbox))
			FixObjectToBone(childMesh,parentMesh,boneID)
			
			//move local position
			MoveObjectLocalX(childMesh,ValFloat(GetEditboXtext(child_localx_editbox)))
			//MoveObjectLocalY(childMesh,ValFloat(GetEditBoxText(child_localy_editbox)))
			//MoveObjectLocalZ(childMesh,ValFloat(GetEditboXtext(child_localz_editbox)))

			
			
			child_mesh_loaded = 1
		EndIF
	EndIf
		
		
		
		
		
		
		
		
		
		
		
		
	//***************************** LOAD FPSC MAP*********************************************
	If GetTextHitTest(fpscmap_loadmesh_text, GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()

		SetFolder("/fpsc")
		If GetFileExists("mesh-1.obj") //only if the first .obj file is present in the folder
			If parent_mesh_loaded = 1 //DELETE PARENT MESH
				DeleteObject(parentMesh)
				DeleteImage(parentDiffuse_texture)
				//DeleteImage(parentNormalmap_texture)
				//DeleteImage(parentLightmap_texture)
			
				parentAnimMeshPath = ""
				parent_mesh_loaded = 0
			EndIf
		
			If child_mesh_loaded = 1 //DELETE CHILD MESH
				DeleteObject(childMesh)
				DeleteImage(childDiffuse_texture)
				//DeleteImage(childNormalmap_texture)
				//DeleteImage(childLightmap_texture)
			
				child_mesh_loaded = 0
			EndIf
			
			//resetCameraInfo()
			resetParentMeshInfo()
			resetChildMeshInfo()
			
			If fpscmap_loaded_nolightmap = 1 or fpscmap_loaded_withlightmap = 1 //delete FPSC level in case anything is loaded
				deleteFPSCLevel()
			EndIf
			
			loadFPSCLevel() //load fpsc level from the fpsc folder
		Else
			SetFolder("/media")
			displayMessage("No .obj file can be found!") //if no .obj file present, display the message
		EndIf
		deleteAddMeshMenu() //delete menu after mesh is loaded			
	EndIf
		
	
	
	//add point ligjt
	
	
	
	
	
	//********************** REMOVE CHILD MESH********************************
	If (GetTextHitTest(addmesh_text3,GetRawMouseX(),GetRawMouseY()) and GetRawMouseLeftReleased()) or (pickedObjID = childMesh and GetRawKeyPressed(KEY_DELETE))
		
		If child_mesh_loaded = 1 //only if a child mesh is loaded
			//delete previous child mesh and textures and reset values
			DeleteObject(childMesh)
			DeleteImage(childDiffuse_texture)
			//DeleteImage(childNormalmap_texture)
			//DeleteImage(childLightmap_texture)
			
			resetChildMeshInfo()
			
		
			child_mesh_loaded = 0
		Else
			displayMessage("No child mesh is loaded!") //if no child mesh is loaded, display the message
		EndIF
		
		deleteAddMeshMenu()
	EndIF
		
EndFunction


//********** UPDATE MESH **************
Function updateMesh()
	
	//update position, rotation and scale of selected object
	
	If GetRawMouseLeftReleased()
		moveX_selected = 0
		moveY_selected = 0
		moveZ_selected = 0
		
		rotateX_selected = 0
		rotateY_selected = 0
		rotateZ_selected = 0
		
		scaleX_selected = 0
		scaleY_selected = 0
		scaleZ_selected = 0
		scaleXYZ_selected = 0
	EndIf
	
	//position X
	If GetSpriteHitTest(positionX_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			moveX_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If GetRawMouseLeftReleased()
		moveX_selected = 0
	EndIf
	
	If moveX_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //move left
			//MoveObjectLocalX(pickedObjID,-ValFloat(GetEditboXtext(child_localx_editbox)))
			SetObjectPosition(pickedObjID, GetObjectX(pickedObjID) -ValFloat(GetEditBoxText(child_localx_editbox)),GetObjectY(pickedObjID),GetObjectZ(pickedObjID))
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //move right
			//MoveObjectLocalX(pickedObjID,ValFloat(GetEditboXtext(child_localx_editbox)))
			SetObjectPosition(pickedObjID, GetObjectX(pickedObjID) +ValFloat(GetEditBoxText(child_localx_editbox)),GetObjectY(pickedObjID),GetObjectZ(pickedObjID))
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	//position Y
	If GetSpriteHitTest(positionY_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			moveY_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If moveY_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //move up
			//MoveObjectLocalY(pickedObjID,-ValFloat(GetEditboXtext(child_localx_editbox))) 
			SetObjectPosition(pickedObjID, GetObjectX(pickedObjID),GetObjectY(pickedObjID) -ValFloat(GetEditboXtext(child_localx_editbox)),GetObjectZ(pickedObjID))
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //move down
			//MoveObjectLocalY(pickedObjID,ValFloat(GetEditboXtext(child_localx_editbox)))
			SetObjectPosition(pickedObjID, GetObjectX(pickedObjID),GetObjectY(pickedObjID) +ValFloat(GetEditboXtext(child_localx_editbox)),GetObjectZ(pickedObjID))
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	//position Z
	If GetSpriteHitTest(positionZ_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			moveZ_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If moveZ_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //move up
			//MoveObjectLocalZ(pickedObjID,-ValFloat(GetEditboXtext(child_localx_editbox)))
			SetObjectPosition(pickedObjID, GetObjectX(pickedObjID),GetObjectY(pickedObjID),GetObjectZ(pickedObjID) -ValFloat(GetEditboXtext(child_localx_editbox)))
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //move down
			//MoveObjectLocalZ(pickedObjID,ValFloat(GetEditboXtext(child_localx_editbox)))
			SetObjectPosition(pickedObjID, GetObjectX(pickedObjID),GetObjectY(pickedObjID),GetObjectZ(pickedObjID) +ValFloat(GetEditboXtext(child_localx_editbox)))
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	
	//rotation X
	If GetSpriteHitTest(rotationX_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			rotateX_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If rotateX_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //rotate negative direction
			RotateObjectGlobalX(pickedObjID,-ValFloat(GetEditboXtext(child_rotatex_editbox)))
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //rotate pozitive direction
			RotateObjectGlobalX(pickedObjID,ValFloat(GetEditboXtext(child_rotatex_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	//rotation Y
	If GetSpriteHitTest(rotationY_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			rotateY_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If rotateY_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //rotate negative direction
			RotateObjectGlobalY(pickedObjID,-ValFloat(GetEditboXtext(child_rotatex_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //rotate pozitive direction
			RotateObjectGlobalY(pickedObjID,ValFloat(GetEditboXtext(child_rotatex_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	//rotation Z
	If GetSpriteHitTest(rotationZ_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			rotateZ_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If rotateZ_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //rotate negative direction
			RotateObjectGlobalZ(pickedObjID,-ValFloat(GetEditboXtext(child_rotatex_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //rotate pozitive direction
			RotateObjectGlobalZ(pickedObjID,ValFloat(GetEditboXtext(child_rotatex_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	
	//scale X
	If GetSpriteHitTest(scaleX_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			scaleX_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If scaleX_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //rotate negative direction
			SetObjectScalePermanent(pickedObjID,1 - ValFloat(GetEditboXtext(child_scale_editbox)), 1, 1) 
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //rotate pozitive direction
			SetObjectScalePermanent(pickedObjID,1 + ValFloat(GetEditboXtext(child_scale_editbox)), 1, 1) 
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	//scale Y
	If GetSpriteHitTest(scaleY_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			scaleY_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If scaleY_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //rotate negative direction
			SetObjectScalePermanent(pickedObjID,1, 1 - ValFloat(GetEditboXtext(child_scale_editbox)), 1) 
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //rotate pozitive direction
			SetObjectScalePermanent(pickedObjID,1, 1 + ValFloat(GetEditboXtext(child_scale_editbox)), 1) 
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	//scale Z
	If GetSpriteHitTest(scaleZ_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			scaleZ_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If scaleZ_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //rotate negative direction
			SetObjectScalePermanent(pickedObjID,1, 1, 1 - ValFloat(GetEditboXtext(child_scale_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //rotate pozitive direction
			SetObjectScalePermanent(pickedObjID,1, 1, 1 + ValFloat(GetEditboXtext(child_scale_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	//scale XYZ
	If GetSpriteHitTest(scaleXYZ_button_sprite, GetRawMouseX(), GetRawMouseY()) and pickedObjID > 0
		If GetRawMouseLeftPressed()
			scaleXYZ_selected = 1
			mouseOldX = GetRawMouseX()
			mouseOldY = GetRawMouseY()
		EndIf
	EndIf
	
	If scaleXYZ_selected = 1
		If GetRawMouseLeftState() = 1 and GetRawMouseX() < mouseOldX //rotate negative direction
			SetObjectScalePermanent(pickedObjID,1 - ValFloat(GetEditboXtext(child_scale_editbox)), 1 - ValFloat(GetEditboXtext(child_scale_editbox)), 1 - ValFloat(GetEditboXtext(child_scale_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf
		
		If GetRawMouseLeftState() = 1 and GetRawMouseX() > mouseOldX //rotate pozitive direction
			SetObjectScalePermanent(pickedObjID,1 + ValFloat(GetEditboXtext(child_scale_editbox)), 1 + ValFloat(GetEditboXtext(child_scale_editbox)), 1 + ValFloat(GetEditboXtext(child_scale_editbox))) 
			mouseOldX = GetRawMouseX()
		EndIf 
	EndIf
	
	
	//check value of editboxes
	
	//movement
	If GetEditBoxChanged(child_localx_editbox)
		If ValFloat(GetEditBoxText(child_localx_editbox)) < 0 or ValFloat(GetEditBoxText(child_localx_editbox)) = -0
			SetEditBoxText(child_localx_editbox,Left(Str(childLocalX),3))
			displayMessage("Value must be greater then 0!")
		Else
			childLocalX = ValFloat(GetEditBoxText(child_localx_editbox))
		EndIf
	EndIF
	
	//rotation
	If GetEditBoxChanged(child_rotatex_editbox)
		If ValFloat(GetEditBoxText(child_rotatex_editbox)) < 0 or ValFloat(GetEditBoxText(child_rotatex_editbox)) = -0
			SetEditBoxText(child_rotatex_editbox,Left(Str(childRotateX),3))
			displayMessage("Value must be greater then 0!")
		Else
			childRotateX = ValFloat(GetEditBoxText(child_rotatex_editbox))
		EndIf
	EndIf
	
	//scale
	If GetEditBoxChanged(child_scale_editbox)
		If ValFloat(GetEditBoxText(child_scale_editbox)) <=0 or ValFloat(GetEditBoxText(child_scale_editbox)) >= 1
			SetEditBoxText(child_scale_editbox,Left(Str(childScale),4))
			displayMessage("Must be Float Value between 0 and 1!")
		Else
			childScale = ValFloat(GetEditBoxText(child_scale_editbox))
		EndIf
	EndIf





	//********PARENT*****************
	
	//update transparency if editbox is changed
	If GetEditBoxChanged(textureTransparencyBox)
		If Val(GetEditBoxText(textureTransparencyBox)) < 0 or Val(GetEditBoxText(textureTransparencyBox)) > 1
			SetEditBoxText(textureTransparencyBox,Str(object_transperancy))
			displayMessage("Value must be 0 or 1!")
		Else
			object_transperancy = Val(GetEditBoxText(textureTransparencyBox))
			SetObjectTransparency(parentMesh,object_transperancy)
		EndIf
	EndIf
	
	remstart
	If parentTextureSelectionMenu_displayed = 0 and childTextureSelectionMenu_displayed = 0 and light_options_displayed = 0 and overlayScreenActive = 0
		If GetRawKeyState(KEY_RIGHT) = 1 then RotateObjectLocalY(parentMesh,-meshspeed)
		If GetRawKeyState(KEY_LEFT) = 1 then RotateObjectLocalY(parentMesh,meshspeed)
		If GetRawKeyState(KEY_UP) = 1 then RotateObjectLocalX(parentMesh,meshspeed)
		If GetRawKeyState(KEY_DOWN) = 1 then RotateObjectlocalX(parentMesh,-meshspeed)
	EndIf
	
	//update scale if editbox is changed
	If GetEditBoxChanged(objectScaleBox)
		If ValFloat(GetEditBoxText(objectScaleBox)) <= 0 or ValFloat(GetEditBoxText(objectScaleBox)) >= 1
			SetEditBoxText(objectScaleBox,Left(Str(parentScale),3))
			displayMessage("Must be Float Value between 0 and 1!")
		Else
			parentScale = ValFloat(GetEditBoxText(objectScaleBox))
			last_used_editbox = objectScaleBox
		EndIf
	EndIf
	
	If last_used_editbox = objectScaleBox
		If GetRawKeyPressed(KEY_PAGEUP)
			SetObjectScalePermanent(parentMesh,1 + ValFloat(GetEditBoxText(objectScaleBox)),1 + ValFloat(GetEditBoxText(objectScaleBox)),1 + ValFloat(GetEditBoxText(objectScaleBox)))
		EndIF
		If GetRawKeyPressed(KEY_PAGEDOWN)
			SetObjectScalePermanent(parentMesh,1 - ValFloat(GetEditBoxText(objectScaleBox)),1 - ValFloat(GetEditBoxText(objectScaleBox)),1 - ValFloat(GetEditBoxText(objectScaleBox)))
		EndIF
	EndIf
	remend
	
	
	
	//******CHILD************
	//update child bone if editbox is changed
	If GetEditBoxChanged(child_nameofbone_editbox)
		boneID = GetObjectBoneByName(parentMesh,GetEditBoxText(child_nameofbone_editbox))
		FixObjectToBone(childMesh,parentMesh,boneID)
	EndIF
	
	remstart
	//update local X
	If GetEditBoxChanged(child_localx_editbox)
		If ValFloat(GetEditBoxText(child_localx_editbox)) < 0
			SetEditBoxText(child_localx_editbox,Left(Str(childLocalX),3))
			displayMessage("Value must be greater then 0!")
		Else
			childLocalX = ValFloat(GetEditBoxText(child_localx_editbox))
			last_used_editbox = child_localx_editbox
		EndIf
	EndIF
	
	If last_used_editbox = child_localx_editbox
		If GetRawKeyPressed(KEY_PAGEUP)
			MoveObjectLocalX(childMesh,ValFloat(GetEditboXtext(child_localx_editbox)))
		EndIF
		IF GetRawKeyPressed(KEY_PAGEDOWN)
			MoveObjectLocalX(childMesh,-ValFloat(GetEditboXtext(child_localx_editbox)))
		EndIF
	EndIF
	
	
	//update local Y
	If GetEditbOxChanged(child_localy_editbox)
		If ValFloat(GetEditBoxText(child_localy_editbox)) < 0
			SetEditBoxText(child_localy_editbox,Left(Str(childLocalY),3))
			displayMessage("Value must be greater then 0!")
		Else
			childLocalY = ValFloat(GetEditBoxText(child_localy_editbox))
			last_used_editbox = child_localy_editbox
		EndIf
	EndIF
	
	If last_used_editbox = child_localy_editbox
		If GetRawKeyPressed(KEY_PAGEUP)
			MoveObjectLocalY(childMesh,ValFloat(GetEditboXtext(child_localy_editbox)))
		EndIF
		If GetRawKeyPressed(KEY_PAGEDOWN)
			MoveObjectLocalY(childMesh,-ValFloat(GetEditboXtext(child_localy_editbox)))
		EndIF
	EndIF
	
	//update local Z
	If GetEditbOxChanged(child_localz_editbox)
		If ValFloat(GetEditBoxText(child_localz_editbox)) < 0
			SetEditBoxText(child_localz_editbox,Left(Str(childLocalZ),3))
			displayMessage("Value must be greater then 0!")
		Else
			childLocalZ = ValFloat(GetEditBoxText(child_localz_editbox))
			last_used_editbox = child_localz_editbox
		EndIf
	EndIF
	
	If last_used_editbox = child_localz_editbox
		If GetRawKeyPressed(KEY_PAGEUP)
			MoveObjectLocalZ(childMesh,ValFloat(GetEditboXtext(child_localz_editbox)))
		EndIf
		If GetRawKeyPressed(KEY_PAGEDOWN)
			MoveObjectLocalZ(childMesh,-ValFloat(GetEditboXtext(child_localz_editbox)))
		EndIf
	EndIF
	
	
	//update rotation on X axes
	If GetEditBoxChanged(child_rotatex_editbox)
		If ValFloat(GetEditBoxText(child_rotatex_editbox)) < 0
			SetEditBoxText(child_rotatex_editbox,Left(Str(childRotateX),3))
			displayMessage("Value must be greater then 0!")
		Else
			childRotateX = ValFloat(GetEditBoxText(child_rotatex_editbox))
			last_used_editbox = child_rotatex_editbox
		EndIf
	EndIf
	
	If last_used_editbox = child_rotatex_editbox
		If GetRawKeyPressed(KEY_PAGEUP)
			RotateObjectLocalX(childMesh,ValFloat(GetEditboXtext(child_rotatex_editbox)))
		EndIF
		If GetRawKeyPressed(KEY_PAGEDOWN)
			RotateObjectLocalX(childMesh,-ValFloat(GetEditboXtext(child_rotatex_editbox)))
		EndIF
	EndIf
	
	
	//update rotation on Y axes
	If GetEditBoxChanged(child_rotatey_editbox)
		If ValFloat(GetEditBoxText(child_rotatey_editbox)) < 0
			SetEditBoxText(child_rotatey_editbox,Left(Str(childRotateY),3))
			displayMessage("Value must be greater then 0!")
		Else
			childRotateY = ValFloat(GetEditBoxText(child_rotatey_editbox))
			last_used_editbox = child_rotatey_editbox
		EndIf
	EndIf
	
	If last_used_editbox = child_rotatey_editbox
		If GetRawKeyPressed(KEY_PAGEUP)
			RotateObjectLocalY(childMesh,ValFloat(GetEditboXtext(child_rotatey_editbox)))
		EndIF
		If GetRawKeyPressed(KEY_PAGEDOWN)
			RotateObjectLocalY(childMesh,-ValFloat(GetEditboXtext(child_rotatey_editbox)))
		EndIF
	EndIf
	
	//update rotation on Z axes
	If GetEditBoxChanged(child_rotatez_editbox)
		If ValFloat(GetEditBoxText(child_rotatez_editbox)) < 0
			SetEditBoxText(child_rotatez_editbox,Left(Str(childRotateZ),3))
			displayMessage("Value must be greater then 0!")
		Else
			childRotateZ = ValFloat(GetEditBoxText(child_rotatez_editbox))
			last_used_editbox = child_rotatez_editbox
		EndIf
	EndIf
	
	If last_used_editbox = child_rotatez_editbox
		If GetRawKeyPressed(KEY_PAGEUP)
			RotateObjectLocalZ(childMesh,ValFloat(GetEditboXtext(child_rotatez_editbox)))
		EndIF
		If GetRawKeyPressed(KEY_PAGEDOWN)
			RotateObjectLocalZ(childMesh,-ValFloat(GetEditboXtext(child_rotatez_editbox)))
		EndIF
	EndIf
	
	//update Scale of child mesh
	If GetEditBoxChanged(child_scale_editbox)
		If ValFloat(GetEditBoxText(child_scale_editbox)) <=0 or ValFloat(GetEditBoxText(child_scale_editbox)) >= 1
			SetEditBoxText(child_scale_editbox,Left(Str(childScale),3))
			displayMessage("Must be Float Value between 0 and 1!")
		Else
			childScale = ValFloat(GetEditBoxText(child_scale_editbox))
			last_used_editbox = child_scale_editbox
		EndIf
	EndIf
	
	If last_used_editbox = child_scale_editbox
		If GetRawKeyPressed(KEY_PAGEUP)
			SetObjectScalePermanent(childMesh,1 + ValFloat(GetEditboXtext(child_scale_editbox)),1 + ValFloat(GetEditboXtext(child_scale_editbox)),1 + ValFloat(GetEditboXtext(child_scale_editbox)))
		EndIF
		If GetRawKeyPressed(KEY_PAGEDOWN)
			SetObjectScalepermanent(childMesh,1 - ValFloat(GetEditboXtext(child_scale_editbox)),1 - ValFloat(GetEditboXtext(child_scale_editbox)),1 - ValFloat(GetEditboXtext(child_scale_editbox)))
		EndIF
	EndIf
	remend
EndFunction


//*********** LOAD ANIMATION OF PARENT MESH *************
Function loadMeshAnimation()
	If SpritePressed(playAnimation_sprite,0)
		If GetObjectNumAnimations(parentMesh) = 0
			
			//update object animation using the value of the edtboxes
			objectStartFrame = Val(GetEditBoxText(objectStartFrameBox))
			objectEndFrame = Val(GetEditBoxText(objectEndFrameBox))
			objectAnimSpeed = Val(GetEditBoxText(objectAnimSpeedBox))
			objectAnimLoop = Val(GetEditBoxText(objectAnimLoopBox))
		
			DeleteObject(parentMesh)
			LoadObjectWithChildren(parentMesh,parentAnimMeshPath)
			SetObjectImage(parentMesh,parentDiffuse_texture,0)
			SetObjectPosition(parentMesh,objectposX,objectposY,objectposZ)		
		
			//safety check, if mesh got no animations, load mesh with no animations and display a message
			animNum = GetObjectNumAnimations(parentMesh)
			If animNum = 0
				DeleteObject(parentMesh)
				LoadObject(parentMesh,parentAnimMeshPath)
				SetObjectImage(parentMesh,parentDiffuse_texture,0)
				//SetObjectImage(parentMesh,parentNormalmap_texture,1)
				//SetObjectImage(parentMesh,parentLightmap_texture,2)
				displayMessage("ERROR: No animation can be found!")
			Else
				displayMessage("Animations successfully loaded!")
				parent_mesh_animation_loaded = 1
			EndIF
			
		Else
			displayMessage("Animation already Loaded!")
		EndIf
	EndIF
	
	//if editbox values changed, update the animation of the mesh
	If GetEditBoxChanged(objectStartFrameBox) or GetEditBoxChanged(objectEndFrameBox) or GetEditBoxChanged(objectAnimSpeedBox) or GetEditBoxChanged(objectAnimLoopBox)
		If Val(GetEditBoxText(objectAnimLoopBox)) < 0 or Val(GetEditBoxText(objectAnimLoopBox)) > 1 //safety check, if animation loop is different hen 0 or 1, set it to 0 and display message
			SetEditBoxText(objectAnimLoopBox,Str(objectAnimLoop))
			displayMessage("Loop value must be 0 or 1!")
		Else
			objectAnimLoop = Val(GetEditBoxText(objectAnimLoopBox))
		EndIf
		
		If Val(GetEditBoxText(objectAnimSpeedBox)) < 0 //safety check to make sure animation is not set to negative value
			SetEditBoxText(objectAnimSpeedBox,Str(objectAnimSpeed))
			displayMessage("Animation speed must be greater then 0!")
		Else
			objectAnimSpeed = Val(GetEditBoxText(objectAnimSpeedBox))
		EndIf
		
		If Val(GetEditBoxText(objectStartFrameBox)) < 0
			SetEditBoxText(objectStartFrameBox,Str(objectStartFrame))
			displayMessage("Value must be greater then 0!")
		Else
			objectStartFrame = Val(GetEditBoxText(objectStartFrameBox))
		EndIf
		
		If Val(GetEditBoxText(objectEndFrameBox)) < 0
			SetEditBoxText(objectEndFrameBox,Str(objectEndFrame))
			displayMessage("Value must be greater then 0!")
		Else
			objectEndFrame = Val(GetEditBoxText(objectEndFrameBox))
		EndIf
		
		//make sure animation play only if end frame is greater or equal then start frame (otherwise it crash can't play animation backward)
		If objectStartFrame <= objectEndframe
			ResetObjectAnimation(parentMesh)
			PlayObjectAnimation(parentMesh,"",objectStartFrame,objectEndFrame,objectAnimLoop,0) //3870,3900
			SetObjectAnimationSpeed(parentMesh,objectAnimSpeed)
		EndIF
	EndIF

EndFunction

//load Deffuse Texture
Function loadParentDiffuseTexture()
	parentImageD = ChooseRawFile("*.png;*.jpg;*.jpeg;*.bmp")
	
	If NOT parentImageD = ""
		file_selected = 1
	Else
		file_selected = 0
	EndIF
	
	If file_selected = 1
		DeleteImage(parentDiffuse_texture)
		LoadImage(parentDiffuse_texture,parentImageD)
		SetImageTransparentColor(parentDiffuse_texture,parentTransparentR,parentTransparentG,parentTransparentB) //set transparent color to be a weird color, it helps to prevent black color in texture to become transparent when capturing the screen
		SetObjectImage(parentMesh,parentDiffuse_texture,0)
		parentPreviewD = parentDiffuse_texture
		parentImageD = ""
	EndIF
	
EndFunction

//********* load Normal Map **********
remstart
Function loadParentNormalMap()
	parentImageN = ChooseRawFile("*.png;*.jpg;*.jpeg;*.bmp")
	
	If NOT parentImageN = ""
		file_selected = 1
	Else
		file_selected = 0
	EndIF
	
	If file_selected = 1
		DeleteImage(parentNormalmap_texture)
		LoadImage(parentNormalmap_texture,parentImageN)
		SetObjectImage(parentMesh,parentNormalmap_texture,1)
		parentPreviewN = parentNormalmap_texture
		parentImageN = ""
	EndIF
EndFunction
remend

//****** load light map **********
remstart
Function loadParentLightMap()
	parentImageL = ChooseRawFile("*.png;*.jpg;*.jpeg;*.bmp")
	
	If NOT parentImageL = ""
		file_selected = 1
	Else
		file_selected = 0
	EndIF
	
	If file_selected = 1
		DeleteImage(parentLightmap_texture)
		LoadImage(parentLightmap_texture,parentImageL)
		SetObjectImage(parentMesh,parentLightmap_texture,2)
		ParentPreviewL = parentLightmap_texture
		parentImageL = ""
	EndIf
EndFunction
remend

//************LOAD CHILD DIFFUSE MAP TEXTURE*****************
Function loadChildDiffuseTexture()
	childImageD = ChooseRawFile("*.png;*.jpg;*.jpeg;*.bmp")
	
	If NOT childImageD = ""
		file_selected = 1
	Else
		file_selected = 0
	EndIF
	
	If file_selected = 1
		DeleteImage(childDiffuse_texture)
		LoadImage(childDiffuse_texture, childImageD)
		SetImageTransparentColor(childDiffuse_texture,childTransparentR,childTransparentG,childTransparentB) //set transparent color to be pink, it helps to prevent black color in texture to become transparent when capturing the screen
		SetObjectImage(childMesh, childDiffuse_texture,0)
		childPreviewD = childDiffuse_texture
		childImageD = ""
	EndIF
EndFunction


//************LOAD CHILD NORMAL MAP TEXTURE******************
remstart
Function loadChildNormalMap()
	childImageN = ChooseRawFile("*.png;*.jpg;*.jpeg;*.bmp")
	
	If NOT childImageN = ""
		file_selected = 1
	Else
		file_selected = 0
	EndIF
	
	If file_selected = 1
		DeleteImage(childNormalmap_texture)
		LoadImage(childNormalmap_texture, childImageN)
		SetObjectImage(childMesh, childNormalmap_texture,1)
		childPreviewN = childNormalmap_texture
		childImageN = ""
	EndIf
EndFunction
remend

//************LOAD CHILD LIGHT SPECULAR MAP TEXTURE**************
remstart
Function loadChildLightMap()
	childImageL = ChooseRawFile("*.png;*.jpg;*.jpeg;*.bmp")
	
	If NOT childImageL = ""
		file_selected = 1
	Else
		file_selected = 0
	EndIF
	
	If file_selected = 1
		DeleteImage(childLightmap_texture)
		LoadImage(childLightmap_texture, childImageL)
		SetObjectImage(childMesh, childLightmap_texture,2)
		childPreviewL = childLightmap_texture
		childImageL = ""
	EndIf
EndFunction
remend


//******** LOAD MESH TEXTURES ***********
Function loadTexture()

	//display add texture menu
	If SpritePressed(addtexture_sprite,0)
		displayAddTextureMenu()
	EndIF
	
	//position selection box in addtexture menu
	For i = addtexture_text1 to addtexture_text2
		If GetTextHitTest(i,GetRawMouseX(), GetRawMouseY())
			SetSpriteSize(addtexture_selectionbox_sprite,GetSpriteWidth(addtexture_gui_sprite), 20)
			SetSpritePosition(addtexture_selectionbox_sprite,GetSpriteX(addtexture_gui_sprite), GetTextY(i) - 2)
		EndIF
	Next i
	
	
	//load PARENT texture**********************************************************
	
	//update parent texture transparent color
	If GetEditBoxChanged(parentTransparentR_editbox) //RED
		If Val(GetEditBoxText(parentTransparentR_editbox)) < 0 or Val(GetEditBoxText(parentTransparentR_editbox)) > 255
			parentTransparentR = 255
			SetEditBoxText(parentTransparentR_editbox,Str(parentTransparentR))
			displayMessage("Value range is 0 - 255!")
		EndIf
		parentTransparentR = Val(GetEditBoxText(parentTransparentR_editbox))
		SetSpriteColor(parentTransparentPreview_sprite,parentTransparentR,parentTransparentG,parenttransparentB,parentTransparentAlpha)
		SetImageTransparentColor(parentDiffuse_texture,parentTransparentR,parentTransparentG,parentTransparentB)
	EndIF
	
	If GetEditBoxChanged(parentTransparentG_editbox) //GREEN
		If Val(GetEditBoxText(parentTransparentG_editbox)) < 0 or Val(GetEditBoxText(parentTransparentG_editbox)) > 255
			parentTransparentG = 0
			SetEditBoxText(parentTransparentG_editbox,Str(parentTransparentG))
			displayMessage("Value range is 0 - 255!")
		EndIf
		parentTransparentG = Val(GetEditBoxText(parentTransparentG_editbox))
		SetSpriteColor(parentTransparentPreview_sprite,parentTransparentR,parentTransparentG,parenttransparentB,parentTransparentAlpha)
		SetImageTransparentColor(parentDiffuse_texture,parentTransparentR,parentTransparentG,parentTransparentB)
	EndIF
	
	If GetEditBoxChanged(parentTransparentB_editbox) //BLUE
		If Val(GetEditBoxText(parentTransparentB_editbox)) < 0 or Val(GetEditBoxText(parentTransparentB_editbox)) > 255
			parentTransparentB = 255
			SetEditBoxText(parentTransparentB_editbox,Str(parentTransparentB))
			displayMessage("Value range is 0 - 255!")
		EndIf
		parentTransparentB = Val(GetEditBoxText(parentTransparentB_editbox))
		SetSpriteColor(parentTransparentPreview_sprite,parentTransparentR,parentTransparentG,parenttransparentB,parentTransparentAlpha)
		SetImageTransparentColor(parentDiffuse_texture,parentTransparentR,parentTransparentG,parentTransparentB)
	EndIF
	
	//position selection box in addtexture selection menu of PARENT
	For i = parentTextureSelection_text1 to ParentTextureSelection_text1 //by using text
		If GetTextHitTest(i,GetRawMouseX(), GetRawMouseY())
			SetSpriteSize(parentTextureSelectionBox_sprite,GetSpriteWidth(parentTextureSelection_gui_sprite), 50)
			SetSpritePosition(parentTextureSelectionBox_sprite,GetSpriteX(parentDiffusePreview_sprite), GetTextY(i))
		EndIF
	Next i
	
	
	For i = parentDiffusePreview_sprite to parentDiffusePreview_sprite //by using preview sprites
		If MouseIsOnSprite(i)
			SetSpriteSize(parentTextureSelectionBox_sprite,GetSpriteWidth(parentTextureSelection_gui_sprite), 50)
			SetSpritePosition(parentTextureSelectionBox_sprite,GetSpriteX(parentDiffusePreview_sprite), GetSpriteY(i))
		EndIF
	Next i
	
	
	//display texture selection menu
	If GetTextHitTest(addtexture_text1,GetRawMouseX(), GetRawMouseY())
		displayParentTextureSelectionMenu()
	EndIF 
	
	//selet texture from menu to load
	If GetRawMouseLeftReleased()
		If GetTextHitTest(parentTextureSelection_text1,GetPointerX(), GetPointerY()) or (MouseIsOnSprite(parentDiffusePreview_sprite)) //diffuse texture
			loadParentDiffuseTexture()
			deleteParentTextureSelectionMenu()
			deleteAddTextureMenu()
		EndIF
		remstart
		If GetTextHitTest(parentTextureSelection_text2,GetPointerX(), GetPointerY()) or (MouseIsOnSprite(parentNormalPreview_sprite)) //normal map texture
			//loadParentNormalMap()
			displayMessage("Normal map does not functioning!")
			deleteParentTextureSelectionMenu()
			deleteAddTextureMenu()
		EndIF
		If GetTextHitTest(ParentTextureSelection_text3,GetPointerX(), GetPointerY()) or (MouseIsOnSprite(parentLightmapPreview_sprite)) //light map texture
			//loadParentLightMap()
			displayMessage("Specular map does not functioning!")
			deleteParentTextureSelectionMenu()
			deleteAddTextureMenu()
		EndIf
		remend
	EndIF
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//load CHILD texture*********************************************
	
	//update child texture transparent color
	If GetEditBoxChanged(childTransparentR_editbox) //RED
		If Val(GetEditBoxText(childTransparentR_editbox)) < 0 or Val(GetEditBoxText(childTransparentR_editbox)) > 255
			childTransparentR = 255
			SetEditBoxText(childTransparentR_editbox,Str(childTransparentR))
			displayMessage("Value range is 0 - 255!")
		EndIf
		childTransparentR = Val(GetEditBoxText(childTransparentR_editbox))
		SetSpriteColor(childTransparentPreview_sprite,childTransparentR,childTransparentG,childtransparentB,childTransparentAlpha)
		SetImageTransparentColor(childDiffuse_texture,childTransparentR,childTransparentG,childTransparentB)
	EndIF
	
	If GetEditBoxChanged(childTransparentG_editbox) //GREEN
		If Val(GetEditBoxText(childTransparentG_editbox)) < 0 or Val(GetEditBoxText(childTransparentG_editbox)) > 255
			childTransparentG = 0
			SetEditBoxText(childTransparentG_editbox,Str(childTransparentG))
			displayMessage("Value range is 0 - 255!")
		EndIf
		childTransparentG = Val(GetEditBoxText(childTransparentG_editbox))
		SetSpriteColor(childTransparentPreview_sprite,childTransparentR,childTransparentG,childTransparentB,childTransparentAlpha)
		SetImageTransparentColor(childDiffuse_texture,childTransparentR,childTransparentG,childTransparentB)
	EndIF
	
	If GetEditBoxChanged(childTransparentB_editbox) //BLUE
		If Val(GetEditBoxText(childTransparentB_editbox)) < 0 or Val(GetEditBoxText(childTransparentB_editbox)) > 255
			childTransparentB = 255
			SetEditBoxText(childTransparentB_editbox,Str(childTransparentB))
			displayMessage("Value range is 0 - 255!")
		EndIf
		childTransparentB = Val(GetEditBoxText(childTransparentB_editbox))
		SetSpriteColor(childTransparentPreview_sprite,childTransparentR,childTransparentG,childTransparentB,childTransparentAlpha)
		SetImageTransparentColor(childDiffuse_texture,childTransparentR,childTransparentG,childTransparentB)
	EndIF
	
	
	//position selection box in addtexture selection menu of PARENT
	For i = childTextureSelection_text1 to childTextureSelection_text1 //by using text
		If GetTextHitTest(i,GetRawMouseX(), GetRawMouseY())
			SetSpriteSize(childTextureSelectionBox_sprite,GetSpriteWidth(childTextureSelection_gui_sprite), 50)
			SetSpritePosition(childTextureSelectionBox_sprite,GetSpriteX(childDiffusePreview_sprite), GetTextY(i))
		EndIF
	Next i
	
	
	For i = childDiffusePreview_sprite to childDiffusePreview_sprite //by using preview sprites
		If MouseIsOnSprite(i)
			SetSpriteSize(childTextureSelectionBox_sprite,GetSpriteWidth(childTextureSelection_gui_sprite), 50)
			SetSpritePosition(childTextureSelectionBox_sprite,GetSpriteX(childDiffusePreview_sprite), GetSpriteY(i))
		EndIF
	Next i
	
	
	//display texture selection menu
	If GetTextHitTest(addtexture_text2,GetRawMouseX(), GetRawMouseY())
		displayChildTextureSelectionMenu()
	EndIF 
	
	//selet texture from menu to load
	If GetRawMouseLeftReleased()
		If GetTextHitTest(childTextureSelection_text1,GetPointerX(), GetPointerY()) or (MouseIsOnSprite(childDiffusePreview_sprite)) //diffuse texture
			loadChildDiffuseTexture()
			deletechildTextureSelectionMenu()
			deleteAddTextureMenu()
		EndIF
		remstart
		If GetTextHitTest(childTextureSelection_text2,GetPointerX(), GetPointerY()) or (MouseIsOnSprite(childNormalPreview_sprite)) //normal map texture
			//loadChildNormalMap()
			displayMessage("Normal map does not functioning!")
			deletechildTextureSelectionMenu()
			deleteAddTextureMenu()
		EndIF
		
		If GetTextHitTest(childTextureSelection_text3,GetPointerX(), GetPointerY()) or (MouseIsOnSprite(childLightmapPreview_sprite)) //light map texture
			//loadChildLightMap()
			displayMessage("Specular map does not functioning!")
			deletechildTextureSelectionMenu()
			deleteAddTextureMenu()
		EndIF
		remend
	EndIF
	
	//delete texture menus if mouse is not on the menu
	If GetRawMouseLeftReleased() and NOT MouseIsOnSprite(addtexture_gui_sprite) and NOT MouseIsOnSprite(parentTextureSelection_gui_sprite) and NOT MouseIsOnSprite(childTextureSelection_gui_sprite)
		deleteChildTextureSelectionMenu()
		deleteParentTextureSelectionMenu()
		deleteAddTextureMenu()
	EndIf
	
	
EndFunction



//******* SETUP WINDOW PROPERTIES *********
Function setupWindow()
	
	windowX = 1124
	windowY = 900
	oldwindowX = windowX
	oldwindowY = windowY
	
	// set window properties
	SetWindowTitle( "3D2Sprite v0.7.6 Alpha" )
	SetWindowSize( windowX, windowY, fullscreen )

	// set display properties
	SetVirtualResolution( windowX, windowY )
	SetOrientationAllowed( 1, 1, 1, 1 )
	SetWindowAllowResize(1)

	//set background color
	SetClearColor(101,120,154)
	ClearScreen()
	
	//set global light color and sun intesnity
	SetAmbientColor(ambientR,ambientG,ambientB)
	SetSunActive(1)
	SetSunColor(sunLight_intensity,sunLight_intensity,sunLight_intensity)

EndFunction



//********* SETUP 3D CAMERA PROPERTIES **************
Function setupCamera()
	
	SetCameraPosition(1,cameraposX,cameraposY, cameraposZ)
	SetCameraLookAt(1,GetObjectX(parentMesh), GetObjectY(parentMesh), GetObjectZ(parentMesh), 0)
	SetCameraRange(1,1,3000)
	
	//create a navigation mesh in position of camera
	CreateObjectBox(nav_mesh,100,100,100)
	SetObjectPosition(nav_mesh,GetCameraX(1),GetCameraY(1),GetCameraZ(1))
	SetObjectVisible(nav_mesh,0)
	
EndFunction



//********* CREATE MAIN GUI ************
Function createGUI()
	SetFolder("/media/UI")
	//right panel
	LoadImage(gui_image,"gui_background.png")
	CreateSprite(gui_sprite1,gui_image)
	SetSpriteScale(gui_sprite1,2,10)
	SetSpritePosition(gui_sprite1,GetDeviceWidth() - GetSpriteWidth(gui_sprite1),0)
	SetSpriteDepth(gui_sprite1,10)
	
	//top panel
	CreateSprite(gui_sprite2,gui_image)
	SetSpriteScale(gui_sprite2,GetDeviceWidth(),0.3)
	SetSpritePosition(gui_sprite2,0,0)
	SetSpriteDepth(gui_sprite2,10)
	
	//add mesh icon
	LoadImage(addmesh_image,"add_mesh.png")
	CreateSprite(addmesh_sprite,addmesh_image)
	SetSpritePosition(addmesh_sprite,5,2)
	SetSpriteScale(addmesh_sprite,0.1,0.1)
	SetSpriteDepth(addmesh_sprite,9)
	
	//add texture icon
	LoadImage(addtexture_image,"add_texture.png")
	CreateSprite(addtexture_sprite,addtexture_image)
	SetSpritePosition(addtexture_sprite,GetSpriteWidth(addmesh_sprite) + 10,2)
	SetSpriteScale(addtexture_sprite,0.1,0.1)
	SetSpriteDepth(addtexture_sprite,9)
	
	//play animation icon
	LoadImage(playAnimation_image,"play_animation.png")
	CreateSprite(playAnimation_sprite,playAnimation_image)
	SetSpritePosition(playAnimation_sprite,(GetSpriteWidth(addtexture_sprite) * 2) + 15,2)
	SetSpriteScale(playAnimation_sprite,0.1,0.1)
	SetSpriteDepth(playAnimation_sprite,9)
	
	//make screenshot icon
	LoadImage(camera_image,"camera.png")
	CreateSprite(camera_sprite,camera_image)
	SetSpritePosition(camera_sprite,(GetSpriteWidth(playAnimation_sprite) * 3) + 20,2)
	SetSpriteScale(camera_sprite,0.1,0.1)
	SetSpriteDepth(camera_sprite,9)
	
	//light button icon
	LoadImage(lightoptions_button_image,"light_button.png")
	CreateSprite(lightoptions_button_sprite,lightoptions_button_image)
	SetSpritePosition(lightoptions_button_sprite,(GetSpriteWidth(playAnimation_sprite) * 4) + 25,2)
	SetSpriteScale(lightoptions_button_sprite,0.1,0.1)
	SetSpriteDepth(lightoptions_button_sprite,9)
	
	//make help icon
	LoadImage(help_image,"help.png")
	CreateSprite(help_sprite,help_image)
	SetSpritePosition(help_sprite,GetDeviceWidth() - 62,2)
	SetSpriteScale(help_sprite,0.1,0.1)
	SetSpriteDepth(help_sprite,9)
	
	//make about icon
	LoadImage(about_image,"about.png")
	CreateSprite(about_sprite,about_image)
	SetSpritePosition(about_sprite,GetDeviceWidth() - 30,2)
	SetSpriteScale(about_sprite,0.1,0.1)
	SetSpriteDepth(about_sprite,9)
	
	
	
	
	//******** CAMERA EDITBOXES and TEXT *********
	
	//Camera header text
	CreateText(camera_header_text,"****** CAMERA *******")
	SetTextSize(camera_header_text,15)
	SetTextPosition(camera_header_text,GetSpriteX(gui_sprite1) + 2,30)
	SetTextDepth(camera_header_text,9)
	SetTextColor(camera_header_text,255,123,0,255)
	
	//camera speed
	CreateText(camspeedText,"Camera Speed")
	SetTextSize(camspeedText,15)
	SetTextPosition(camspeedText,GetSpriteX(gui_sprite1) + 2,GetTextY(camera_header_text) + GetTextTotalHeight(camera_header_text) + 2)
	SetTextDepth(camspeedText,9)
	
	CreateEditbox(camspeedBox)
	SetEditBoxPosition(camspeedBox,GetDeviceWidth() - GetEditBoxWidth(camspeedBox),GetTextY(camspeedText) + GetEditBoxHeight(camspeedBox))
	SetEditBoxDepth(camspeedBox,10)
	SetEditBoxText(camspeedBox,Left(Str(camspeed),3))
	SetEditBoxDepth(camspeedBox,9)
	
	
	//camera position X
	CreateText(camposXText,"Camera X")
	SetTextSize(camposXText,15)
	SetTextPosition(camposXText,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(camspeedBox) + GetEditBoxHeight(camspeedBox) + 2)
	SetTextDepth(camposXText,9)
	
	CreateEditbox(camposXBox)
	SetEditBoxPosition(camposXBox,GetDeviceWidth() - GetEditBoxWidth(camposXBox),GetTextY(camposXText) + GetEditBoxHeight(camposXBox))
	SetEditBoxDepth(camposXBox,10)
	SetEditBoxText(camposXBox,Str(cameraposX))
	SetEditBoxDepth(camposXBox,9)
	
	
	//camera position Y
	CreateText(camposYText,"Camera Y")
	SetTextSize(camposYText,15)
	SetTextPosition(camposYText,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(camposXBox) + GetEditBoxHeight(camposXBox) + 2)
	SetTextDepth(camposYText,9)
	
	CreateEditbox(camposYBox)
	SetEditBoxPosition(camposYBox,GetDeviceWidth() - GetEditBoxWidth(camposYBox),GetTextY(camposYText) + GetEditBoxHeight(camposYBox))
	SetEditBoxDepth(camposYBox,10)
	SetEditBoxText(camposYBox,Str(cameraposY))
	SetEditBoxDepth(camposYBox,9)
	
	
	//camera position Z
	CreateText(camposZText,"Camera Z")
	SetTextSize(camposZText,15)
	SetTextPosition(camposZText,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(camposYBox) + GetEditBoxHeight(camposYBox) + 2)
	SetTextDepth(camposZText,9)
	
	CreateEditbox(camposZBox)
	SetEditBoxPosition(camposZBox,GetDeviceWidth() - GetEditBoxWidth(camposZBox),GetTextY(camposZText) + GetEditBoxHeight(camposZBox))
	SetEditBoxDepth(camposZBox,10)
	SetEditBoxText(camposZBox,Str(cameraposZ))
	SetEditBoxDepth(camposZBox,9)
	
	
	
	
	
	//***************PARENT EDIT BOXES AND TEXTS**************
	
	//Parent header text
	CreateText(parent_header_text,"****** PARENT *******")
	SetTextSize(parent_header_text,15)
	SetTextPosition(parent_header_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(camposZBox) + GetEditBoxHeight(camposZBox) + 10)
	SetTextDepth(parent_header_text,9)
	SetTextColor(parent_header_text,255,123,0,255)
	
	
	//mesh texture transparency
	CreateText(TextureTransparencyText,"Transparency")
	SetTextSize(TextureTransparencyText,15)
	SetTextPosition(TextureTransparencyText,GetSpriteX(gui_sprite1) + 2,GetTextY(parent_header_text) + GetTextTotalHeight(parent_header_text) + 2)
	SetTextDepth(TextureTransparencyText,9)
	
	CreateEditbox(textureTransparencyBox)
	SetEditBoxPosition(textureTransparencyBox,GetDeviceWidth() - GetEditBoxWidth(textureTransparencyBox),GetTextY(TextureTransparencyText) + GetEditBoxHeight(textureTransparencyBox))
	SetEditBoxDepth(textureTransparencyBox,10)
	SetEditBoxText(textureTransparencyBox,Str(object_transperancy))
	SetEditBoxDepth(textureTransparencyBox,9)
	
	
	//object start animation
	CreateText(objectStartFrameText,"Animation Start Frame")
	SetTextSize(objectStartFrameText,15)
	SetTextPosition(objectStartFrameText,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(textureTransparencyBox) + GetEditBoxHeight(textureTransparencyBox) + 2)
	SetTextDepth(objectStartFrameText,9)
	
	CreateEditbox(objectStartFrameBox)
	SetEditBoxPosition(objectStartFrameBox,GetDeviceWidth() - GetEditBoxWidth(objectStartFrameBox),GetTextY(objectStartFrameText) + GetEditBoxHeight(objectStartFrameBox))
	SetEditBoxDepth(objectStartFrameBox,10)
	SetEditBoxText(objectStartFrameBox,Str(objectStartFrame))
	SetEditBoxDepth(objectStartFrameBox,9)
	
	
	//object end animation
	CreateText(objectEndFrameText,"Animation End Frame")
	SetTextSize(objectEndFrameText,15)
	SetTextPosition(objectEndFrameText,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(objectStartFrameBox) + GetEditBoxHeight(objectStartFrameBox) + 2)
	SetTextDepth(objectEndFrameText,9)
	
	CreateEditbox(objectEndFrameBox)
	SetEditBoxPosition(objectEndFrameBox,GetDeviceWidth() - GetEditBoxWidth(objectEndFrameBox),GetTextY(objectEndFrameText) + GetEditBoxHeight(objectEndFrameBox))
	SetEditBoxDepth(objectStartFrameBox,10)
	SetEditBoxText(objectEndFrameBox,Str(objectEndFrame))
	SetEditBoxDepth(objectEndFrameBox,9)
	
	
	//object animation speed
	CreateText(objectAnimSpeedText,"Animation Speed")
	SetTextSize(objectAnimSpeedText,15)
	SetTextPosition(objectAnimSpeedText,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(objectEndFrameBox) + GetEditBoxHeight(objectEndFrameBox) + 2)
	SetTextDepth(objectAnimSpeedText,9)
	
	CreateEditbox(objectAnimSpeedBox)
	SetEditBoxPosition(objectAnimSpeedBox,GetDeviceWidth() - GetEditBoxWidth(objectAnimSpeedBox),GetTextY(objectAnimSpeedText) + GetEditBoxHeight(objectAnimSpeedBox))
	SetEditBoxDepth(objectAnimSpeedBox,10)
	SetEditBoxText(objectAnimSpeedBox,Str(objectAnimSpeed))
	SetEditBoxDepth(objectAnimSpeedBox,9)
	
	
	//object loop animation
	CreateText(objectAnimLoopText,"Animation loop")
	SetTextSize(objectAnimLoopText,15)
	SetTextPosition(objectAnimLoopText,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(objectAnimSpeedBox) + GetEditBoxHeight(objectAnimSpeedBox) + 2)
	SetTextDepth(objectAnimLoopText,9)
	
	CreateEditbox(objectAnimLoopBox)
	SetEditBoxPosition(objectAnimLoopBox,GetDeviceWidth() - GetEditBoxWidth(objectAnimLoopBox),GetTextY(objectAnimLoopText) + GetEditBoxHeight(objectAnimLoopBox))
	SetEditBoxDepth(objectAnimLoopBox,10)
	SetEditBoxText(objectAnimLoopBox,Str(objectAnimLoop))
	SetEditBoxDepth(objectAnimLoopBox,9)
	
	
	remstart
	//object scale
	CreateText(objectScaleText,"Scale")
	SetTextSize(objectScaleText,15)
	SetTextPosition(objectScaleText,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(objectAnimLoopBox) + GetEditBoxHeight(objectAnimLoopBox) + 2)
	SetTextDepth(objectScaleText,9)
	
	CreateEditbox(objectScaleBox)
	SetEditBoxPosition(objectScaleBox,GetDeviceWidth() - GetEditBoxWidth(objectScaleBox),GetTextY(objectScaleText) + GetEditBoxHeight(objectScaleBox))
	SetEditBoxDepth(objectScaleBox,10)
	SetEditBoxText(objectScaleBox,Left(Str(parentScale),3))
	SetEditBoxDepth(objectscaleBox,9)
	remend
	
	
	
	
	//**************CHILD EDIT BOXES AND TEXTS ******************
	
	//Child header text
	CreateText(child_header_text,"****** CHILD ********")
	SetTextSize(child_header_text,15)
	SetTextPosition(child_header_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(objectAnimLoopBox) + GetEditBoxHeight(objectAnimLoopBox) + 10)
	SetTextDepth(child_header_text,9)
	SetTextColor(child_header_text,255,123,0,255)
	
	//Name of bone
	CreateText(child_nameofbone_text,"Name of bone")
	SetTextSize(child_nameofbone_text,15)
	SetTextPosition(child_nameofbone_text,GetSpriteX(gui_sprite1) + 2,GetTextY(child_header_text) + GetTextTotalHeight(child_header_text) + 2)
	SetTextDepth(child_nameofbone_text,9)
	
	CreateEditbox(child_nameofbone_editbox)
	SetEditBoxPosition(child_nameofbone_editbox,GetDeviceWidth() - GetEditBoxWidth(child_nameofbone_editbox),GetTextY(child_nameofbone_text) + GetEditBoxHeight(child_nameofbone_editbox))
	SetEditBoxDepth(child_nameofbone_editbox,10)
	SetEditBoxText(child_nameofbone_editbox,childNameOfBone)
	SetEditBoxDepth(child_nameofbone_editbox,9)
	
	
	
	
	
	//**************** these options are general 3D MESH options from now on and displayed under 3D MESH**********************
	
	//3D MESH header text
	CreateText(mesh_header_text,"****** 3D MESH ********")
	SetTextSize(mesh_header_text,15)
	SetTextPosition(mesh_header_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_nameofbone_editbox) + GetEditBoxHeight(child_nameofbone_editbox) + 10)
	SetTextDepth(mesh_header_text,9)
	SetTextColor(mesh_header_text,255,123,0,255)
	
	//local X position
	CreateText(child_localx_text,"Movement")
	SetTextSize(child_localx_text,15)
	SetTextPosition(child_localx_text,GetSpriteX(gui_sprite1) + 2,GetTextY(mesh_header_text) + GetTextTotalHeight(mesh_header_text) + 2)
	SetTextDepth(child_localx_text,9)
	
	CreateEditbox(child_localx_editbox)
	SetEditBoxPosition(child_localx_editbox,GetDeviceWidth() - GetEditBoxWidth(child_localx_editbox),GetTextY(child_localx_text) + GetEditBoxHeight(child_localx_editbox))
	SetEditBoxDepth(child_localx_editbox,10)
	SetEditBoxText(child_localx_editbox,left(str(childLocalX),3))
	SetEditBoxDepth(child_localx_editbox,9)
	
	remstart
	//local Y position
	CreateText(child_localy_text,"Local Y")
	SetTextSize(child_localy_text,15)
	SetTextPosition(child_localy_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_localx_editbox) + GetEditBoxHeight(child_localx_editbox) + 2)
	SetTextDepth(child_localy_text,9)
	
	CreateEditbox(child_localy_editbox)
	SetEditBoxPosition(child_localy_editbox,GetDeviceWidth() - GetEditBoxWidth(child_localy_editbox),GetTextY(child_localy_text) + GetEditBoxHeight(child_localy_editbox))
	SetEditBoxDepth(child_localy_editbox,10)
	SetEditBoxText(child_localy_editbox,left(str(childLocalY),3))
	SetEditBoxDepth(child_localy_editbox,9)
	
	//local Z position
	CreateText(child_localz_text,"Local Z")
	SetTextSize(child_localz_text,15)
	SetTextPosition(child_localz_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_localy_editbox) + GetEditBoxHeight(child_localy_editbox) + 2)
	SetTextDepth(child_localz_text,9)
	
	CreateEditbox(child_localz_editbox)
	SetEditBoxPosition(child_localz_editbox,GetDeviceWidth() - GetEditBoxWidth(child_localz_editbox),GetTextY(child_localz_text) + GetEditBoxHeight(child_localz_editbox))
	SetEditBoxDepth(child_localz_editbox,10)
	SetEditBoxText(child_localz_editbox,left(str(childLocalZ),3))
	SetEditBoxDepth(child_localz_editbox,9)
	remend
	
	//Rotate on X axes
	CreateText(child_rotatex_text,"Rotation")
	SetTextSize(child_rotatex_text,15)
	SetTextPosition(child_rotatex_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_localx_editbox) + GetEditBoxHeight(child_localx_editbox) + 2)
	SetTextDepth(child_rotatex_text,9)
	
	CreateEditbox(child_rotatex_editbox)
	SetEditBoxPosition(child_rotatex_editbox,GetDeviceWidth() - GetEditBoxWidth(child_rotatex_editbox),GetTextY(child_rotatex_text) + GetEditBoxHeight(child_rotatex_editbox))
	SetEditBoxDepth(child_rotatex_editbox,10)
	SetEditBoxText(child_rotatex_editbox,left(str(childRotateX),3))
	SetEditBoxDepth(child_rotatex_editbox,9)
	
	remstart
	//Roatate on Y axes
	CreateText(child_rotatey_text,"Rotate Y")
	SetTextSize(child_rotatey_text,15)
	SetTextPosition(child_rotatey_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_rotatex_editbox) + GetEditBoxHeight(child_rotatex_editbox) + 2)
	SetTextDepth(child_rotatex_text,9)
	
	CreateEditbox(child_rotatey_editbox)
	SetEditBoxPosition(child_rotatey_editbox,GetDeviceWidth() - GetEditBoxWidth(child_rotatey_editbox),GetTextY(child_rotatey_text) + GetEditBoxHeight(child_rotatey_editbox))
	SetEditBoxDepth(child_rotatey_editbox,10)
	SetEditBoxText(child_rotatey_editbox,left(str(childRotateY),3))
	SetEditBoxDepth(child_rotatey_editbox,9)
	
	
	//Roatate on Z axes
	CreateText(child_rotatez_text,"Rotate Z")
	SetTextSize(child_rotatez_text,15)
	SetTextPosition(child_rotatez_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_rotatey_editbox) + GetEditBoxHeight(child_rotatey_editbox) + 2)
	SetTextDepth(child_rotatez_text,9)
	
	CreateEditbox(child_rotatez_editbox)
	SetEditBoxPosition(child_rotatez_editbox,GetDeviceWidth() - GetEditBoxWidth(child_rotatez_editbox),GetTextY(child_rotatez_text) + GetEditBoxHeight(child_rotatez_editbox))
	SetEditBoxDepth(child_rotatez_editbox,10)
	SetEditBoxText(child_rotatez_editbox,left(str(childRotateZ),3))
	SetEditBoxDepth(child_rotatez_editbox,9)
	remend
	
	//Child scale
	CreateText(child_scale_text,"Scale")
	SetTextSize(child_scale_text,15)
	SetTextPosition(child_scale_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_rotatex_editbox) + GetEditBoxHeight(child_rotatex_editbox) + 2)
	SetTextDepth(child_scale_text,9)
	
	CreateEditbox(child_scale_editbox)
	SetEditBoxPosition(child_scale_editbox,GetDeviceWidth() - GetEditBoxWidth(child_scale_editbox),GetTextY(child_scale_text) + GetEditBoxHeight(child_scale_editbox))
	SetEditBoxDepth(child_scale_editbox,10)
	SetEditBoxText(child_scale_editbox,left(str(childScale),4))
	SetEditBoxDepth(child_scale_editbox,9)
	
	
	
	
	
	
	
	
	
	
	//************************** ROTATION POSITION AND SCALE BUTTONS*********************************
	
	prsButton_size = 40
	
	//position X button
	LoadImage(positionX_button_image,"move_x_button.png")
	CreateSprite(positionX_button_sprite,positionX_button_image)
	SetSpriteSize(positionX_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(positionX_button_sprite, 300, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	//position Y button
	LoadImage(positionY_button_image,"move_y_button.png")
	CreateSprite(positionY_button_sprite,positionY_button_image)
	SetSpriteSize(positionY_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(positionY_button_sprite, GetSpriteX(positionX_button_sprite) + GetSpriteWidth(positionX_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	
	//position Z button
	LoadImage(positionZ_button_image,"move_z_button.png")
	CreateSprite(positionZ_button_sprite,positionZ_button_image)
	SetSpriteSize(positionZ_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(positionZ_button_sprite, GetSpriteX(positionY_button_sprite) + GetSpriteWidth(positionY_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	//rotation X button
	LoadImage(rotationX_button_image,"rotate_x_button.png")
	CreateSprite(rotationX_button_sprite,rotationX_button_image)
	SetSpriteSize(rotationX_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(rotationX_button_sprite, GetSpriteX(positionZ_button_sprite) + GetSpriteWidth(positionZ_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	//rotation Y button
	LoadImage(rotationY_button_image,"rotate_y_button.png")
	CreateSprite(rotationY_button_sprite,rotationY_button_image)
	SetSpriteSize(rotationY_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(rotationY_button_sprite, GetSpriteX(rotationX_button_sprite) + GetSpriteWidth(rotationX_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	//rotation Z button
	LoadImage(rotationZ_button_image,"rotate_z_button.png")
	CreateSprite(rotationZ_button_sprite,rotationZ_button_image)
	SetSpriteSize(rotationZ_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(rotationZ_button_sprite, GetSpriteX(rotationY_button_sprite) + GetSpriteWidth(rotationY_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	//scale X button
	LoadImage(scaleX_button_image,"scale_x_button.png")
	CreateSprite(scaleX_button_sprite,scaleX_button_image)
	SetSpriteSize(scaleX_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(scaleX_button_sprite, GetSpriteX(rotationZ_button_sprite) + GetSpriteWidth(rotationZ_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	//scale Y button
	LoadImage(scaleY_button_image,"scale_y_button.png")
	CreateSprite(scaleY_button_sprite,scaleY_button_image)
	SetSpriteSize(scaley_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(scaleY_button_sprite, GetSpriteX(scaleX_button_sprite) + GetSpriteWidth(scaleX_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	//scale Z button
	LoadImage(scaleZ_button_image,"scale_z_button.png")
	CreateSprite(scaleZ_button_sprite,scaleZ_button_image)
	SetSpriteSize(scaleZ_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(scaleZ_button_sprite, GetSpriteX(scaleY_button_sprite) + GetSpriteWidth(scaleY_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	//scale XYZ button
	LoadImage(scaleXYZ_button_image,"scale_xyz_button.png")
	CreateSprite(scaleXYZ_button_sprite,scaleXYZ_button_image)
	SetSpriteSize(scaleXYZ_button_sprite,prsButton_size,prsButton_size)
	SetSpritePosition(scaleXYZ_button_sprite, GetSpriteX(scaleZ_button_sprite) + GetSpriteWidth(scaleZ_button_sprite) + 10, GetSpriteY(gui_sprite2) + GetSpriteHeight(gui_sprite2) + 5)
	
	
	//hide buttons
	For i = positionX_button_image to scaleXYZ_button_sprite
		SetSpriteVisible(i,0)
	Next i
	
	SetFolder("/media")
	
EndFunction



//********** DISPLAY PARENT TECTURE SELECTION MENU *****************
Function displayParentTextureSelectionMenu()
	
	If childTextureSelectionMenu_displayed = 1 then deleteChildTextureSelectionMenu()
	If colorPicker_displayed = 1 then deleteColorPicker()
	
	If parentTextureSelectionMenu_displayed = 0
		SetFolder("/media/UI")
		
		
		//beckground
		CreateSprite(parentTextureSelection_gui_sprite,gui_image)
		SetSpritePosition(parentTextureSelection_gui_sprite,GetSpriteX(addtexture_gui_sprite) + GetSpriteWidth(addtexture_gui_sprite),GetSpriteHeight(gui_sprite2))
		SetSpriteScale(parentTextureSelection_gui_sprite,2,1.1)
		SetSpriteDepth(parentTextureSelection_gui_sprite,8)
		
		//create selection box
		LoadImage(parentTextureSelectionbox_image,"selectionbox.png")
		CreateSprite(parentTextureSelectionbox_sprite,parentTextureSelectionbox_image)
		SetSpritePosition(parentTextureSelectionbox_sprite,0,0)
		SetSpriteSize(parentTextureSelectionbox_sprite,1,1)
		SetSpriteDepth(parentTextureSelectionbox_sprite,7)
	
		//preview sprites
		CreateSprite(parentDiffusePreview_sprite,parentPreviewD) //diffuse
		SetSpriteSize(parentDiffusePreview_sprite,50,50)
		SetSpritePosition(parentDiffusePreview_sprite,GetSpriteX(parentTextureSelection_gui_sprite) + 2, GetSpriteY(parentTextureSelection_gui_sprite) + 10)
		SetSpriteDepth(parentDiffusePreview_sprite,6)
		remstart
		CreateSprite(parentNormalPreview_sprite,parentPreviewN) //normal
		SetSpriteSize(parentNormalPreview_sprite,50,50)
		SetSpritePosition(parentNormalPreview_sprite,GetSpriteX(parentTextureSelection_gui_sprite) + 2, GetSpriteY(parentTextureSelection_gui_sprite) + (GetSpriteHeight(parentDiffusePreview_sprite) + 20))
		SetSpriteDepth(parentNormalPreview_sprite,6)
	
		CreateSprite(parentLightmapPreview_sprite,parentPreviewL) //light
		SetSpriteSize(parentLightmapPreview_sprite,50,50)
		SetSpritePosition(parentLightmapPreview_sprite,GetSpriteX(parentTextureSelection_gui_sprite) + 2, GetSpriteY(parentTextureSelection_gui_sprite) + (GetSpriteHeight(parentDiffusePreview_sprite) + GetSpriteHeight(parentNormalPreview_sprite) + 30))
		SetSpriteDepth(parentLightmapPreview_sprite,6)
		remend
		//text
		CreateText(parentTextureSelection_text1,"Diffuse Map") // diffuse texture
		SetTextSize(parentTextureSelection_text1,15)
		SetTextPosition(parentTextureSelection_text1,GetSpriteX(parentTextureSelection_gui_sprite) + (GetSpriteWidth(parentDiffusePreview_sprite) + 5),GetSpriteY(parentDiffusePreview_sprite))
		SetTextDepth(parentTextureSelection_text1,6)
		remstart
		CreateText(parentTextureSelection_text2,"Normal Map") // normal map
		SetTextSize(parentTextureSelection_text2,15)
		SetTextPosition(parentTextureSelection_text2,GetSpriteX(parentTextureSelection_gui_sprite) + (GetSpriteWidth(parentNormalPreview_sprite) + 5),GetSpriteY(parentNormalPreview_sprite))
		SetTextDepth(parentTextureSelection_text2,6)
	
		CreateText(parentTextureSelection_text3,"Specular Map") // light map
		SetTextSize(ParentTextureSelection_text3,15)
		SetTextPosition(parentTextureSelection_text3,GetSpriteX(parentTextureSelection_gui_sprite) + (GetSpriteWidth(parentLightmapPreview_sprite) + 5),GetSpriteY(parentLightmapPreview_sprite))
		SetTextDepth(parentTextureSelection_text3,6)
		remend
		//transparent color
		CreateText(parentTransparentColor_text,"Transparent color") //text
		SetTextSize(parentTransparentColor_text,15)
		SetTextPosition(parentTransparentColor_text,GetSpriteX(parentTextureSelection_gui_sprite) + 2, GetSpriteY(parentDiffusePreview_sprite) + GetSpriteHeight(parentDiffusePreview_sprite) + 2)
		SetTextDepth(parentTransparentColor_text,6)
		
		CreateEditbox(parentTransparentR_editbox) //RED color component
		SetEditBoxSize(parentTransparentR_editbox,30,20)
		SetEditBoxPosition(parentTransparentR_editbox,GetSpriteX(parentTextureSelection_gui_sprite) + 2,GetTextY(parentTransparentColor_text) + GetTextTotalHeight(parentTransparentColor_text) + 2)
		SetEditBoxDepth(parentTransparentR_editbox,6)
		SetEditBoxText(parentTransparentR_editbox,str(parentTransparentR))
		
		CreateEditbox(parentTransparentG_editbox) //GREEN color component
		SetEditBoxSize(parentTransparentG_editbox,30,20)
		SetEditBoxPosition(parentTransparentG_editbox,GetEditBoxX(parentTransparentR_editbox) + GetEditBoxWidth(parentTransparentR_editbox) + 5,GetTextY(parentTransparentColor_text) + GetTextTotalHeight(parentTransparentColor_text) + 2)
		SetEditBoxDepth(parentTransparentG_editbox,6)
		SetEditBoxText(parentTransparentG_editbox,str(parentTransparentG))
		
		CreateEditbox(parentTransparentB_editbox) //BLUE color component
		SetEditBoxSize(parentTransparentB_editbox,30,20)
		SetEditBoxPosition(parentTransparentB_editbox,GetEditBoxX(parentTransparentG_editbox) + GetEditBoxWidth(parentTransparentG_editbox) + 5,GetTextY(parentTransparentColor_text) + GetTextTotalHeight(parentTransparentColor_text) + 2)
		SetEditBoxDepth(parentTransparentB_editbox,6)
		SetEditBoxText(parentTransparentB_editbox,str(parentTransparentB))
		
		CreateSprite(parentTransparentPreview_sprite,0) //preview sprite
		SetSpriteSize(parentTransparentPreview_sprite,90,20)
		SetSpriteColor(parentTransparentPreview_sprite,parentTransparentR,parentTransparentG,parentTransparentB,parentTransparentAlpha)
		SetSpriteDepth(parentTransparentPreview_sprite,6)
		SetSpritePosition(parentTransparentPreview_sprite,GetEditboxX(parentTransparentB_editbox) + GetEditBoxWidth(parentTransparentB_editbox) + 5, GetTextY(parentTransparentColor_text) + GetTextTotalHeight(parentTransparentColor_text) + 2)
		
		parentTextureSelectionMenu_displayed = 1
		SetFolder("/media")
	EndIF
Endfunction


//********** DELETE PARENT TEXTURE SELECTION MENU *************
Function deleteParentTextureSelectionMenu()
	If GetSpriteHitTest(colorPicker_gui_sprite, GetRawMouseX(), GetRawMouseY()) = 0
		If parentTextureSelectionMenu_displayed = 1
			DeleteSprite(parentTextureSelection_gui_sprite) //backround
			DeleteText(parentTextureSelection_text1) //diffsue text
			DeleteSprite(parentDiffusePreview_sprite) //diffuse preview sprite
			DeleteImage(parentTextureSelectionbox_image) //selection box image
			DeleteSprite(parentTextureSelectionBox_sprite) //selection box sprite 
			DeleteText(parentTransparentColor_text) //transparent color text
			DeleteEditBox(parentTransparentR_editbox) //transparent color editboxes RGB
			DeleteEditBox(parentTransparentG_editbox)
			DeleteEditBox(parentTransparentB_editbox)
			DeleteSprite(parentTransparentPreview_sprite) //transparent color preview sprite
		
			parentTextureSelectionMenu_displayed = 0
		EndIf
	EndIf
	
	
EndFunction


//**************DISPLAY CHILD TEXTURE SELECTION MENU***************************
Function displayChildTextureSelectionMenu()
	
	If parentTextureSelectionMenu_displayed = 1 then deleteParentTextureSelectionMenu()
	If colorPicker_displayed = 1 then deleteColorPicker()
	
	If childTextureSelectionMenu_displayed = 0
		SetFolder("/media/UI")
		
		//beckground
		CreateSprite(childTextureSelection_gui_sprite,gui_image)
		SetSpritePosition(childTextureSelection_gui_sprite,GetSpriteX(addtexture_gui_sprite) + GetSpriteWidth(addtexture_gui_sprite),GetTextY(addtexture_text2))
		SetSpriteScale(childTextureSelection_gui_sprite,2,1.1)
		SetSpriteDepth(childTextureSelection_gui_sprite,8)
		
		//create selection box
		LoadImage(childTextureSelectionbox_image,"selectionbox.png")
		CreateSprite(childTextureSelectionbox_sprite,childTextureSelectionbox_image)
		SetSpritePosition(childTextureSelectionbox_sprite,0,0)
		SetSpriteSize(childTextureSelectionbox_sprite,1,1)
		SetSpriteDepth(childTextureSelectionbox_sprite,7)
		
		//preview sprites
		CreateSprite(childDiffusePreview_sprite,childPreviewD) //diffuse
		SetSpriteSize(childDiffusePreview_sprite,50,50)
		SetSpritePosition(childDiffusePreview_sprite,GetSpriteX(childTextureSelection_gui_sprite) + 2, GetSpriteY(childTextureSelection_gui_sprite) + 10)
		SetSpriteDepth(childDiffusePreview_sprite,6)
		remstart
		CreateSprite(childNormalPreview_sprite,childPreviewN) //normal
		SetSpriteSize(childNormalPreview_sprite,50,50)
		SetSpritePosition(childNormalPreview_sprite,GetSpriteX(childTextureSelection_gui_sprite) + 2, GetSpriteY(childTextureSelection_gui_sprite) + (GetSpriteHeight(childDiffusePreview_sprite) + 20))
		SetSpriteDepth(childNormalPreview_sprite,6)
		
		CreateSprite(childLightmapPreview_sprite,childPreviewL) //light
		SetSpriteSize(childLightmapPreview_sprite,50,50)
		SetSpritePosition(childLightmapPreview_sprite,GetSpriteX(childTextureSelection_gui_sprite) + 2, GetSpriteY(childTextureSelection_gui_sprite) + (GetSpriteHeight(childDiffusePreview_sprite) + GetSpriteHeight(childNormalPreview_sprite) + 30))
		SetSpriteDepth(childLightmapPreview_sprite,6)
		remend
		//text
		CreateText(childTextureSelection_text1,"Diffuse Map") // diffuse texture
		SetTextSize(childTextureSelection_text1,15)
		SetTextPosition(childTextureSelection_text1,GetSpriteX(childTextureSelection_gui_sprite) + (GetSpriteWidth(childDiffusePreview_sprite) + 5),GetSpriteY(childDiffusePreview_sprite))
		SetTextDepth(childTextureSelection_text1,6)
		remstart
		CreateText(childTextureSelection_text2,"Normal Map") // normal map
		SetTextSize(childTextureSelection_text2,15)
		SetTextPosition(childTextureSelection_text2,GetSpriteX(childTextureSelection_gui_sprite) + (GetSpriteWidth(childNormalPreview_sprite) + 5),GetSpriteY(childNormalPreview_sprite))
		SetTextDepth(childTextureSelection_text2,6)
	
		CreateText(childTextureSelection_text3,"Specular Map") // light map
		SetTextSize(childTextureSelection_text3,15)
		SetTextPosition(childTextureSelection_text3,GetSpriteX(childTextureSelection_gui_sprite) + (GetSpriteWidth(childLightmapPreview_sprite) + 5),GetSpriteY(childLightmapPreview_sprite))
		SetTextDepth(childTextureSelection_text3,6)
		remend
		//transparent color
		CreateText(childTransparentColor_text,"Transparent color") //text
		SetTextSize(childTransparentColor_text,15)
		SetTextPosition(childTransparentColor_text,GetSpriteX(childTextureSelection_gui_sprite) + 2, GetSpriteY(childDiffusePreview_sprite) + GetSpriteHeight(childDiffusePreview_sprite) + 2)
		SetTextDepth(childTransparentColor_text,6)
		
		CreateEditbox(childTransparentR_editbox) //RED color component
		SetEditBoxSize(childTransparentR_editbox,30,20)
		SetEditBoxPosition(childTransparentR_editbox,GetSpriteX(childTextureSelection_gui_sprite) + 2,GetTextY(childTransparentColor_text) + GetTextTotalHeight(childTransparentColor_text) + 2)
		SetEditBoxDepth(childTransparentR_editbox,6)
		SetEditBoxText(childTransparentR_editbox,str(childTransparentR))
		
		CreateEditbox(childTransparentG_editbox) //GREEN color component
		SetEditBoxSize(childTransparentG_editbox,30,20)
		SetEditBoxPosition(childTransparentG_editbox,GetEditBoxX(childTransparentR_editbox) + GetEditBoxWidth(childTransparentR_editbox) + 5,GetTextY(childTransparentColor_text) + GetTextTotalHeight(childTransparentColor_text) + 2)
		SetEditBoxDepth(childTransparentG_editbox,6)
		SetEditBoxText(childTransparentG_editbox,str(childTransparentG))
		
		CreateEditbox(childTransparentB_editbox) //BLUE color component
		SetEditBoxSize(childTransparentB_editbox,30,20)
		SetEditBoxPosition(childTransparentB_editbox,GetEditBoxX(childTransparentG_editbox) + GetEditBoxWidth(childTransparentG_editbox) + 5,GetTextY(childTransparentColor_text) + GetTextTotalHeight(childTransparentColor_text) + 2)
		SetEditBoxDepth(childTransparentB_editbox,6)
		SetEditBoxText(childTransparentB_editbox,str(childTransparentB))
		
		CreateSprite(childTransparentPreview_sprite,0) //preview sprite
		SetSpriteSize(childTransparentPreview_sprite,90,20)
		SetSpriteColor(childTransparentPreview_sprite,childTransparentR,childTransparentG,childTransparentB,childTransparentAlpha)
		SetSpriteDepth(childTransparentPreview_sprite,6)
		SetSpritePosition(childTransparentPreview_sprite,GetEditboxX(childTransparentB_editbox) + GetEditBoxWidth(childTransparentB_editbox) + 5, GetTextY(childTransparentColor_text) + GetTextTotalHeight(childTransparentColor_text) + 2)
		
		
		childTextureSelectionMenu_displayed = 1
		SetFolder("/media")
	EndIf
EndFunction

//*****************DELETE CHILD TEXTURE SELECTION MENU**********************
Function deleteChildTextureSelectionMenu()
	If GetSpriteHitTest(colorPicker_gui_sprite, GetRawMouseX(), GetRawMouseY()) = 0
		If childTextureSelectionMenu_displayed = 1
		
			DeleteSprite(childTextureSelection_gui_sprite) //backround
			DeleteText(childTextureSelection_text1) //Diffuse text
			DeleteSprite(childDiffusePreview_sprite) //diffuse preview
			DeleteImage(childTextureSelectionbox_image) //selection box image
			DeleteSprite(childTextureSelectionBox_sprite) //selection box sprite
			DeleteText(childTransparentColor_text) //transparent color text
			DeleteEditBox(childTransparentR_editbox) //transparent color editbpxes RGB
			DeleteEditBox(childTransparentG_editbox)
			DeleteEditBox(childTransparentB_editbox)
			DeleteSprite(childTransparentPreview_sprite) //transparent color preview sprite
		
			childTextureSelectionMenu_displayed = 0
		
		EndIf
	EndIf
EndFunction

//*******DISPLAY ADD TEXTURE MENU*****************
Function displayAddTextureMenu()
	
	If textureMenuDisplayed = 0
		SetFolder("/media/UI")
		
		//background
		CreateSprite(addtexture_gui_sprite,gui_image)
		SetSpritePosition(addtexture_gui_sprite,GetSpriteX(addtexture_sprite),GetSpriteHeight(gui_sprite2))
		SetSpriteScale(addtexture_gui_sprite,2,0.5)
		SetSpriteDepth(addtexture_gui_sprite,8)
		
		//create selection box
		LoadImage(addtexture_selectionbox_image,"selectionbox.png")
		CreateSprite(addtexture_selectionbox_sprite,addtexture_selectionbox_image)
		SetSpritePosition(addtexture_selectionbox_sprite,0,0)
		SetSpriteSize(addtexture_selectionbox_sprite,1,1)
		SetSpriteDepth(addtexture_selectionbox_sprite,7)
		
		//text 1 to load parent obkect
		CreateText(addtexture_text1,"Load Parent Texture") // diffuse texture
		SetTextSize(addtexture_text1,15)
		SetTextPosition(addtexture_text1,GetSpriteX(addtexture_gui_sprite) + 5,GetSpriteY(addtexture_gui_sprite) + 10)
		SetTextDepth(addtexture_text1,6)
		
		//text 2 to load child object
		CreateText(addtexture_text2,"Load Child Texture") // diffuse texture
		SetTextSize(addtexture_text2,15)
		SetTextPosition(addtexture_text2,GetSpriteX(addtexture_gui_sprite) + 5,GetTextY(addtexture_text1) + GetTextTotalHeight(addtexture_text1) + 5)		
		SetTextDepth(addtexture_text2,6)
		
		textureMenuDisplayed = 1
		SetFolder("/media")
	EndIf
	
EndFunction

//**********DELETE ADD TEXTURE MENU****************
Function deleteAddTextureMenu()
	If GetSpriteHitTest(colorPicker_gui_sprite, GetRawMouseX(), GetRawMouseY()) = 0
		DeleteSprite(addtexture_gui_sprite)
		DeleteImage(addtexture_selectionbox_image)
		DeleteSprite(addtexture_selectionbox_sprite)
		DeleteText(addtexture_text1)
		DeleteText(addtexture_text2)
	EndIf	
EndFunction



//*************DISPLAY ADD MESH MENU*********************
Function displayAddMeshMenu()
	
	If meshMenuDisplayed = 0
		SetFolder("/media/UI")
		
		//background
		CreateSprite(addmesh_gui_sprite,gui_image)
		SetSpritePosition(addmesh_gui_sprite,GetSpriteX(addmesh_sprite),GetSpriteHeight(gui_sprite2))
		SetSpriteScale(addmesh_gui_sprite,2,1.1)
		SetSpriteDepth(addmesh_gui_sprite,8)
		
		//create selection box
		LoadImage(addmesh_selectionbox_image,"selectionbox.png")
		CreateSprite(addmesh_selectionbox_sprite,addmesh_selectionbox_image)
		SetSpritePosition(addmesh_selectionbox_sprite,0,0)
		SetSpriteSize(addmesh_selectionbox_sprite,1,1)
		SetSpriteDepth(addmesh_selectionbox_sprite,7)
		
		//text 1 to load parent obkect
		CreateText(addmesh_text1,"Load Parent Mesh")
		SetTextSize(addmesh_text1,15)
		SetTextPosition(addmesh_text1,GetSpriteX(addmesh_gui_sprite) + 5,GetSpriteY(addmesh_gui_sprite) + 10)
		SetTextDepth(addmesh_text1,6)
		
		//text 2 to load child object
		CreateText(addmesh_text2,"Load Child Mesh")
		SetTextSize(addmesh_text2,15)
		SetTextPosition(addmesh_text2,GetSpriteX(addmesh_gui_sprite) + 5,GetTextY(addmesh_text1) + GetTextTotalHeight(addmesh_text1) + 5)		
		SetTextDepth(addmesh_text2,6)
		
		//load FPSC Map text
		CreateText(fpscmap_loadmesh_text,"Load FPSC Level")
		SetTextSize(fpscmap_loadmesh_text,15)
		SetTextPosition(fpscmap_loadmesh_text,GetSpriteX(addmesh_gui_sprite) + 5,GetTextY(addmesh_text2) + GetTextTotalHeight(addmesh_text2) + 5)		
		SetTextDepth(fpscmap_loadmesh_text,6)
		
		//text 3 remove child object
		CreateText(addmesh_text3,"Remove Child Mesh")
		SetTextColor(addmesh_text3,255,62,62,255)
		SetTextSize(addmesh_text3,15)
		SetTextPosition(addmesh_text3,GetSpriteX(addmesh_gui_sprite) + 5,GetTextY(fpscmap_loadmesh_text) + GetTextTotalHeight(fpscmap_loadmesh_text) + 5)		
		SetTextDepth(addmesh_text3,6)
		
		//add point light
		CreateText(add_pointlight_text,"Add point light")
		SetTextSize(add_pointlight_text,15)
		SetTextPosition(add_pointlight_text,GetSpriteX(addmesh_gui_sprite) + 5,GetTextY(addmesh_text3) + GetTextTotalHeight(addmesh_text3) + 5)		
		SetTextDepth(add_pointlight_text,6)
		
		meshMenuDisplayed = 1
		SetFolder("/media")
	EndIf
	
EndFunction


//**********DELETE ADD MESH MENU************
Function deleteAddMeshMenu()
	DeleteSprite(addmesh_gui_sprite)
	DeleteText(addmesh_text1)
	DeleteText(addmesh_text2)
	DeleteText(addmesh_text3)
	DeleteImage(addmesh_selectionbox_image)
	DeleteSprite(addmesh_selectionbox_sprite)
	DeleteText(fpscmap_loadmesh_text)
	DeleteText(add_pointlight_text)
EndFunction


//******** UPDATE GUI ***********
Function updateGUI()
	//this is used mainly to update positon of gui objects sucha s sprites, texts and editboxes
	
	//get position of camera
	cameraposX = GetCameraX(1)
	cameraposY = GetCameraY(1)
	cameraposZ = GetCameraZ(1)
	
	//update camera editboxes
	if GetRawKeyState(KEY_A) = 1 or GetRawKeyState(KEY_D) = 1 or GetrAWkEYsTATE(key_Q) = 1 or GetRawKeyState(KEY_E) or GetRawKeyState(KEY_W) = 1 or GetRawKeyState(KEY_S)
		SetEditBoxText(camposXBox,Str(cameraposX)) //camera position X
		SetEditBoxText(camposYBox,Str(cameraposY)) //camera position Y
		SetEditBoxText(camposZBox,Str(cameraposZ)) //camera position Z
	endif
	
	//get current window size
	windowX = GetDeviceWidth()
	windowY = GetDeviceHeight()
	
	//if the window size is different (resized) adjust gui and resolution
	If gui_updated = 0 and (windowX > oldwindowX or windowX < oldwindowX or windowY > oldwindowY or windowY < oldwindowY)

		SetVirtualResolution( GetDeviceWidth(), GetDeviceHeight() ) // change resolution
		SetSpritePosition(gui_sprite1,GetDeviceWidth() - GetSpriteWidth(gui_sprite1),0) // change position of gui sprite
		
		//Parent and Camera GUI 
		for editbox = camspeedBox to objectAnimLoopBox //change position of edit boxes
			SetEditBoxPosition(editbox,GetDeviceWidth() - GetEditBoxWidth(editbox),GetEditBoxY(editbox))
		next editbox
		
		for text = camspeedText to objectAnimLoopText //change position of texts
			SetTextPosition(text,GetDeviceWidth() - (GetTextTotalWidth(text) + (GetSpriteWidth(gui_sprite1) - GetTextTotalWidth(text) - 2) ),GetTextY(text))
		next text
		
		SetTextPosition(camera_header_text,GetSpriteX(gui_sprite1) + 2,30) // these texts added later, so don't fit in to for loop
		SetTextPosition(parent_header_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(camposZBox) + GetEditBoxHeight(camposZBox) + 10)
		SetSpritePosition(help_sprite,GetDeviceWidth() - 62,2)
		
		
		
		
		//Child texts and editboxes
		//SetTextPosition(child_header_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(objectScaleBox) + GetEditBoxHeight(objectScaleBox) + 10)
		//SetTextPosition(child_nameofbone_text,GetSpriteX(gui_sprite1) + 2,GetTextY(child_header_text) + GetTextTotalHeight(child_header_text) + 2)
		//SetEditBoxPosition(child_nameofbone_editbox,GetDeviceWidth() - GetEditBoxWidth(child_nameofbone_editbox),GetTextY(child_nameofbone_text) + GetEditBoxHeight(child_nameofbone_editbox))
		//SetTextPosition(child_localx_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_nameofbone_editbox) + GetEditBoxHeight(child_nameofbone_editbox) + 2)
		SetEditBoxPosition(child_localx_editbox,GetDeviceWidth() - GetEditBoxWidth(child_localx_editbox),GetTextY(child_localx_text) + GetEditBoxHeight(child_localx_editbox))
		//SetTextPosition(child_localy_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_localx_editbox) + GetEditBoxHeight(child_localx_editbox) + 2)
		//SetEditBoxPosition(child_localy_editbox,GetDeviceWidth() - GetEditBoxWidth(child_localy_editbox),GetTextY(child_localy_text) + GetEditBoxHeight(child_localy_editbox))
		//SetTextPosition(child_localz_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_localy_editbox) + GetEditBoxHeight(child_localy_editbox) + 2)
		//SetEditBoxPosition(child_localz_editbox,GetDeviceWidth() - GetEditBoxWidth(child_localz_editbox),GetTextY(child_localz_text) + GetEditBoxHeight(child_localz_editbox))
		//SetTextPosition(child_rotatex_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_localz_editbox) + GetEditBoxHeight(child_localz_editbox) + 2)
		//SetEditBoxPosition(child_rotatex_editbox,GetDeviceWidth() - GetEditBoxWidth(child_rotatex_editbox),GetTextY(child_rotatex_text) + GetEditBoxHeight(child_rotatex_editbox))
		//SetTextPosition(child_rotatey_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_rotatex_editbox) + GetEditBoxHeight(child_rotatex_editbox) + 2)
		//SetEditBoxPosition(child_rotatey_editbox,GetDeviceWidth() - GetEditBoxWidth(child_rotatey_editbox),GetTextY(child_rotatey_text) + GetEditBoxHeight(child_rotatey_editbox))
		//SetTextPosition(child_rotatez_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_rotatey_editbox) + GetEditBoxHeight(child_rotatey_editbox) + 2)
		//SetEditBoxPosition(child_rotatez_editbox,GetDeviceWidth() - GetEditBoxWidth(child_rotatez_editbox),GetTextY(child_rotatez_text) + GetEditBoxHeight(child_rotatez_editbox))
		//SetTextPosition(child_scale_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_rotatez_editbox) + GetEditBoxHeight(child_rotatez_editbox) + 2)
		//SetEditBoxPosition(child_scale_editbox,GetDeviceWidth() - GetEditBoxWidth(child_scale_editbox),GetTextY(child_scale_text) + GetEditBoxHeight(child_scale_editbox))

		SetTextPosition(child_header_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(objectAnimLoopBox) + GetEditBoxHeight(objectAnimLoopBox) + 10)
		SetTextPosition(child_nameofbone_text,GetSpriteX(gui_sprite1) + 2,GetTextY(child_header_text) + GetTextTotalHeight(child_header_text) + 2)
		SetEditBoxPosition(child_nameofbone_editbox,GetDeviceWidth() - GetEditBoxWidth(child_nameofbone_editbox),GetTextY(child_nameofbone_text) + GetEditBoxHeight(child_nameofbone_editbox))
		SetTextPosition(child_rotatex_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_localx_editbox) + GetEditBoxHeight(child_localx_editbox) + 2)
		SetEditBoxPosition(child_rotatex_editbox,GetDeviceWidth() - GetEditBoxWidth(child_rotatex_editbox),GetTextY(child_rotatex_text) + GetEditBoxHeight(child_rotatex_editbox))
		SetTextPosition(child_scale_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_rotatex_editbox) + GetEditBoxHeight(child_rotatex_editbox) + 2)
		SetEditBoxPosition(child_scale_editbox,GetDeviceWidth() - GetEditBoxWidth(child_scale_editbox),GetTextY(child_scale_text) + GetEditBoxHeight(child_scale_editbox))
		SetTextPosition(child_localx_text,GetSpriteX(gui_sprite1) + 2,GetTextY(mesh_header_text) + GetTextTotalHeight(mesh_header_text) + 2)



		//MESH HEADER TEXT
		SetTextPosition(mesh_header_text,GetSpriteX(gui_sprite1) + 2,GetEditBoxY(child_nameofbone_editbox) + GetEditBoxHeight(child_nameofbone_editbox) + 10)



		
		//messages
		SetSpriteSize(message_background_sprite,GetDeviceWidth(), GetDeviceHeight()) //background
		
		//about gui
		SetSpritePosition(about_sprite,GetDeviceWidth() - 30,2) //button
		SetSpritePositionByOffset(about_gui_sprite,GetDeviceWidth()/2, GetDeviceHeight()/2) //background
		SetSpritePosition(about_logo_sprite,GetSpriteX(about_gui_sprite) + GetSpriteWidth(about_logo_sprite), GetSpriteY(about_gui_sprite) + 5) //logo
		SetTextPosition(about_text1,GetSpriteX(about_gui_sprite) + GetTextTotalWidth(about_text1)/2, GetSpriteY(about_logo_sprite) + GetSpriteHeight(about_logo_sprite)+2) //text1
		SetTextPosition(about_text6,GetSpriteX(about_gui_sprite) + 70, GetTextY(about_text1) + GetTextTotalHeight(about_text1)+2)
		SetTextPosition(about_text2,GetSpriteX(about_gui_sprite) + 100, GetTextY(about_text6) + GetTextTotalHeight(about_text6) + 2) //text2
		SetTextPosition(about_text3,GetSpriteX(about_gui_sprite) + 50, GetTextY(about_text2) + GetTextTotalHeight(about_text2) + 2) //text3
		SetTextPosition(about_text4,GetSpriteX(about_gui_sprite) + 100, GetTextY(about_text3) + GetTextTotalHeight(about_text3) + 2) //text4
		SetSpritePosition(about_license_sprite,GetSpriteX(about_gui_sprite),GetTextY(about_text4) + GetTextTotalHeight(about_text4) + 15) //license logo
		SetTextPosition(about_text5,GetSpriteX(about_gui_sprite) + 70, GetSpriteY(about_license_sprite) + GetSpriteHeight(about_license_sprite) + 2)


		
		//enter image name and size gui
		SetSpritePosition(bluredBackground_sprite,0,0)
		SetSpriteSize(bluredBackground_sprite,GetDeviceWidth(), GetDeviceHeight())
		SetSpritePositionByOffset(gui_sprite4,GetDeviceWidth()/2, GetDeviceHeight()/2)
		SetTextPosition(enterFileName_text,GetSpriteX(gui_sprite4) + 5, GetSpriteY(gui_sprite4) + 5)
		SetEditBoxPosition(imageNameBox,GetTextX(enterFileName_text), GetTextY(enterFileName_text) + GetTextTotalHeight(enterFileName_text))
		SetSpritePosition(enterImageNameButton_sprite,GetEditBoxX(imageNameBox), GetEditBoxY(imageNameBox) + GetEditBoxHeight(imageNameBox) +  5)
		
		SetTextPosition(enterImageSize_text,GetSpriteX(gui_sprite4) + 5, GetSpriteY(gui_sprite4) + 5)
		SetEditBoxPosition(enterImageWidthBox,GetTextX(enterImageSize_text), GetTextY(enterImageSize_text) + GetTextTotalHeight(enterImageSize_text))
		SetTextPosition(Xsign_text,GetEditBoxX(enterImageWidthBox) + GetEditBoxWidth(enterImageWidthBox), GetEditBoxY(enterImageWidthBox))
		SetEditBoxPosition(enterImageHeightBox,GetTextX(Xsign_text) + GetTextTotalWidth(Xsign_text), GetEditBoxY(enterImageWidthBox))
		SetSpritePosition(enterImageSizeButton_sprite,GetEditBoxX(enterImageWidthBox), GetEditBoxy(enterImageWidthBox) + GetEditBoxHeight(enterImageWidthBox) + 10)
		
		//message box button and text (backround is the same as enter image name and size) 
		SetSpritePosition(okMessageButton_sprite,GetSpriteX(gui_message_sprite) + (GetSpriteWidth(gui_message_sprite) / 2 - GetSpriteWidth(okMessageButton_sprite)/2), GetSpriteY(gui_message_sprite) + (GetSpriteHeight(gui_message_sprite) - GetSpriteHeight(okMessageButton_sprite)))
		SetTextPosition(message_text,GetSpriteX(gui_message_sprite) + (GetSpriteWidth(gui_message_sprite)/2 - GetTextTotalWidth(message_text)/2) , GetSpriteY(gui_message_sprite) + 10)
		SetSpritePositionByOffset(gui_message_sprite,GetDeviceWidth()/2, GetDeviceHeight()/2)
		SetSpritePosition(okMessageButton_sprite,GetSpriteX(gui_message_sprite) + (GetSpriteWidth(gui_message_sprite) / 2 - GetSpriteWidth(okMessageButton_sprite)/2), GetSpriteY(gui_message_sprite) + (GetSpriteHeight(gui_message_sprite) - GetSpriteHeight(okMessageButton_sprite)))
		SetTextPosition(message_text,GetSpriteX(gui_message_sprite) + (GetSpriteWidth(gui_message_sprite)/2 - GetTextTotalWidth(message_text)/2) , GetSpriteY(gui_message_sprite) + 10)
	
		
		
		//store new window size
		oldWindowX = windowX
		oldwindowY = windowY
		
		gui_updated = 1
	EndIF
	
EndFunction



//*************** CAMERA CONTROL **************
Function moveCamera()

	//rotate camera angle
	if ( GetRawMouseRightPressed() )
        rmb_startX = GetPointerX()
        rmb_startY = GetPointerY()
        cam_angX = GetCameraAngleX(1)
        cam_angY = GetCameraAngleY(1)
    endif

    if ( GetRawMouseRightState() = 1 )
        fDiffX# = (GetPointerX() - rmb_startX)/4.0
        fDiffY# = (GetPointerY() - rmb_startY)/4.0

        newX# = cam_angX + fDiffY#
        if ( newX# > 89 ) then newX# = 89
        if ( newX# < -89 ) then newX# = -89
        SetCameraRotation( 1, newX#, cam_angY + fDiffX#, 0 )
        SetObjectRotation( nav_mesh, 0, cam_angY + fDiffX#, 0 )
    endif
    
    
    //move camera
    If GetEditBoxActive(imageNameBox) = 0 //only if edit box is not active
		if ( GetRawKeyState( KEY_W ) ) then MoveCameraLocalZ( 1, camspeed ) : SetObjectPosition(nav_mesh,GetCameraX(1),GetCameraY(1),GetCameraZ(1))
		if ( GetRawKeyState( KEY_S ) ) then MoveCameraLocalZ( 1, -camspeed ) : SetObjectPosition(nav_mesh,GetCameraX(1),GetCameraY(1),GetCameraZ(1))
		if ( GetRawKeyState( KEY_A ) ) then MoveCameraLocalX( 1, -camspeed ) : SetObjectPosition(nav_mesh,GetCameraX(1),GetCameraY(1),GetCameraZ(1))
		if ( GetRawKeyState( KEY_D ) ) then MoveCameraLocalX( 1, camspeed ) : SetObjectPosition(nav_mesh,GetCameraX(1),GetCameraY(1),GetCameraZ(1))
		if ( GetRawKeyState( KEY_Q ) ) then MoveCameraLocalY( 1, -camspeed ) : SetObjectPosition(nav_mesh,GetCameraX(1),GetCameraY(1),GetCameraZ(1))
		if ( GetRawKeyState( KEY_E ) ) then MoveCameraLocalY( 1, camspeed ) : SetObjectPosition(nav_mesh,GetCameraX(1),GetCameraY(1),GetCameraZ(1))
		
		//use the arrow keys to move the navigation mesh on local X and Z axis and make the camera follow it movement 
		if GetRawKeyState( KEY_LEFT ) then MoveObjectLocalX( nav_mesh, -camspeed) : SetCameraPosition(1, GetObjectX(nav_mesh), GetObjectY(nav_mesh), GetObjectZ(nav_mesh))
		if GetRawKeyState( KEY_RIGHT ) then MoveObjectLocalX( nav_mesh, camspeed) : SetCameraPosition(1, GetObjectX(nav_mesh), GetObjectY(nav_mesh), GetObjectZ(nav_mesh))
		if GetRawKeyState( KEY_UP ) then MoveObjectLocalZ( nav_mesh, camspeed) : SetCameraPosition(1, GetObjectX(nav_mesh), GetObjectY(nav_mesh), GetObjectZ(nav_mesh))
		if GetRawKeyState( KEY_DOWN ) then MoveObjectLocalZ( nav_mesh, -camspeed) : SetCameraPosition(1, GetObjectX(nav_mesh), GetObjectY(nav_mesh), GetObjectZ(nav_mesh))
		
		//reset camera angle using the navigation mesh
		if GetRawKeyPressed( KEY_R ) and GetEditBoxHasFocus( child_nameofbone_editbox) = 0 then SetCameraRotation(1, GetObjectAngleX(nav_mesh), GetObjectAngleY(nav_mesh), GetObjectAngleZ(nav_mesh))
	EndIF
	
	//update camera position and speed using the value of the editboxes
	If GetEditBoxChanged(camposXBox) or GetEditBoxChanged(camposYBox) or GetEditBoxChanged(camposZBox) or GetEditBoxChanged(camspeedBox)
		If ValFloat(GetEditBoxText(camspeedBox)) < 0 //make sure the camera speed is a psitive value
			camspeed = 0.5
			SetEditBoxText(camspeedBox,Left(Str(camspeed),3))
			displayMessage("Camera speed must be greater then 0!")
		EndIf
		cameraposX = ValFloat(GetEditBoxText(camposXBox))
		cameraposY = ValFloat(GetEditBoxText(camposYBox))
		cameraposZ = ValFloat(GetEditBoxText(camposZBox))
		camspeed = ValFloat(GetEditBoxText(camspeedBox))
		SetCameraPosition(1,cameraposX,cameraposY, cameraposZ)
	EndIf
EndFunction




//************ CAPTURE SCREEN AND SAVE THE IMAGE *************
Function makeScreenShot()
	
	If SpritePressed(camera_sprite,0) //display enter image name menu
		If NOT drawBoxStartX = drawBoxEndX and NOT drawBoxStartY = drawBoxEndY //get size of selected area if something is selected
			saveImgWidth = Abs(drawBoxEndX - drawBoxstartX) 
			saveImgHeight = Abs(drawBoxEndY - drawBoxStartY)
		Else                                                                    //otherwise, get the size of the 3D window
			saveImgWidth = GetDeviceWidth() - GetSpriteWidth(gui_sprite1)
			saveImgHeight = GetDeviceHeight() - GetSpriteHeight(gui_sprite2)
		EndIf
		
		displayEnterImageNameMenu() //display enter image name menu
		ResetObjectAnimation(parentMesh) //stop animation otherwise it causing problems when capturing the animations
		animationPaused = 1
	EndIf
	
	//stop capturing the screen and delete enter image name menu and enter image size menu if user click outside the menu or press ESCAPE
	If messageDisplayed = 1 or GetRawKeyPressed(KEY_ESCAPE) or ( NOT  MouseIsOnSprite(enterImageNameButton_sprite) and NOT MouseIsOnSprite(enterImageSizeButton_sprite) and NOT MouseIsOnSprite(gui_sprite4) and NOT MouseIsOnSprite(camera_sprite) and GetRawMouseLeftReleased())
		SetFolder("/media")
		deleteEnterImageNameMenu()
		deleteEnterImageSizeMenu()
		If GetObjectAnimationTime(parentMesh) = 0 and objectStartFrame < objectEndframe //make sure animation is continue
			PlayObjectAnimation(parentMesh,"",objectStartFrame,objectEndFrame,1,0)
		EndIF
	EndIF
		
		//capture the screen
		If MouseIsOnSprite(enterImageNameButton_sprite) and GetRawMouseLeftReleased()
			
			//hide lights if it visible
			For p = 1 to maxPointLight
				If GetObjectExists(pointLight[p,0]) then SetObjectVisible(pointLight[p,0],0)
			Next p

			captureImageName = GetEditBoxText(imageNameBox) //get file name entered by user
			deleteEnterImageNameMenu() 
			imgnum = 0
			SetFolder("/") //if export folder doesn't exists, create folder
			If GetDeviceType() = "" and GetFileExists("/export/") = 0 
				MakeFolder("export")
			EndIf 
			
			SetFolder("/export")
			
			//capture animation (also works if no animation is loaded)
			For i = objectStartFrame to objectEndFrame step 1 // capture each animation 1 by 1
				imgnum = imgnum + 1
				SetObjectAnimationFrame(parentMesh,"",i,0)
				Render3D()
				If drawBoxStartX = drawBoxEndX //if area is not selected capture the whole window without GUI
					GetImage(imgnum,0,GetSpriteHeight(gui_sprite2),windowX - GetSpriteWidth(gui_sprite1),windowY - GetSpriteHeight(gui_sprite2) )
				Else //if area is selected capture only the selected area
					GetImage(imgnum,drawBoxStartX,drawBoxStartY,drawBoxEndX - drawBoxStartX,drawBoxEndY - drawBoxStartY)
				EndIF
				SaveImage(imgnum,captureImageName + Str(imgnum) + ".png" ) //save captured image
				DeleteImage(imgnum)
				Sync()
			Next i
			
			displayEnterImageSizeMenu()
		EndIF
			
			//update preview image in EnterImageSizeMenu
			If GetEditBoxChanged(enterImageWidthBox) or GetEditBoxChanged(enterImageHeightBox)
				saveImgWidth = Val(GetEditBoxText(enterImageWidthBox))
				saveImgHeight = Val(GetEditBoxText(enterImageHeightBox))
		
				SetSpriteSize(resizePreview_Sprite,saveImgWidth,saveImgHeight) //resize it
			EndIF
				
				
				//resize all images and save
				If MouseIsOnSprite(enterImageSizeButton_sprite) and GetRawMouseLeftReleased()
				
					saveImgWidth = Val(GetEditBoxText(enterImageWidthBox))
					saveImgHeight = Val(GetEditBoxText(enterImageHeightBox))
				
					deleteEnterImageSizeMenu()
					resizeScreenshot()
					SetFolder("/media")
					PlayObjectAnimation(parentMesh,"",objectStartFrame,objectEndFrame,1,0) //make sure animation is continue after screen is captured
				EndIF
			
		//show point lights
			For p = 1 to maxPointLight
				If GetObjectExists(pointLight[p,0]) then SetObjectVisible(pointLight[p,0],1)
			Next p
		
		remstart******************
		//temporary to capture rotation
		If GetRawKeyPressed(KEY_P)
			imgnum = imgnum + 1 //count number of images
			CreateRenderImage(imgnum,640,480,0) //create a render image
			Render3D() //render only 3D objects on to render image
			If drawBoxStartX = drawBoxEndX //if are is not selected 
					GetImage(imgnum,0,GetSpriteHeight(gui_sprite2),windowX - GetSpriteWidth(gui_sprite1),windowY - GetSpriteHeight(gui_sprite2) )
					Else //if are is selected
						GetImage(imgnum,drawBoxStartX,drawBoxStartY,drawBoxEndX - drawBoxStartX,drawBoxEndY - drawBoxStartY)
				EndIF
			SetRawWritePath("export")
			SaveImage(imgnum,filename + Str(imgnum) + ".png" ) //save image
			DeleteImage(imgnum)
			
			Sync()			
		EndIF
		********************************remend
	
EndFunction


//********* DRAW SELECTION BOX *********
Function drawSelectionBox()
	If overlayScreenActive = 0 and NOT MouseIsOnSprite(gui_sprite1) and NOT MouseIsOnSprite(gui_sprite2) and NOT MouseIsOnSprite(gui_sprite3) and NOT MouseIsOnSprite(gui_sprite4) and NOT MouseIsOnSprite(addmesh_gui_sprite) and NOT MouseIsOnSprite(addtexture_gui_sprite) and NOT MouseIsOnSprite(parentTextureSelection_gui_sprite) and NOT MouseIsOnSprite(childTextureSelection_gui_sprite) and light_options_displayed = 0 and GetPRSButtonActive()
		If GetRawKeyPressed(KEY_SPACE) 
			If GetRawMouseLeftState() = 0
				drawBoxStartX = 0
				drawBoxStartY = 0
				drawBoxEndX = 0
				drawBoxEndY = 0
			Else
				drawBoxStartX = GetRawMouseX()
				drawBoxStartY = GetRawMouseY()
			EndIf
		EndIf
			
		If GetRawMouseLeftPressed() and GetRawKeyState(KEY_SPACE) = 1
			drawBoxStartX = GetRawMouseX()
			drawBoxStartY = GetRawMouseY()
		EndIF
	
		If GetRawMouseLeftState() = 1 and GetRawKeyState(KEY_SPACE) = 1
			boxdraw = 0
			drawBoxEndX = GetRawMouseX()
			drawBoxEndY = GetRawMouseY()
				
			saveImgWidth = Abs(drawBoxEndX - drawBoxstartX)
			saveImgHeight = Abs(drawBoxEndY - drawBoxStartY)
		EndIF
	EndIF
	
	If boxdraw = 0 and overlayScreenActive = 0
		DrawBox(drawBoxStartX,drawBoxStartY,drawBoxEndX,drawBoxEndY,255,255,255,255,0)
		boxdraw = 1
	EndIF


EndFunction


//****** DISPLAY SCREENSHOT MENU***********************
Function displayEnterImageNameMenu()
	SetFolder("/media/UI")
	
	If displayed = 0
		LoadImage(bluredBackground_image,"blured.png") //load background image
		CreateSprite(bluredBackground_sprite,bluredBackground_image)
		SetSpritePosition(bluredBackground_sprite,0,0)
		SetSpriteSize(bluredBackground_sprite,GetDeviceWidth(), GetDeviceHeight())
		SetSpriteDepth(bluredBackground_sprite,8)
		
		CreateSprite(gui_sprite4,gui_image) //display background image
		SetSpritePositionByOffset(gui_sprite4,GetDeviceWidth()/2, GetDeviceHeight()/2)
		SetSpriteSize(gui_sprite4,400,80)
		SetSpriteDepth(gui_sprite4,7)
		
		CreateText(enterFileName_text,"Enter image name you would like to use:") // create enter file name text
		SetTextSize(enterFileName_text,15)
		SetTextPosition(enterFileName_text,GetSpriteX(gui_sprite4) + 5, GetSpriteY(gui_sprite4) + 5)
		SetTextDepth(enterFileName_text,6)
		
		CreateEditBox(imageNameBox) //create enter file name edit box
		SetEditBoxPosition(imageNameBox,GetTextX(enterFileName_text), GetTextY(enterFileName_text) + GetTextTotalHeight(enterFileName_text) + 5)
		SetEditBoxDepth(imageNameBox,6)
		SetEditBoxFocus(imageNameBox,1)
		
		LoadImage(makeScreenshotButton_image,"button.png") //load button
		CreateSprite(enterImageNameButton_sprite,makeScreenshotButton_image)
		SetSpriteSize(enterImageNameButton_sprite,80,30)
		SetSpriteDepth(enterImageNameButton_sprite,6)
		SetSpritePosition(enterImageNameButton_sprite,GetEditBoxX(imageNameBox), GetEditBoxY(imageNameBox) + GetEditBoxHeight(imageNameBox) +  5)
		
		overlayScreenActive = 1
		displayed = 1
		SetFolder("/media")
		
	EndIF

EndFunction


//******* DISPLAY ENTER IMAGE SIZE MENU***************************
Function displayEnterImageSizeMenu()

	SetFolder("/media/UI")
	If displayed = 0
		//screen background
		LoadImage(bluredBackground_image,"blured.png") //load background image
		CreateSprite(bluredBackground_sprite,bluredBackground_image)
		SetSpritePosition(bluredBackground_sprite,0,0)
		SetSpriteSize(bluredBackground_sprite,GetDeviceWidth(), GetDeviceHeight())
		SetSpriteDepth(bluredBackground_sprite,8)
		
		//gui background
		CreateSprite(gui_sprite4,gui_image) //display background image
		SetSpritePositionByOffset(gui_sprite4,GetDeviceWidth()/2, GetDeviceHeight()/2)
		SetSpriteSize(gui_sprite4,400,80)
		SetSpriteDepth(gui_sprite4,7)
		
		//text1
		CreateText(enterImageSize_text,"Image size Width X Height (pixels):") //create enter image width and height text
		SetTextSize(enterImageSize_text,15)
		SetTextPosition(enterImageSize_text,GetSpriteX(gui_sprite4) + 5, GetSpriteY(gui_sprite4) + 5)
		SetTextDepth(enterImageSize_text,6)
		
		//editbox display width of image
		CreateEditBox(enterImageWidthBox) //create enter image width edit box
		SetEditBoxPosition(enterImageWidthBox,GetTextX(enterImageSize_text), GetTextY(enterImageSize_text) + GetTextTotalHeight(enterImageSize_text) + 5)
		SetEditBoxSize(enterImageWidthBox,40,18)
		SetEditBoxText(enterImageWidthBox,Str(saveImgWidth))
		SetEditBoxDepth(enterImageWidthBox,6)
		
		//text2 'X'
		CreateText(Xsign_text,"X") //create X sign between width and height box
		SetTextSize(Xsign_text,20)
		SetTextPosition(Xsign_text,GetEditBoxX(enterImageWidthBox) + GetEditBoxWidth(enterImageWidthBox), GetTextY(enterImageSize_text) + GetTextTotalHeight(enterImageSize_text) + 5)
		SetTextDepth(Xsign_text,6)
		
		//editbox display height of image
		CreateEditBox(enterImageHeightBox) //create enter image height box
		SetEditBoxPosition(enterImageHeightBox,GetTextX(Xsign_text) + GetTextTotalWidth(Xsign_text), GetTextY(enterImageSize_text) + GetTextTotalHeight(enterImageSize_text) + 5)
		SetEditBoxSize(enterImageHeightBox,40,18)
		SetEditBoxText(enterImageHeightBox,Str(saveImgHeight))
		SetEditBoxDepth(enterImageHeightBox,6)
		
		//button
		LoadImage(makeScreenshotButton_image,"button.png") //load button
		CreateSprite(enterImageSizeButton_sprite,makeScreenshotButton_image)
		SetSpriteSize(enterImageSizeButton_sprite,80,30)
		SetSpriteDepth(enterImageSizeButton_sprite,6)
		SetSpritePosition(enterImageSizeButton_sprite,GetEditBoxX(enterImageWidthBox), GetEditBoxy(enterImageWidthBox) + GetEditBoxHeight(enterImageWidthBox) + 5)
		
		//get width and height from editboxes
		saveImgWidth = Val(GetEditBoxText(enterImageWidthBox))
		saveImgHeight = Val(GetEditBoxText(enterImageHeightBox))

		overlayScreenActive = 1
		displayed = 1
		SetFolder("/media")
	EndIF
	
	//show preview of the image
	If preview_loaded = 0
		SetFolder("/export")
		LoadImage(resizePreview_Image,captureImageName + "1.png")
		CreateSprite(resizePreview_Sprite,resizePreview_Image)
		SetSpriteDepth(resizePreview_Sprite,8)
		SetSpriteSize(resizePreview_Sprite,saveImgWidth,saveImgHeight) //resize it
		SetSpritePosition(resizePreview_Sprite,50,50)
		
		preview_loaded = 1
	EndIF
	
EndFunction


//******* DELETE ENTER IMAGE NAME MENU **********
Function deleteEnterImageNameMenu()
	If deleted = 0
		DeleteEditBox(imageNameBox)
		DeleteSprite(gui_sprite4)
		DeleteText(enterFileName_text)
		DeleteImage(makeScreenshotButton_image)
		DeleteSprite(enterImageNameButton_sprite)
		DeleteImage(bluredBackground_image)
		DeleteSprite(bluredBackground_sprite)
		overlayScreenActive = 0
		deleted = 1
	EndIF
EndFunction

//******* DELETE ENTER IMAGE SIZE MENU *********
Function deleteEnterImageSizeMenu()
	If deleted = 0
		DeleteEditBox(enterImageHeightBox)
		DeleteEditBox(enterImageWidthBox)
		DeleteSprite(gui_sprite4)
		DeleteImage(bluredBackground_image)
		DeleteSprite(bluredBackground_sprite)
		DeleteText(enterImageSize_text)
	    DeleteImage(makeScreenshotButton_image)
		DeleteSprite(enterImageSizeButton_sprite)
		DeleteText(Xsign_text)
		DeleteImage(resizePreview_Image)
		DeleteSprite(resizePreview_Sprite)
		overlayScreenActive = 0
		deleted = 1
	EndIF
EndFunction



//********* RESIZINGTHE CAPTURED IMAGES **************
Function resizeScreenshot()
	
	
	//first hide everything from the screen becasue we need a clean screen
	For i = 1000 to 1053 //sprites
		SetSpriteVisible(i,0)
	Next i
	
	For i = 1200 to 1239 //texts
		SetTextVisible(i,0)
	Next i
	
	For i = 1300 to 1320 // edit boxes
		SetEditBoxVisible(i,0)
	Next i 
	
	SetSpriteVisible(lightoptions_button_sprite,0)
	
	SetObjectVisible(1400,0) //3D Parent mesh
	SetObjectVisible(1401,0) //3D child mesh
	SetTextVisible(mesh_header_text,0) //mesh header text
	SetSpriteVisible(help_sprite,0) //help button
	
	//hide FPSC meshes if there are any
	If fpscmap_loaded_nolightmap = 1 or fpscmap_loaded_withlightmap = 1
		For obj = 1 to fpscObjNum
			objID = fpscObjMeshStartID + obj
			SetObjectVisible(objID,0)
		Next obj
	EndIf
	
	//hide point lights
	For p = 1 to maxPointLight
		If GetObjectExists(pointLight[p,0]) then SetObjectVisible(pointLight[p,0],0)
	Next p
	
	//load all previously captured images in order 1 to last
	SetFolder("/export")
	For i = 1 to imgnum
		LoadImage(resizeCaptured_image,captureImageName + Str(i) + ".png")
		CreateSprite(resizeCaptured_sprite,resizeCaptured_image)
		SetSpriteDepth(resizeCaptured_sprite,1)
		SetSpriteSize(resizeCaptured_sprite,saveImgWidth,saveImgHeight) //resize it
		
		Render() //capture new image
		GetImage(i,GetSpriteX(resizeCaptured_sprite),GetSpriteY(resizeCaptured_sprite),GetSpriteWidth(resizeCaptured_sprite), GetSpriteHeight(resizeCaptured_sprite))
		SaveImage(i,captureImageName + Str(i) + ".png" ) //save new image and replace the old one
		
		DeleteImage(i)
		DeleteImage(resizeCaptured_image)
		DeleteSprite(resizeCaptured_sprite)
		
		Sync()
	Next i
	
	//set everything visible again
	For i = 1000 to 1053 //sprites
		SetSpriteVisible(i,1)
	Next i
	
	For i = 1200 to 1239 //texts
		SetTextVisible(i,1)
	Next i
	
	For i = 1300 to 1320 // edit boxes
		SetEditBoxVisible(i,1)
	Next i 
	
	SetSpriteVisible(lightoptions_button_sprite,1)
	
	
	SetObjectVisible(1400,1) //3D Parent mesh
	SetObjectVisible(1401,1) //3D Child mesh
	SetTextVisible(mesh_header_text,1) //mesh header text
	SetSpriteVisible(help_sprite,1) //help button
	
	//show FPSC meshes if there are any
	If fpscmap_loaded_nolightmap = 1 or fpscmap_loaded_withlightmap = 1
		For obj = 1 to fpscObjNum
			objID = fpscObjMeshStartID + obj
			SetObjectVisible(objID,1)
		Next obj
	EndIf
	
	//show point lights
	For p = 1 to maxPointLight
		If GetObjectExists(pointLight[p,0]) then SetObjectVisible(pointLight[p,0],1)
	Next p
	
EndFunction



//*************DISPLAY MESSAGES***************
Function displayMessage(message$)
SetFolder("/media/UI")

//screen bakground
LoadImage(message_background_image,"blured.png") //load background image
CreateSprite(message_background_sprite,message_background_image)
SetSpritePosition(message_background_sprite,0,0)
SetSpriteSize(message_background_sprite,GetDeviceWidth(), GetDeviceHeight())
SetSpriteDepth(message_background_sprite,5)

//gui background
CreateSprite(gui_message_sprite,gui_image) //display background image
SetSpritePositionByOffset(gui_message_sprite,GetDeviceWidth()/2, GetDeviceHeight()/2)
SetSpriteSize(gui_message_sprite,500,100)
SetSpriteDepth(gui_message_sprite,4)


//button
LoadImage(okMessageButton_image,"button.png") //load button
CreateSprite(okMessageButton_sprite,okMessageButton_image)
SetSpriteSize(okMessageButton_sprite,80,30)
SetSpriteDepth(okMessageButton_sprite,3)
SetSpritePosition(okMessageButton_sprite,GetSpriteX(gui_message_sprite) + (GetSpriteWidth(gui_message_sprite) / 2 - GetSpriteWidth(okMessageButton_sprite)/2), GetSpriteY(gui_message_sprite) + (GetSpriteHeight(gui_message_sprite) - GetSpriteHeight(okMessageButton_sprite)))

//text 
CreateText(message_text,message$)
SetTextSize(message_text,20)
SetTextPosition(message_text,GetSpriteX(gui_message_sprite) + (GetSpriteWidth(gui_message_sprite)/2 - GetTextTotalWidth(message_text)/2) , GetSpriteY(gui_message_sprite) + 10)
SetTextDepth(message_text,3)

messageDisplayed = 1
SetFolder("/media") 
	
EndFunction


//**************DELETE MESSAGES**************
Function deleteMessage()
	DeleteImage(message_background_image)
	DeleteSprite(message_background_sprite)
	DeleteSprite(gui_message_sprite)
	DeleteSprite(okMessageButton_sprite)
	DeleteImage(okMessageButton_image)
	DeleteText(message_text)
	
	messageDisplayed = 0
EndFunction



//************DISPLAY ABOUT INFO**************
Function displayAboutInfo()
	If MouseIsOnSprite(about_sprite) and GetRawMouseLeftReleased()
		SetFolder("/media/UI")
		
		//screen bakground
		LoadImage(bluredBackground_image,"blured.png") //load background image
		CreateSprite(bluredBackground_sprite,bluredBackground_image)
		SetSpritePosition(bluredBackground_sprite,0,0)
		SetSpriteSize(bluredBackground_sprite,GetDeviceWidth(), GetDeviceHeight())
		SetSpriteDepth(bluredBackground_sprite,8)
		
		//gui background
		CreateSprite(about_gui_sprite,gui_image)
		SetSpriteSize(about_gui_sprite,400,270)
		SetSpritePositionByOffset(about_gui_sprite,GetDeviceWidth()/2, GetDeviceHeight()/2)
		SetSpriteDepth(about_gui_sprite,7)
		
		//logo
		LoadImage(about_logo_image,"3D2Sprite_icon.png")
		CreateSprite(about_logo_sprite,about_logo_image)
		SetSpriteScale(about_logo_sprite,0.5,0.5)
		SetSpritePosition(about_logo_sprite,GetSpriteX(about_gui_sprite) + GetSpriteWidth(about_logo_sprite), GetSpriteY(about_gui_sprite) + 5)
		SetSpriteDepth(about_logo_sprite,6)
		
		
		//text1
		CreateText(about_text1,"3D2Sprite v0.7.6")
		SetTextSize(about_text1,20)
		SetTextPosition(about_text1,GetSpriteX(about_gui_sprite) + GetTextTotalWidth(about_text1)/2, GetSpriteY(about_logo_sprite) + GetSpriteHeight(about_logo_sprite)+2)
		SetTextDepth(about_text1,6)
		
		//text6 (added later)
		CreateText(about_text6,"gametemplates.itch.io")
		SetTextSize(about_text6,17)
		SetTextPosition(about_text6,GetSpriteX(about_gui_sprite) + 70, GetTextY(about_text1) + GetTextTotalHeight(about_text1)+2)
		SetTextDepth(about_text6,6)
		
		
		//text2
		CreateText(about_text2,"Distributed under:")
		SetTextSize(about_text2,17)
		SetTextPosition(about_text2,GetSpriteX(about_gui_sprite) + 100, GetTextY(about_text6) + GetTextTotalHeight(about_text6) + 2)
		SetTextDepth(about_text2,6)
		
		//text3
		CreateText(about_text3,"MIT License")
		SetTextSize(about_text3,17)
		SetTextPosition(about_text3,GetSpriteX(about_gui_sprite) + 130, GetTextY(about_text2) + GetTextTotalHeight(about_text2) + 2)
		SetTextDepth(about_text3,6)
		
		//text4
		CreateText(about_text4,"By GameTemplates")
		SetTextSize(about_text4,17)
		SetTextPosition(about_text4,GetSpriteX(about_gui_sprite) + 100, GetTextY(about_text3) + GetTextTotalHeight(about_text3) + 2)
		SetTextDepth(about_text4,6)
		
		aboutDisplayed = 1
		SetFolder("/media")
		
	EndIF
	
	//open License web page on mouse click
	If (MouseIsOnSprite(about_license_sprite) or GetTextHitTest(about_text5,GetRawMouseX(), GetRawMouseY())) and GetRawMouseLeftReleased()
		OpenBrowser("http://creativecommons.org/licenses/by-nc-nd/4.0/legalcode")
	EndIF
	
	//open website on mouse click
	If GetTextHitTest(about_text6, GetRawMouseX(), GetRawMouseY())
		SetTextColor(about_text6,255,123,0,255)
		If GetRawMouseLeftReleased() then OpenBrowser("http://www.3d2sprite.blogspot.com")
	Else
		If aboutDisplayed = 1 then SetTextColor(about_text6,255,255,255,255)
	EndIf

EndFunction



//***************DELETE ABOUT INFO*****************
Function deleteAboutInfo()
	DeleteImage(bluredBackground_image)
	DeleteSprite(bluredBackground_sprite)
	DeleteSprite(about_gui_sprite)
	DeleteImage(about_logo_image)
	DeleteSprite(about_logo_sprite)
	DeleteImage(about_license_image)
	DeleteSprite(about_license_sprite)
	DeleteText(about_text1)
	DeleteText(about_text2)
	DeleteText(about_text3)
	DeleteText(about_text4)
	DeleteText(about_text5)
	DeleteText(about_text6)
	
	aboutDisplayed = 0
EndFunction

//**********CHECK LICENSE INFO**********
Function checkLicenseInfo()
	//check license info file if it exists and it content is correct
	SetFolder("/")
	OpenToRead(1,"license_info.txt")
	line1$ = ReadLine(1)
	
	If line1$ = "This software (3D2Sprite) is distributed under MIT license by gametemplates.itch.io"
		license = 1
	Else
		license = 0
	EndIf
	
	CloseFile(1)
	SetFolder("/media")
EndFunction


//****************OPEN HELP DOCUMENT*****************************
Function openHelp()
	If MouseIsOnSprite(help_sprite) and GetRawMouseLeftReleased()
		SetFolder("/")
		If GetFileExists("help.pdf")
			If GetDeviceType() = ""
				OpenBrowser("file:///" + GetReadPath() + "help.pdf")
			Else
				OpenBrowser(GetReadPath() + "help.pdf")
			EndIf
		Else
			SetFolder("/media")
			displayMessage("ERROR: Help document is missing!")
		EndIf
	EndIf
EndFunction



//************** CHANGE LIGHT OPTIONS ALSO LOAD LIGHT MAPS
Function changeLightOptions()
	
	//display options
	If MouseIsOnSprite(lightoptions_button_sprite) and GetRawMouseLeftReleased()
		If display = 0
			displayLightOptionsMenu()
			display = 1
		EndIf
	EndIf
	
	//position selection box
	For i = fpscmap_loadlight_text to fpscmap_removelight_text
		If GetTextHitTest(i,GetRawMouseX(), GetRawMouseY())
			SetSpriteSize(lightoptions_selection_sprite,GetSpriteWidth(lightoptions_gui_sprite), 20)
			SetSpritePosition(lightoptions_selection_sprite,GetSpriteX(lightoptions_gui_sprite), GetTextY(i) - 2)
		EndIF
	Next i
	
	//change ambient light color
	If GetEditBoxChanged(lightoptions_ambientr_editbox) //RED component
		If Val(GetEditBoxText(lightoptions_ambientr_editbox)) < 0 or Val(GetEditBoxText(lightoptions_ambientr_editbox)) > 255
			SetEditBoxText(lightoptions_ambientr_editbox,Str(ambientR))
			displayMessage("Value range is 0 - 255!")
		Else
			ambientR = Val(GetEditBoxText(lightoptions_ambientr_editbox))
			SetSpriteColor(lightoptions_ambient_preview_sprite,ambientR, ambientG, ambientB, 255)
			SetAmbientColor(ambientR, ambientG, ambientB)
		EndIf
	EndIf
	
	If GetEditBoxChanged(lightoptions_ambientg_editbox) //Green component
		If Val(GetEditBoxText(lightoptions_ambientg_editbox)) < 0 or Val(GetEditBoxText(lightoptions_ambientg_editbox)) > 255
			SetEditBoxText(lightoptions_ambientg_editbox,Str(ambientG))
			displayMessage("Value range is 0 - 255!")
		Else
			ambientG = Val(GetEditBoxText(lightoptions_ambientg_editbox))
			SetSpriteColor(lightoptions_ambient_preview_sprite,ambientR, ambientG, ambientB, 255)
			SetAmbientColor(ambientR, ambientG, ambientB)
		EndIf
	EndIf
	
	If GetEditBoxChanged(lightoptions_ambientb_editbox) //Bluereen component
		If Val(GetEditBoxText(lightoptions_ambientb_editbox)) < 0 or Val(GetEditBoxText(lightoptions_ambientb_editbox)) > 255
			SetEditBoxText(lightoptions_ambientb_editbox,Str(ambientB))
			displayMessage("Value range is 0 - 255!")
		Else
			ambientB = Val(GetEditBoxText(lightoptions_ambientb_editbox))
			SetSpriteColor(lightoptions_ambient_preview_sprite,ambientR, ambientG, ambientB, 255)
			SetAmbientColor(ambientR, ambientG, ambientB)
		EndIf
	EndIf
	
	//Change ambient light intensity
	If GetEditBoxChanged(lightoptions_sunlight_intensity_editbox)
		If Val(GetEditBoxText(lightoptions_sunlight_intensity_editbox)) < 0 or Val(GetEditBoxText(lightoptions_sunlight_intensity_editbox)) > 255
			SetEditBoxText(lightoptions_sunlight_intensity_editbox,Str(sunLight_intensity))
			displayMessage("Value range is 0 - 255!")
		Else
			sunLight_intensity = Val(GetEditBoxText(lightoptions_sunlight_intensity_editbox))
			SetSunColor(sunLight_intensity,sunLight_intensity,sunLight_intensity)
		EndIf
	EndIf
	
	
	
	//change point light color
	If GetEditBoxChanged(light_options_pointlightr_editbox) //RED component
		//set value
		If Val(GetEditBoxText(light_options_pointlightr_editbox)) < 0 or Val(GetEditBoxText(light_options_pointlightr_editbox)) > 255
			SetEditBoxText(light_options_pointlightr_editbox,Str(pointLightEditBoxR))
			displayMessage("Value range is 0 - 255")
		Else
			pointLightEditBoxR = Val(GetEditBoxText(light_options_pointlightr_editbox))
			SetSpriteColor(light_options_pointlight_preview_sprite, pointLightEditBoxR, pointLightEditBoxG, pointLightEditBoxB, 255 )
			
			//update color of selected point light
			If pickedObjID > 0
				For p = 1 to maxPointLight
					If pickedObjID = pointLight[p,0]
						pointLightColorR[p,p] = pointLightEditBoxR
						pointLightColorG[p,p] = pointLightEditBoxG
						pointLightColorB[p,p] = pointLightEditBoxB
				
						SetPointLightColor(pointLight[p,p], pointLightColorR[p,p], pointLightColorG[p,p], pointLightColorB[p,p])
						exit
					EndIf
				Next p
			EndIf
		EndIf
	EndIf
	
	If GetEditBoxChanged(light_options_pointlightg_editbox) //GREEN component
		//set value
		If Val(GetEditBoxText(light_options_pointlightg_editbox)) < 0 or Val(GetEditBoxText(light_options_pointlightg_editbox)) > 255
			SetEditBoxText(light_options_pointlightg_editbox,Str(pointLightEditBoxG))
			displayMessage("Value range is 0 - 255")
		Else
			pointLightEditBoxG = Val(GetEditBoxText(light_options_pointlightg_editbox))
			SetSpriteColor(light_options_pointlight_preview_sprite, pointLightEditBoxR, pointLightEditBoxG, pointLightEditBoxB, 255 )
			
			//update color of selected point light
			If pickedObjID > 0
				For p = 1 to maxPointLight
					If pickedObjID = pointLight[p,0]
						pointLightColorR[p,p] = pointLightEditBoxR
						pointLightColorG[p,p] = pointLightEditBoxG
						pointLightColorB[p,p] = pointLightEditBoxB
				
						SetPointLightColor(pointLight[p,p], pointLightColorR[p,p], pointLightColorG[p,p], pointLightColorB[p,p])
						exit
					EndIf
				Next p
			EndIf
		EndIf
	EndIf
	
	If GetEditBoxChanged(light_options_pointlightb_editbox) //BLUE component
		//set value
		If Val(GetEditBoxText(light_options_pointlightb_editbox)) < 0 or Val(GetEditBoxText(light_options_pointlightb_editbox)) > 255
			SetEditBoxText(light_options_pointlightb_editbox,Str(pointLightEditBoxB))
			displayMessage("Value range is 0 - 255")
		Else
			pointLightEditBoxB = Val(GetEditBoxText(light_options_pointlightb_editbox))
			SetSpriteColor(light_options_pointlight_preview_sprite, pointLightEditBoxR, pointLightEditBoxG, pointLightEditBoxB, 255 )
			
			//update color of selected point light
			If pickedObjID > 0
				For p = 1 to maxPointLight
					If pickedObjID = pointLight[p,0]
						pointLightColorR[p,p] = pointLightEditBoxR
						pointLightColorG[p,p] = pointLightEditBoxG
						pointLightColorB[p,p] = pointLightEditBoxB
				
						SetPointLightColor(pointLight[p,p], pointLightColorR[p,p], pointLightColorG[p,p], pointLightColorB[p,p])
						exit
					EndIf
				Next p
			EndIf
		EndIf
	EndIf
	
	If GetEditBoxChanged(light_options_pointlight_radious_editbox) //RADIOUS
		//set value
		If Val(GetEditBoxText(light_options_pointlight_radious_editbox)) < 0
			SetEditBoxText(light_options_pointlight_radious_editbox,Str(pointLightEditBoxRadious))
			displayMessage("Value must be greater then 0!")
		Else
			pointLightEditBoxRadious = Val(GetEditBoxText(light_options_pointlight_radious_editbox))
			
			//update radious of selected point light
			If pickedObjID > 0
				For p = 1 to maxPointLight
					If pickedObjID = pointLight[p,0]
						pointLightRadious[p,p] = Val(GetEditBoxText(light_options_pointlight_radious_editbox))
						SetPointLightRadius(pointLight[p,p], Val(GetEditBoxText(light_options_pointlight_radious_editbox)))
						exit
					EndIf
				Next p
			EndIf
		EndIf
	EndIf
	
	
	//FPSC Light map
	
	//LOAD
	If GetTextHitTest(fpscmap_loadlight_text,GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		If fpscmap_loaded_nolightmap = 1 and fpscmap_loaded_withlightmap = 0
			displayMessage("Ambient light options can't be used!")
			loadFPSCLightmap()
		ElseIf fpscmap_loaded_withlightmap = 1
			displayMessage("Light map is already loaded!")
		Else 
			displayMessage("No FPSC Level is loaded!")
		EndIf
		
		deleteLightOptionsMenu()
	EndIf
	
	//REMOVE
	If GetTextHitTest(fpscmap_removelight_text,GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		If fpscmap_loaded_withlightmap = 1
			//deleteFPSCLevel() 
			loadFPSCLevel()
		Else
			displayMessage("No Light map is Loaded!")
		EndIf
		
		deleteLightOptionsMenu()
	EndIf
	
	
	
	
	
	remstart
	//change flashlight
	If GetEditBoxChanged(lightoptions_flashr_editbox) //RED component
		If Val(GetEditBoxText(lightoptions_flashr_editbox)) < 0 or Val(GetEditBoxText(lightoptions_flashr_editbox)) > 255
			SetEditBoxText(lightoptions_flashr_editbox,Str(cam_flashlightR))
			displayMessage("Value range is 0 - 255!")
		Else
			cam_flashlightR = Val(GetEditBoxText(lightoptions_flashr_editbox))
			SetSpriteColor(lightoptions_flash_preview_sprite,cam_flashlightR, cam_flashlightG, cam_flashlightB, 255)
			SetPointLightColor(cam_pointlight,ambientR, ambientG, ambientB)
			If cam_flashlightON = 1
				DeletePointLight(cam_pointlight)
				ClearPointLights()
				CreatePointLight(cam_pointlight,GetCameraX(1), GetCameraY(1), GetCameraZ(1), cam_flashlightRadius, cam_flashlightR, cam_flashlightG, cam_flashlightB)
			EndIf
		EndIf
	EndIf
	
	If GetEditBoxChanged(lightoptions_flashg_editbox) //GREEN component
		If Val(GetEditBoxText(lightoptions_flashg_editbox)) < 0 or Val(GetEditBoxText(lightoptions_flashg_editbox)) > 255
			SetEditBoxText(lightoptions_flashg_editbox,Str(cam_flashlightG))
			displayMessage("Value range is 0 - 255!")
		Else
			cam_flashlightG = Val(GetEditBoxText(lightoptions_flashg_editbox))
			SetSpriteColor(lightoptions_flash_preview_sprite,cam_flashlightR, cam_flashlightG, cam_flashlightB, 255)
			SetPointLightColor(cam_pointlight,ambientR, ambientG, ambientB)
			If cam_flashlightON = 1
				DeletePointLight(cam_pointlight)
				ClearPointLights()
				CreatePointLight(cam_pointlight,GetCameraX(1), GetCameraY(1), GetCameraZ(1), cam_flashlightRadius, cam_flashlightR, cam_flashlightG, cam_flashlightB)
			EndIf
		EndIf
	EndIf
	
	If GetEditBoxChanged(lightoptions_flashb_editbox) //BLUE component
		If Val(GetEditBoxText(lightoptions_flashb_editbox)) < 0 or Val(GetEditBoxText(lightoptions_flashb_editbox)) > 255
			SetEditBoxText(lightoptions_flashb_editbox,Str(cam_flashlightB))
			displayMessage("Value range is 0 - 255!")
		Else
			cam_flashlightB = Val(GetEditBoxText(lightoptions_flashb_editbox))
			SetSpriteColor(lightoptions_flash_preview_sprite,cam_flashlightR, cam_flashlightG, cam_flashlightB, 255)
			SetPointLightColor(cam_pointlight,ambientR, ambientG, ambientB)
			If cam_flashlightON = 1
				DeletePointLight(cam_pointlight)
				ClearPointLights()
				CreatePointLight(cam_pointlight,GetCameraX(1), GetCameraY(1), GetCameraZ(1), cam_flashlightRadius, cam_flashlightR, cam_flashlightG, cam_flashlightB)
			EndIf
		EndIf
	EndIf
	remend
	
	
	
	//delete options
	If NOT MouseIsOnSprite(lightoptions_gui_sprite) and NOT MouseIsOnSprite(lightoptions_button_sprite) and NOT GetSpriteHitTest(colorPicker_gui_sprite, GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		deleteLightOptionsMenu()
	EndIf
EndFunction

//***************** DISPLAY LIGHT OPTIONS MENU***********************
Function displayLightOptionsMenu()
		SetFolder("/media/UI")
	
		//background
		CreateSprite(lightoptions_gui_sprite,gui_image)
		SetSpritePosition(lightoptions_gui_sprite,GetSpriteX(lightoptions_button_sprite),GetSpriteHeight(gui_sprite2))
		SetSpriteScale(lightoptions_gui_sprite,2,2.4)
		SetSpriteDepth(lightoptions_gui_sprite,8)
		
		//selection box
		LoadImage(lightoptions_selection_image,"selectionbox.png")
		CreateSprite(lightoptions_selection_sprite,lightoptions_selection_image)
		SetSpriteSize(lightoptions_selection_sprite,0,0)
		SetSpritePosition(lightoptions_selection_sprite,0,0)
		SetSpriteDepth(lightoptions_selection_sprite,7)
		
		//Ambient Light color text
		CreateText(lightoptions_text1,"Ambient light color")
		SetTextSize(lightoptions_text1,15)
		SetTextPosition(lightoptions_text1,GetSpriteX(lightoptions_gui_sprite),GetSpriteY(lightoptions_gui_sprite) + 10)
		SetTextDepth(lightoptions_text1,6)
		
		//Ambient editboxes
		CreateEditbox(lightoptions_ambientr_editbox) //RED color component
		SetEditBoxSize(lightoptions_ambientr_editbox,30,20)
		SetEditBoxPosition(lightoptions_ambientr_editbox,GetSpriteX(lightoptions_gui_sprite) + 2,GetTextY(lightoptions_text1) + GetTextTotalHeight(lightoptions_text1) + 2)
		SetEditBoxDepth(lightoptions_ambientr_editbox,6)
		SetEditBoxText(lightoptions_ambientr_editbox,str(ambientR))
		
		CreateEditbox(lightoptions_ambientg_editbox) //Green color component
		SetEditBoxSize(lightoptions_ambientg_editbox,30,20)
		SetEditBoxPosition(lightoptions_ambientg_editbox,GetEditBoxX(lightoptions_ambientr_editbox) + GetEditBoxWidth(lightoptions_ambientr_editbox) + 5,GetTextY(lightoptions_text1) + GetTextTotalHeight(lightoptions_text1) + 2)
		SetEditBoxDepth(lightoptions_ambientg_editbox,6)
		SetEditBoxText(lightoptions_ambientg_editbox,str(ambientG))
		
		CreateEditbox(lightoptions_ambientb_editbox) //Blue color component
		SetEditBoxSize(lightoptions_ambientb_editbox,30,20)
		SetEditBoxPosition(lightoptions_ambientb_editbox,GetEditBoxX(lightoptions_ambientg_editbox) + GetEditBoxWidth(lightoptions_ambientg_editbox) + 5,GetTextY(lightoptions_text1) + GetTextTotalHeight(lightoptions_text1) + 2)
		SetEditBoxDepth(lightoptions_ambientb_editbox,6)
		SetEditBoxText(lightoptions_ambientb_editbox,str(ambientB))
		
		//Ambient preview sprite
		CreateSprite(lightoptions_ambient_preview_sprite,0)
		SetSpritePosition(lightoptions_ambient_preview_sprite,GetEditBoxX(lightoptions_ambientb_editbox) + GetEditBoxWidth(lightoptions_ambientb_editbox) + 5, GetTextY(lightoptions_text1) + GetTextTotalHeight(lightoptions_text1) + 2)
		SetSpriteSize(lightoptions_ambient_preview_sprite,90,20)
		SetSpriteColor(lightoptions_ambient_preview_sprite, ambientR, ambientG, ambientB, 255)
		SetSpriteDepth(lightoptions_ambient_preview_sprite,6)
		
		//ambient light intensity
		CreateText(lightoptions_text4,"Light intensity")
		SetTextSize(lightoptions_text4,15)
		SetTextPosition(lightoptions_text4,GetSpriteX(lightoptions_gui_sprite),GetEditBoxY(lightoptions_ambientr_editbox) + GetEditBoxHeight(lightoptions_ambientr_editbox) + 10)
		SetTextDepth(lightoptions_text4,6)
		
		//ambient light intensity editbox
		CreateEditbox(lightoptions_sunlight_intensity_editbox)
		SetEditBoxSize(lightoptions_sunlight_intensity_editbox,30,20)
		SetEditBoxPosition(lightoptions_sunlight_intensity_editbox,GetSpriteX(lightoptions_gui_sprite) + 2,GetTextY(lightoptions_text4) + GetTextTotalHeight(lightoptions_text4) + 2)
		SetEditBoxDepth(lightoptions_sunlight_intensity_editbox,6)
		SetEditBoxText(lightoptions_sunlight_intensity_editbox,str(sunLight_intensity))
		
		
		
		//point light options
		
		//PointLight color text
		CreateText(light_options_pointLight_text1,"Point Light Color")
		SetTextSize(light_options_pointLight_text1,15)
		SetTextPosition(light_options_pointLight_text1,GetSpriteX(lightoptions_gui_sprite), GetEditBoxY(lightoptions_sunlight_intensity_editbox) + GetEditBoxHeight(lightoptions_sunlight_intensity_editbox) + 10)
		SetTextDepth(light_options_pointLight_text1,6)
		
		//editboxes
		CreateEditbox(light_options_pointlightr_editbox) //RED color component
		SetEditBoxSize(light_options_pointlightr_editbox,30,20)
		SetEditBoxPosition(light_options_pointlightr_editbox,GetSpriteX(lightoptions_gui_sprite) + 2,GetTextY(light_options_pointLight_text1) + GetTextTotalHeight(light_options_pointLight_text1) + 2)
		SetEditBoxDepth(light_options_pointlightr_editbox,6)
		If pickedObjID > 0 //if light object is picked
			For p = 1 to maxPointLight
				If pickedObjID = pointLight[p,0]
					pointLightEditBoxR = pointLightColorR[p,p] //set the color of the editbox to be the color of the selected light
					exit
				EndIf
			Next p
		Else
			pointLightEditBoxR = 255 //otherwise set the color to white
		EndIf
		SetEditBoxText(light_options_pointlightr_editbox,str(pointLightEditBoxR))
		
		
		
		CreateEditbox(light_options_pointlightg_editbox) //GREEN color component
		SetEditBoxSize(light_options_pointlightg_editbox,30,20)
		SetEditBoxPosition(light_options_pointlightg_editbox,GetEditBoxX(light_options_pointlightr_editbox) + GetEditBoxWidth(light_options_pointlightr_editbox) + 5,GetTextY(light_options_pointLight_text1) + GetTextTotalHeight(light_options_pointLight_text1) + 2)
		SetEditBoxDepth(light_options_pointlightg_editbox,6)
		If pickedObjID > 0 //if light object is picked
			For p = 1 to maxPointLight
				If pickedObjID = pointLight[p,0]
					pointLightEditBoxG = pointLightColorG[p,p] //set the color of the editbox to be the color of the selected light
					exit
				EndIf
			Next p
		Else
			pointLightEditBoxG = 255 //otherwise set the color to white
		EndIf
		SetEditBoxText(light_options_pointlightg_editbox,str(pointLightEditBoxG))
		
		CreateEditbox(light_options_pointlightb_editbox) //BLUE color component
		SetEditBoxSize(light_options_pointlightb_editbox,30,20)
		SetEditBoxPosition(light_options_pointlightb_editbox,GetEditBoxX(light_options_pointlightg_editbox) + GetEditBoxWidth(light_options_pointlightg_editbox) + 5,GetTextY(light_options_pointLight_text1) + GetTextTotalHeight(light_options_pointLight_text1) + 2)
		SetEditBoxDepth(light_options_pointlightb_editbox,6)
		If pickedObjID > 0 //if light object is picked
			For p = 1 to maxPointLight
				If pickedObjID = pointLight[p,0]
					pointLightEditBoxB = pointLightColorB[p,p] //set the color of the editbox to be the color of the selected light
					exit
				EndIf
			Next p
		Else
			pointLightEditBoxB = 255 //otherwise set the color to white
		EndIf
		SetEditBoxText(light_options_pointlightb_editbox,str(pointLightEditBoxB))
		
		
		//point light color preview sprite
		CreateSprite(light_options_pointlight_preview_sprite,0)
		SetSpritePosition(light_options_pointlight_preview_sprite,GetEditBoxX(light_options_pointlightb_editbox) + GetEditBoxWidth(light_options_pointlightb_editbox) + 5, GetTextY(light_options_pointLight_text1) + GetTextTotalHeight(light_options_pointLight_text1) + 2)
		SetSpriteSize(light_options_pointlight_preview_sprite,90,20)
		SetSpriteColor(light_options_pointlight_preview_sprite, pointLightEditBoxR, pointLightEditBoxG, pointLightEditBoxB, 255)
		SetSpriteDepth(light_options_pointlight_preview_sprite,6)
		
		//point light color radious text
		CreateText(light_options_pointLight_text2,"Point Light Radius")
		SetTextSize(light_options_pointLight_text2,15)
		SetTextPosition(light_options_pointLight_text2,GetSpriteX(lightoptions_gui_sprite), GetEditBoxY(light_options_pointlightb_editbox) + GetEditBoxHeight(light_options_pointlightb_editbox) + 10)
		SetTextDepth(light_options_pointLight_text2,6)
		
		//point light color radious editbox
		CreateEditbox(light_options_pointlight_radious_editbox)
		SetEditBoxSize(light_options_pointlight_radious_editbox,30,20)
		SetEditBoxPosition(light_options_pointlight_radious_editbox,GetSpriteX(lightoptions_gui_sprite) + 2,GetTextY(light_options_pointLight_text2) + GetTextTotalHeight(light_options_pointLight_text2) + 2)
		SetEditBoxDepth(light_options_pointlight_radious_editbox,6)
		If pickedObjID > 0 //if light object is picked
			For p = 1 to maxPointLight
				If pickedObjID = pointLight[p,0]
					pointLightEditBoxRadious = pointLightRadious[p,p] //set the radious of the editbox to be the radious of the selected light
					exit
				EndIf
			Next p
		Else
			pointLightEditBoxRadious = 100 //otherwise set the radious to 100
		EndIf
		SetEditBoxText(light_options_pointlight_radious_editbox,str(pointLightEditBoxRadious))
		
		
		
		//Load FPSC Lightmap
		CreateText(fpscmap_loadlight_text,"Load FPSC Light map")
		SetTextSize(fpscmap_loadlight_text,15)
		SetTextPosition(fpscmap_loadlight_text,GetSpriteX(lightoptions_gui_sprite), GetEditBoxY(light_options_pointlight_radious_editbox) + GetEditBoxHeight(light_options_pointlight_radious_editbox) + 10)
		SetTextDepth(fpscmap_loadlight_text,6)
		
		CreateText(fpscmap_removelight_text,"Remove FPSC Light map")
		SetTextColor(fpscmap_removelight_text,255,62,62,255)
		SetTextSize(fpscmap_removelight_text,15)
		SetTextPosition(fpscmap_removelight_text,GetSpriteX(lightoptions_gui_sprite), GetTextY(fpscmap_loadlight_text) + GetTextTotalHeight(fpscmap_loadlight_text) + 5)
		SetTextDepth(fpscmap_removelight_text,6)
		
		remstart
		//Flash light text
		CreateText(lightoptions_text2,"Flashlight color")
		SetTextSize(lightoptions_text2,15)
		SetTextPosition(lightoptions_text2,GetSpriteX(lightoptions_gui_sprite),GetEditBoxY(lightoptions_ambientr_editbox) + GetEditBoxHeight(lightoptions_ambientr_editbox) + 10)
		SetTextDepth(lightoptions_text2,6)
		
		//Flash light edit boxes
		CreateEditbox(lightoptions_flashr_editbox) //RED color component
		SetEditBoxSize(lightoptions_flashr_editbox,30,20)
		SetEditBoxPosition(lightoptions_flashr_editbox,GetSpriteX(lightoptions_gui_sprite) + 2,GetTextY(lightoptions_text2) + GetTextTotalHeight(lightoptions_text2) + 2)
		SetEditBoxDepth(lightoptions_flashr_editbox,6)
		SetEditBoxText(lightoptions_flashr_editbox,str(cam_flashlightR))
		
		CreateEditbox(lightoptions_flashg_editbox) //Green color component
		SetEditBoxSize(lightoptions_flashg_editbox,30,20)
		SetEditBoxPosition(lightoptions_flashg_editbox,GetEditBoxX(lightoptions_flashr_editbox) + GetEditBoxWidth(lightoptions_flashr_editbox) + 5,GetTextY(lightoptions_text2) + GetTextTotalHeight(lightoptions_text2) + 2)
		SetEditBoxDepth(lightoptions_flashg_editbox,6)
		SetEditBoxText(lightoptions_flashg_editbox,str(cam_flashlightG))
		
		CreateEditbox(lightoptions_flashb_editbox) //Blue color component
		SetEditBoxSize(lightoptions_flashb_editbox,30,20)
		SetEditBoxPosition(lightoptions_flashb_editbox,GetEditBoxX(lightoptions_flashg_editbox) + GetEditBoxWidth(lightoptions_flashg_editbox) + 5,GetTextY(lightoptions_text2) + GetTextTotalHeight(lightoptions_text2) + 2)
		SetEditBoxDepth(lightoptions_flashb_editbox,6)
		SetEditBoxText(lightoptions_flashb_editbox,str(cam_flashlightB))
		
		//Flash light preview sprite
		CreateSprite(lightoptions_flash_preview_sprite,0)
		SetSpritePosition(lightoptions_flash_preview_sprite,GetEditBoxX(lightoptions_flashb_editbox) + GetEditBoxWidth(lightoptions_flashb_editbox) + 5, GetTextY(lightoptions_text2) + GetTextTotalHeight(lightoptions_text2) + 2)
		SetSpriteSize(lightoptions_flash_preview_sprite,90,20)
		SetSpriteColor(lightoptions_flash_preview_sprite, cam_flashlightR, cam_flashlightG, cam_flashlightB, 255)
		SetSpriteDepth(lightoptions_flash_preview_sprite,6)
		remend
		
		light_options_displayed = 1
		SetFolder("/media") 
EndFunction


//******************* DELETE LIGHT OPTIONS MENU*********************
Function deleteLightOptionsMenu()
	DeleteSprite(lightoptions_gui_sprite)
	DeleteText(lightoptions_text1)
	DeleteEditBox(lightoptions_ambientr_editbox)
	DeleteEditBox(lightoptions_ambientg_editbox)
	DeleteEditBox(lightoptions_ambientb_editbox)
	DeleteSprite(lightoptions_ambient_preview_sprite)
	DeleteText(lightoptions_text4)
	DeleteEditBox(lightoptions_sunlight_intensity_editbox)
	DeleteText(fpscmap_loadlight_text)
	DeleteText(fpscmap_removelight_text)
	DeleteImage(lightoptions_selection_image)
	DeleteSprite(lightoptions_selection_sprite)
	DeleteText(light_options_pointLight_text1)
	DeleteText(light_options_pointlight_text2)
	DeleteEditBox(light_options_pointlightr_editbox)
	DeleteEditBox(light_options_pointlightg_editbox)
	DeleteEditBox(light_options_pointlightb_editbox)
	DeleteEditBox(light_options_pointlight_radious_editbox)
	DeleteSprite(light_options_pointlight_preview_sprite)

	//DeleteText(lightoptions_text2)
	//DeleteEditBox(lightoptions_flashr_editbox)
	//DeleteEditBox(lightoptions_flashg_editbox)
	//DeleteEditBox(lightoptions_flashb_editbox)
	//DeleteSprite(lightoptions_flash_preview_sprite)
	
	light_options_displayed = 0
	
	If colorPicker_displayed = 1 //delete color picker if it diplayed
		deleteColorPicker()
	EndIf
EndFunction
	

//*************************** TOGGLE FLASHLIGHT ON OFF*****************************
remstart
Function flashLight()
	If GetRawKeyPressed(KEY_F)
		If cam_flashlightON = 0
			CreatePointLight(cam_pointlight,GetCameraX(0), GetCameraY(0),GetCameraZ(0),cam_flashlightRadius,cam_flashlightR,cam_flashlightG,cam_flashlightB)
			SetPointLightMode(cam_pointlight,1)
			cam_flashlightON = 1
		Else
			DeletePointLight(cam_pointlight)
			ClearPointLights()
			cam_flashlightON = 0
		EndIf
	EndIf
	
	//make flashlight follow the camera
	If cam_flashlightON = 1
		SetPointLightPosition(cam_pointlight, GetCameraX(0), GetCameraY(0), GetCameraZ(0))
	EndIf
EndFunction
remend

//******************* LOAD FPSC Light map****************************************
Function loadFPSCLightMap()
	If fpscmap_loaded_withlightmap = 0

		//load shader
		SetFolder("/media/shaders")
		LoadShader(1, "fpsc_vertex.vs", "fpsc_pixel.ps")
		SetFolder("/fpsc")
			
		//load lightmaps
		Dim lm[15]
		
		For i = 0 to 15
			If GetFileExists(Str(i) + ".png")
				lm[i] = LoadImage(Str(i) + ".png")
				lmMax = i
			EndIf
		Next i

		For t = 0 to lmMax

			SetImageWrapU(lm[t], 1)
			SetImageWrapV(lm[t], 1)

		Next t
			
		//apply lightmaps and shaders on each object
		fpscObjNum = (GetFileCount() - 2) / 2

		For obj = 1 to fpscObjNum
			objID = fpscObjMeshStartID + obj
				
			For i = 0 to 15
				If GetFileExists("texture-" + Str(obj) + "-" + Str(i) + ".jpg") 
					tex$ = "texture-" + Str(obj) + "-" + Str(i) + ".jpg"
				EndIf
			Next i
			
			texname$ = Left(tex$, Len(tex$) - 4)
			lm$ = Right(texname$, 1)

			SetObjectImage(objID, lm[val(lm$)], 1)
			SetObjectShader(objID, 1)
				
			Sync()

		Next obj
    
		fpscmap_loaded_withlightmap = 1
		fpscmap_loaded_nolightmap = 0
	EndIf
EndFunction



//******************* LOAD FPSC LEVEL****************************************
Function loadFPSCLevel()
	If fpscmap_loaded_nolightmap = 0
		SetFolder("/fpsc")
	
		//remove any shader files may exported by FPSC-2-AGK as we don't rely on them 
		If GetFileExists("vertex.vs") then DeleteFile("vertex.vs")
		If GetFileExists("pixel.ps") then DeleteFile("pixel.ps")
		
		//load all 3d mesh, all textures and apply textures on each 3D mesh
		fpscObjNum = (GetFileCount() - 2)/2 
		
		For obj = 1 to fpscObjNum
			objID = fpscObjMeshStartID + obj
			textID = fpscObjTextureStartID + obj
			
			If fpscmap_loaded_nolightmap = 0 and fpscmap_loaded_withlightmap = 0 //load meshes and textures only if it not already loaded, otherwise apply internal shader only to remove light map
				obj$ = "mesh-" + Str(obj) + ".obj"
				LoadObject(objID, obj$, 0)
			
			
				For i = 0 to 15
					If GetFileExists("texture-" + Str(obj) + "-" + Str(i) + ".jpg") 
						tex$ = "texture-" + Str(obj) + "-" + Str(i) + ".jpg"
						LoadImage(textID,tex$)

						SetImageWrapU(textID, 1)
						SetImageWrapV(textID, 1)
						SetObjectImage(objID, textID, 0)
					EndIf
				Next i
			EndIf
			
			SetObjectImage(objID,0,1) //remove lightmap shader
			SetObjectShader(objID,0) //use internal shader
			 
			Sync()

		Next obj
	
		fpscmap_loaded_nolightmap = 1
		fpscmap_loaded_withlightmap = 0
	EndIf
EndFunction


//****************** DELETE FPSC LEVEL****************************
Function deleteFPSCLevel()
	For obj = 1 to fpscObjNum
		objID = fpscObjMeshStartID + obj
		textID = fpscObjTextureStartID + obj
		
		DeleteObject(objID)
		DeleteImage(textID)
	Next obj
	If fpscmap_loaded_nolightmap = 1 then fpscmap_loaded_nolightmap = 0
	If fpscmap_loaded_withlightmap = 1 then fpscmap_loaded_withlightmap = 0
	fpscObjNum = 0
EndFunction


//********************** RESET PARENT MESH INFO***********************
Function resetParentMeshInfo()
	//reset all values
	parentPreviewD = 0
	parentPreviewN = 0
	parentPreviewL = 0
	//parentScale = 0.1 
	//objectposX = 0
	//objectposY  = 0
	//objectposZ  = 0
	objectStartFrame = 0
	objectEndFrame = 0
	objectAnimSpeed = 10
	objectAnimLoop = 1
	object_transperancy = 0
	
	//reset editboxes
	//SetEditBoxText(textureTransparencyBox,Str(object_transperancy))
	//SetEditBoxText(objectStartFrameBox,Str(objectStartFrame))
	//SetEditBoxText(objectEndFrameBox,Str(objectEndFrame))
	//SetEditBoxText(objectAnimSpeedBox,Str(objectAnimSpeed))
	//SetEditBoxText(objectAnimLoopBox,Str(objectAnimLoop))
	//SetEditBoxText(objectScaleBox,Left(Str(parentScale),3))
	//SetEditBoxText(textureTransparencyBox,str(object_transperancy))
	
EndFunction


//****************** RESET CHILD MESH INFO************************
Function resetChildMeshInfo()
	//reset all valued
	childPreviewD = 0
	childPreviewN = 0
	childPreviewL = 0
	childNameOfBone = ""
	//childLocalX = 1
	//childLocalY = 0
	//childLocalZ = 0
	//childRotateX = 1
	//childRotateY = 0
	//childRotateZ = 0
	//childScale = 0.01
	
	//reset editboxes
	//SetEditBoxText(child_nameofbone_editbox,childNameOfBone)
	//SetEditBoxText(child_localx_editbox,left(str(childLocalX),3))
	//SetEditBoxText(child_localy_editbox,left(str(childLocalY),3))
	//SetEditBoxText(child_localz_editbox,left(str(childLocalZ),3))
	//SetEditBoxText(child_rotatex_editbox,left(str(childRotateX),3))
	//SetEditBoxText(child_rotatey_editbox,left(str(childRotateY),3))
	//SetEditBoxText(child_rotatez_editbox,left(str(childRotateZ),3))
	SetEditBoxText(child_scale_editbox,left(str(childScale),4))
	
EndFunction



//****************** RESET CAMERA INFO************************************
Function resetCameraInfo()
	//reset all values
	camspeed = 0.5
	cameraposX = 0
	cameraposY = 0 
	cameraposZ = -100
	
	//reset editboxes
	SetEditBoxText(camspeedBox,Left(Str(camspeed),3))
	SetEditBoxText(camposXBox,Str(cameraposX))
	SetEditBoxText(camposYBox,Str(cameraposY))
	SetEditBoxText(camposZBox,Str(cameraposZ))
EndFunction


//***********PICK OBJECT IN 3D WINDOW*************************
Function pickObject()
	
	If GetRawMouseLeftPressed() and overlayScreenActive = 0 and GetSpriteHitTest(lightoptions_button_sprite,GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(lightoptions_gui_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(colorPicker_gui_sprite, GetRawMouseX(), GetRawMouseY()) = 0
		If GetPRSButtonHitTest() //if none of the buttons hovered over by the mouse
			local distance as float
			local directionX as float
			local directionY as float
			local directionZ as float
			distance = 3000
			directionX = Get3DVectorXFromScreen( GetPointerX(), GetPointerY() ) * distance + GetCameraX(1)
			directionY = Get3DVectorYFromScreen( GetPointerX(), GetPointerY() ) * distance + GetCameraY(1)
			directionZ = Get3DVectorZFromScreen( GetPointerX(), GetPointerY() ) * distance + GetCameraZ(1)
			pickedObjID =  ObjectRayCast( 0, GetCameraX(1), GetCameraY(1), GetCameraZ(1), directionX, directionY, directionZ )
		EndIf
		
		If pickedObjID > 0 //if an object is picked
			For i = positionX_button_image to scaleXYZ_button_sprite //show buttons
				SetSpriteVisible(i,1)
			Next i 
			//PickVec = CreateVector3( GetObjectRayCastX( 0 ), GetObjectRayCastY( 0 ), GetObjectRayCastZ( 0 ) )
		
			SetObjectColor(pickedObjID, 122,22,22,255) //set picekd object color to red
			If NOT pickedObjID = parentMesh then SetObjectColor(parentMesh,255,255,255,255) //if parent object is not picked, set it color to white
			If NOT pickedObjID = childMesh then SetObjectColor(childMesh,255,255,255,255) //if child object is not picked, set it color to white
			If fpscmap_loaded_nolightmap = 1 or fpscmap_loaded_withlightmap = 1 //if FPSC object is not picked, set it color to white
				For obj = 1 to fpscObjNum
					objID = fpscObjMeshStartID + obj
					If NOT pickedObjID = objID then SetObjectColor(objID,255,255,255,255)
				Next obj
			EndIf
			
			For p = 1 to maxPointLight //if no point light mesh is selected, set the mesh color to be the color of the light
				If pointLightLoaded[p,0] = 1
					//If NOT pickedObjID = pointLight[p,0] then SetObjectColor(pointLight[p,0], 255,255,255,255)
					If NOT pickedObjID = pointLight[p,0] then SetObjectColor(pointLight[p,0], pointLightColorR[p,p], pointLightColorG[p,p], pointLightColorB[p,p],255)
				EndIf
			Next p
			
			
		Else //if no object is picked
			For i = positionX_button_image to scaleXYZ_button_sprite //hide buttons
				SetSpriteVisible(i,0)
			Next i
			If parent_mesh_loaded = 1 then SetObjectColor(parentMesh,255,255,255,255) //set parent object color to white
			If child_mesh_loaded = 1 then SetObjectColor(childMesh,255,255,255,255) //set child object color to white
			If fpscmap_loaded_nolightmap = 1 or fpscmap_loaded_withlightmap = 1 //set FPSC object color to white
				For obj = 1 to fpscObjNum
					objID = fpscObjMeshStartID + obj
					SetObjectColor(objID,255,255,255,255)
				Next obj
			EndIf
			
			If GetSpriteHitTest(lightoptions_button_sprite,GetRawMouseX(), GetRawMouseY()) = 0
				For p = 1 to maxPointLight //set point light mesh color to be the color of the light 
					If pointLightLoaded[p,0] = 1
						//SetObjectColor(pointLight[p,0], 255,255,255,255)
						SetObjectColor(pointLight[p,0], pointLightColorR[p,p], pointLightColorG[p,p], pointLightColorB[p,p],255)
					EndIf
				Next p
			EndIf
			
		Endif
    EndIf
    
    
    
    
    //unselect object and hide buttons if ESC is pressed or capture screen is active
    If pickedObjID > 0 and (GetRawKeyPressed(KEY_ESCAPE) or overlayScreenActive = 1)
		For i = positionX_button_image to scaleXYZ_button_sprite //hide buttons
			SetSpriteVisible(i,0)
		Next i
		If parent_mesh_loaded = 1 then SetObjectColor(parentMesh,255,255,255,255) //set parent object color to white
		If child_mesh_loaded = 1 then SetObjectColor(childMesh,255,255,255,255) //set child object color to white
		If fpscmap_loaded_nolightmap = 1 or fpscmap_loaded_withlightmap = 1 //set FPSC object color to white
			For obj = 1 to fpscObjNum
				objID = fpscObjMeshStartID + obj
				SetObjectColor(objID,255,255,255,255)
			Next obj
		EndIf
		
		For p = 1 to maxPointLight //set point light mesh to white
			If pointLightLoaded[p,0] = 1
				SetObjectColor(pointLight[p,0], pointLightColorR[p,p],pointLightColorG[p,p],pointLightColorB[p,p],255)
			EndIf
		Next p
	EndIf
	
	//unselect object and hide buttons if object is deleted
    If pickedObjID > 0 and GetRawKeyPressed(KEY_DELETE)
		For i = positionX_button_image to scaleXYZ_button_sprite //hide buttons
			SetSpriteVisible(i,0)
		Next i
		If parent_mesh_loaded = 1 then SetObjectColor(parentMesh,255,255,255,255) //set parent object color to white
		If child_mesh_loaded = 1 then SetObjectColor(childMesh,255,255,255,255) //set child object color to white
		If fpscmap_loaded_nolightmap = 1 or fpscmap_loaded_withlightmap = 1 //set FPSC object color to white
			For obj = 1 to fpscObjNum
				objID = fpscObjMeshStartID + obj
				SetObjectColor(objID,255,255,255,255)
				if pickedObjID = objID then DeleteObject(objID) //delete FPSC level part if is selected
			Next obj
		EndIf
		
		For p = 1 to maxPointLight //set point light mesh to white
			If pointLightLoaded[p,0] = 1
				SetObjectColor(pointLight[p,0], pointLightColorR[p,p],pointLightColorG[p,p],pointLightColorB[p,p],255)
			EndIf
		Next p
	EndIf
	
EndFunction

//check if mouse is over any of these buttons
Function GetPRSButtonHitTest()
	value =  GetSpriteHitTest(positionX_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(positionY_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(positionZ_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(rotationX_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(rotationY_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(rotationZ_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(scaleX_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(scaleY_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(scaleZ_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0 and GetSpriteHitTest(scaleXYZ_button_sprite, GetRawMouseX(), GetRawMouseY()) = 0
EndFunction value 

//check if any of these buttons are active
Function GetPRSButtonActive()
 value = moveX_selected = 0 and moveY_selected = 0 and moveZ_selected = 0 and rotateX_selected = 0 and rotateY_selected = 0 and rotateZ_selected = 0 and scaleX_selected = 0 and scaleY_selected = 0 and scaleZ_selected = 0 and  scaleXYZ_selected = 0
EndFunction value


//add point light
Function addPointLight()
	
	//position selection box on Add point light text
	If GetTextHitTest(add_pointlight_text,GetRawMouseX(), GetRawMouseY())
		SetSpriteSize(addmesh_selectionbox_sprite,GetSpriteWidth(addmesh_gui_sprite), 20)
		SetSpritePosition(addmesh_selectionbox_sprite,GetSpriteX(addmesh_gui_sprite), GetTextY(add_pointlight_text) - 2)
	EndIF
	
	If  GetTextHitTest(add_pointlight_text,GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		//display message is maximum number of point light is exceeded
		If pointLightCounter = maxPointLight then displayMessage("Maximum number of point lights exceed!")
		
		For i = 1 to maxPointLight
			If pointLightLoaded[i,0] = 0
				CreateObjectSphere(pointLight[i,0],5,5,5)
				SetObjectPosition(pointLight[i,0], GetCameraX(1) + Random(0,10), GetCameraY(1) + Random(0,10),GetCameraZ(1))
				SetObjectRotation(pointLight[i,0],GetCameraAngleX(1), GetCameraAngleY(1), GetCameraAngleZ(1))
				MoveObjectLocalZ(pointLight[i,0],Random(50,100))
				SetObjectLightMode(pointLight[i,0],0)
				
				//set color in light options to white and radious to 100
				pointLightEditBoxR = 255
				pointLightEditBoxG = 255
				pointLightEditBoxB = 255
				pointLightEditBoxRadious = 100
				
				//get color from the light options to nake sure the color is correct
				pointLightColorR[i,i] = pointLightEditBoxR
				pointLightColorG[i,i] = pointLightEditBoxG
				pointLightColorB[i,i] = pointLightEditBoxB
				
				//get radious from light options
				pointLightRadious[i,i] = pointLightEditBoxRadious
				
				CreatePointLight(pointLight[i,i], GetObjectX(pointLight[i,0]), GetObjectY(pointLight[i,0]), GetObjectZ(pointLight[i,0]), pointLightRadious[i,i], pointLightColorR[i,i], pointLightColorG[i,i], pointLightColorB[i,i])
				SetPointLightMode(pointLight[i,i],1)
				
				pointLightLoaded[i,0] = 1
				pointLightCounter = pointLightCounter + 1
				exit
			EndIf
		Next i
		
		//change ambient light color and intensity to make point light looks better
		If pointLightCounter = 1
			ambientR = 30
			ambientG = 30
			ambientB = 30
			sunLight_intensity = 0
		
			SetEditBoxText(lightoptions_ambientr_editbox,Str(ambientR))
			SetEditBoxText(lightoptions_ambientg_editbox,Str(ambientG))
			SetEditBoxText(lightoptions_ambientb_editbox,Str(ambientB))
			SetEditBoxText(lightoptions_sunlight_intensity_editbox,Str(sunLight_intensity))
		
			SetSpriteColor(lightoptions_ambient_preview_sprite,ambientR,ambientG,ambientB,255)
			SetAmbientColor(ambientR,ambientG,ambientB)
			SetSunColor(sunLight_intensity,sunLight_intensity,sunLight_intensity)
		EndIf
		
		//delete add mesh menu if it diplayed 
		deleteAddMeshMenu()	

	EndIf

	If pointLightLoaded[1,0] = 1 then SetPointLightPosition(pointLight[1,1],GetObjectX(pointLight[1,0]), GetObjectY(pointLight[1,0]), GetObjectZ(pointLight[1,0]))
	If pointLightLoaded[2,0] = 1 then SetPointLightPosition(pointLight[2,2],GetObjectX(pointLight[2,0]), GetObjectY(pointLight[2,0]), GetObjectZ(pointLight[2,0]))
	
	
	
	removePointLight()
EndFunction

// remove point light
Function removePointLight()
	If pointLightLoaded[1,0] = 1 or pointLightLoaded[2,0] = 1
		For i = 1 to maxPointLight
			If pickedObjID = pointLight[i,0] and GetRawKeyPressed(KEY_DELETE)
				DeletePointLight(pointLight[i,i])
				DeleteObject(pointLight[i,0])
				pointLightLoaded[i,0] = 0
				pointLightCounter = pointLightCounter - 1
				
				//set ambiebt light back to normal if no more point light present in the scene
				If pointLightCounter = 0
					ambientR = 255
					ambientG = 255
					ambientB = 255
					sunLight_intensity = 100
					
					SetAmbientColor(ambientR, ambientG, ambientB)
					SetSunColor(sunLight_intensity, sunLight_intensity, sunLight_intensity)
				EndIf
			EndIf
		Next i
	EndIf
EndFunction


//display color picker
Function displayColorPicker()
	row_counter = 0
	If (GetSpriteHitTest(lightoptions_ambient_preview_sprite, GetRawMouseX(), GetRawMouseY()) or GetSpriteHitTest(light_options_pointlight_preview_sprite, GetRawMouseX(), GetRawMouseY()) or GetSpriteHitTest(childTransparentPreview_sprite, GetRawMouseX(), GetRawMouseY()) or GetSpriteHitTest(parentTransparentPreview_sprite, GetRawMouseX(), GetRawMouseY())) and GetRawMouseLeftReleased()
		
		//gui
		CreateSprite(colorPicker_gui_sprite,gui_image)
		If set_ambient_color = 1
			SetSpritePosition(colorPicker_gui_sprite,GetSpriteX(lightoptions_gui_sprite) + GetSpriteWidth(lightoptions_gui_sprite),GetSpriteY(lightoptions_ambient_preview_sprite))
		EndIf
		
		If set_pointlight_color = 1
			SetSpritePosition(colorPicker_gui_sprite,GetSpriteX(lightoptions_gui_sprite) + GetSpriteWidth(lightoptions_gui_sprite),GetSpriteY(light_options_pointlight_preview_sprite))
		EndIf
		
		If childTextureSelectionMenu_displayed = 1
			SetSpritePosition(colorPicker_gui_sprite,GetSpriteX(childTextureSelection_gui_sprite) + GetSpriteWidth(childTextureSelection_gui_sprite),GetSpriteY(childTransparentPreview_sprite))
		EndIf
		
		If parentTextureSelectionMenu_displayed = 1
			SetSpritePosition(colorPicker_gui_sprite,GetSpriteX(parentTextureSelection_gui_sprite) + GetSpriteWidth(parentTextureSelection_gui_sprite),GetSpriteY(parentTransparentPreview_sprite))
		EndIf
		
		SetSpriteSize(colorPicker_gui_sprite,205,150)
		SetSpriteDepth(colorPicker_gui_sprite,7)

		//colors
		For r1 = 1 to 10 //first row
			CreateSprite(colorPicker_sprite[r1,0],0)
			SetSpriteSize(colorPicker_sprite[r1,0],20,20)
			SetSpritePosition(colorPicker_sprite[r1,0], ((GetSpriteX(colorPicker_gui_sprite) + 1) + (GetSpriteWidth(colorPicker_sprite[r1,0]) * r1) + 2) - GetSpriteWidth(colorPicker_sprite[r1,0]) , GetSpriteY(colorPicker_gui_sprite) + 2)
			SetSpriteColor(colorPicker_sprite[r1,0],colorPicker_sprite[r1,1], colorPicker_sprite[r1,2], colorPicker_sprite[r1,3],255)
			SetSpriteDepth(colorPicker_sprite[r1,0],6)
		Next r1
		
		For r2 = 11 to 20 //second row
			row_counter = row_counter + 1
			CreateSprite(colorPicker_sprite[r2,0],0)
			SetSpriteSize(colorPicker_sprite[r2,0],20,20)
			SetSpritePosition(colorPicker_sprite[r2,0], ((GetSpriteX(colorPicker_gui_sprite) + 1) + (GetSpriteWidth(colorPicker_sprite[r2,0]) * row_counter) + 2) - GetSpriteWidth(colorPicker_sprite[r2,0]) , (GetSpriteY(colorPicker_gui_sprite) + GetSpriteHeight(colorPicker_sprite[r2,0])) + 2)
			SetSpriteColor(colorPicker_sprite[r2,0],colorPicker_sprite[r2,1], colorPicker_sprite[r2,2], colorPicker_sprite[r2,3],255)
			SetSpriteDepth(colorPicker_sprite[r2,0],6)
		Next r2
		
		row_counter = 0
		For r3 = 21 to 30 //third row
			row_counter = row_counter + 1
			CreateSprite(colorPicker_sprite[r3,0],0)
			SetSpriteSize(colorPicker_sprite[r3,0],20,20)
			SetSpritePosition(colorPicker_sprite[r3,0], ((GetSpriteX(colorPicker_gui_sprite) + 1) + (GetSpriteWidth(colorPicker_sprite[r3,0]) * row_counter) + 2) - GetSpriteWidth(colorPicker_sprite[r3,0]) , (GetSpriteY(colorPicker_gui_sprite) + GetSpriteHeight(colorPicker_sprite[r3,0])*2) + 2)
			SetSpriteColor(colorPicker_sprite[r3,0],colorPicker_sprite[r3,1], colorPicker_sprite[r3,2], colorPicker_sprite[r3,3],255)
			SetSpriteDepth(colorPicker_sprite[r3,0],6)
		Next r3
		
		row_counter = 0
		For r4 = 31 to 40 //forth row
			row_counter = row_counter + 1
			CreateSprite(colorPicker_sprite[r4,0],0)
			SetSpriteSize(colorPicker_sprite[r4,0],20,20)
			SetSpritePosition(colorPicker_sprite[r4,0], ((GetSpriteX(colorPicker_gui_sprite) + 1) + (GetSpriteWidth(colorPicker_sprite[r4,0]) * row_counter) + 2) - GetSpriteWidth(colorPicker_sprite[r4,0]) , (GetSpriteY(colorPicker_gui_sprite) + GetSpriteHeight(colorPicker_sprite[r4,0])*3) + 2)
			SetSpriteColor(colorPicker_sprite[r4,0],colorPicker_sprite[r4,1], colorPicker_sprite[r4,2], colorPicker_sprite[r4,3],255)
			SetSpriteDepth(colorPicker_sprite[r4,0],6)
		Next r4
		
		row_counter = 0
		For r5 = 41 to 45 //fifth row
			row_counter = row_counter + 1
			CreateSprite(colorPicker_sprite[r5,0],0)
			SetSpriteSize(colorPicker_sprite[r5,0],20,20)
			SetSpritePosition(colorPicker_sprite[r5,0], ((GetSpriteX(colorPicker_gui_sprite) + 1) + (GetSpriteWidth(colorPicker_sprite[r5,0]) * row_counter) + 2) - GetSpriteWidth(colorPicker_sprite[r5,0]) , (GetSpriteY(colorPicker_gui_sprite) + GetSpriteHeight(colorPicker_sprite[r5,0])*4) + 2)
			SetSpriteColor(colorPicker_sprite[r5,0],colorPicker_sprite[r5,1], colorPicker_sprite[r5,2], colorPicker_sprite[r5,3],255)
			SetSpriteDepth(colorPicker_sprite[r5,0],6)
		Next r5
		
		colorPicker_displayed = 1
	EndIf
	
EndFunction


//pick the color from colir picker and apply it on the selected light
Function pickColor()
	//check which light we want change ambient or point light
	If GetSpriteHitTest(lightoptions_ambient_preview_sprite, GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		set_ambient_color = 1
		set_pointlight_color = 0
		set_childtransparent_color = 0
		set_parenttransparentcolor = 0
	EndIf
	
	If GetSpriteHitTest(light_options_pointlight_preview_sprite, GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		set_pointlight_color = 1
		set_ambient_color = 0
		set_childtransparent_color = 0
		set_parenttransparentcolor = 0
	EndIf
	
	If GetSpriteHitTest(childTransparentPreview_sprite, GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		set_pointlight_color = 0
		set_ambient_color = 0
		set_childtransparent_color = 1
		set_parenttransparentcolor = 0
	EndIf
	
	If GetSpriteHitTest(parentTransparentPreview_sprite, GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftReleased()
		set_pointlight_color = 0
		set_ambient_color = 0
		set_childtransparent_color = 0
		set_parenttransparent_color = 1
	EndIf
	
	//if color picker is visible and the mouse is pressed over color picker gui, pick the selected color and apply on to selected light
	If colorPicker_displayed = 1
		If GetSpriteHitTest(colorPicker_gui_sprite, GetRawmOuseX(), GetRawMouseY()) and GetRawMouseLeftPressed()
			For i = 1 to 45
				If GetSpriteHitTest(colorPicker_sprite[i,0], GetRawMouseX(), GetRawMouseY()) and GetRawMouseLeftPressed()
					If set_ambient_color = 1 //set ambient color to selected
						ambientR = colorPicker_sprite[i,1]
						ambientG = colorPicker_sprite[i,2]
						ambientB = colorPicker_sprite[i,3]
						
						SetEditBoxText(lightoptions_ambientr_editbox, Str(ambientR))
						SetEditBoxText(lightoptions_ambientg_editbox, Str(ambientG))
						SetEditBoxText(lightoptions_ambientb_editbox, Str(ambientB))
						
						SetAmbientColor(ambientR, ambientG, ambientB)
						SetSpriteColor(lightoptions_ambient_preview_sprite, ambientR, ambientG, ambientB, 255)
					EndIf
				
					If set_pointlight_color = 1 //set pointlight color to selected
						pointLightEditBoxR = colorPicker_sprite[i,1]
						pointLightEditBoxG = colorPicker_sprite[i,2]
						pointLightEditBoxB = colorPicker_sprite[i,3]
						
						SetEditBoxText(light_options_pointlightr_editbox, Str(pointLightEditBoxR))
						SetEditBoxText(light_options_pointlightg_editbox, Str(pointLightEditBoxG))
						SetEditBoxText(light_options_pointlightb_editbox, Str(pointLightEditBoxB))
						
						SetSpriteColor(light_options_pointlight_preview_sprite, pointLightEditBoxR, pointLightEditBoxG, pointLightEditBoxB, 255)
						
						//check if any light is loaded and apply the color on the light
						If pointLightCounter > 0
							For l = 1 to maxPointLight
								If pickedObjID = pointLight[l,0]
									pointLightColorR[l,l] = pointLightEditBoxR
									pointLightColorG[l,l] = pointLightEditBoxG
									pointLightColorB[l,l] = pointLightEditBoxB
									
									SetPointLightColor(pointLight[l,l], pointLightColorR[l,l], pointLightColorG[l,l], pointLightColorB[l,l])
								EndIf
							Next l
						EndIf
					EndIf
					
					If set_childtransparent_color = 1 //set transparent color of child mesh
						childTransparentR = colorPicker_sprite[i,1]
						childTransparentG = colorPicker_sprite[i,2]
						childTransparentB = colorPicker_sprite[i,3]
						
						SetEditBoxText(childTransparentR_editbox,Str(childTransparentR)) 
						SetEditBoxText(childTransparentG_editbox,Str(childTransparentG))
						SetEditBoxText(childTransparentB_editbox,Str(childTransparentB))
						
						SetSpriteColor(childTransparentPreview_sprite, childTransparentR, childTransparentG, childTransparentB, 255)
						SetImageTransparentColor(childDiffuse_texture,childTransparentR,childTransparentG,childTransparentB)

						
					EndIf
					
					If set_parenttransparent_color = 1 //set transparent color of parent mesh
						parentTransparentR = colorPicker_sprite[i,1]
						parentTransparentG = colorPicker_sprite[i,2]
						parentTransparentB = colorPicker_sprite[i,3]
						
						SetEditBoxText(parentTransparentR_editbox,Str(parentTransparentR)) 
						SetEditBoxText(parentTransparentG_editbox,Str(parentTransparentG))
						SetEditBoxText(parentTransparentB_editbox,Str(parentTransparentB))
						
						SetSpriteColor(parentTransparentPreview_sprite, parentTransparentR, parentTransparentG, parentTransparentB, 255)
						SetImageTransparentColor(parentDiffuse_texture,parentTransparentR,parentTransparentG,parentTransparentB)
					
					EndIf 
				EndIf
			Next i
		EndIf
	EndIf
EndFunction


//delete color picker
Function deleteColorPicker()
	DeleteSprite(colorPicker_gui_sprite)
	For cps = 1 to 45
		DeleteSprite(colorPicker_sprite[cps,0])
	Next cps
	
	colorPicker_displayed = 0
	set_ambient_color = 0
	set_pointlight_color = 0
	set_childtransparent_color = 0
	set_parenttransparent_color = 0
EndFunction

end_of_functions:
