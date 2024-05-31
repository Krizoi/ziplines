# <span style="font-family: Arial; font-size: 2em;">ZIPLINES</span>

## <span style="font-family: Arial; font-size: 1.5em;">OVERVIEW</span><br>
This system is a comprehensive suite of scripts designed for developers seeking to implement a unique zipline mechanic in their Roblox games. With this system, you can effortlessly construct bezier curves, utilizing easings such as quad or cubic for smooth interpolation. Whether you're creating an adventure game or a themed park experience, the system provides the tools you need to deliver dynamic and immersive zipline rides to your players.

## <span style="font-family: Arial; font-size: 1.5em;">FEATURES</span><br>
<strong>CURVE GENERATION</strong><br>
Provides a satisfiying animation while making the bezier curve. It is also easily adjustable with customizable easing options and control points.

<strong>ZIPLINE FUNCTIONALITY</strong><br>
Enables dynamic zipline paths as players traverse customizable bezier curves.

<strong>MODULAR DESIGN</strong><br>
Offers a flexible and modular system for creating and customizing multiple zipline paths.

<strong>PLAYER INTERACTION</strong><br>
Engages players with interactive prompts, allowing them to trigger zipline rides and smoothly follow bezier paths.

<strong>SIMPLE INTERGRATION</strong><br>
Streamlines the implementation of zipline mechanics, enabling quick integration into new or existing projects.

## <span style="font-family: Arial; font-size: 1.5em;">SETUP</span><br>
<strong>1. USE A ROBLOX PROJECT</strong><br>
Start by creating a new project or using an existing one.<br> 

<strong>2. SETUP THE FOLDERS</strong><br>
Organize our scripts by creating a new folder in 'ServerScriptService'<br>
In 'Workspace', create folders named 'curves' and 'points'.<br>
Inside the 'curves' folder, add subfolders such as 'zip_1' for each zipline path.<br>
Similarly, inside the 'points' folder, create subfolders like 'quad_1' or 'cubic_1' for control points.<br>

<strong>3. SETUP THE POINTS</strong><br>
Populate the 'quad_1' or 'cubic_1' folders with parts or models named 'a', 'b', and 'c' (or 'd' for cubic curves).<br>

<strong>4. IMPLEMENT THE MODULES</strong><br>
Create modules named 'curves' and 'interpolation' and ensure they are parented correctly. 
```interpolation.Parent = curves```

<strong>5. GENERATE WITH A SERVER SCRIPT</strong><br>
Write a server script to spawn the zipline paths using the module functions.<br>
Call the generate function from the CurveModule with appropriate parameters for each zipline path.
Add a variable in refrence to the module:
```lua
local CurveModule = require(script.curves)
```
After we made the variable, add a variable in refrence to the folders:
```lua
local Curves = workspace.curves
local Points = workspace.points
```
Make a function to setup the generating bezier curves.
```lua
local Setup = function() 
end
```
Inside of the function, call this function:
```lua
CurveModule.generate(Curves.zip_1, Points.cubic_1)
```
or
```lua
CurveModule.generate(Curves.zip_2, Points.quad_1)
```
The first paremeter of this function is to identify which folder to place the parts of the bezier curves in.<br>
The second paremeter of this function is to find the easing and the components.<br>
We could also use the coroutine function to spawn it at the same time:
```lua
coroutine.wrap(function() CurveModule.generate(Curves.zip_1, Points.cubic_1) end)()
coroutine.wrap(function() CurveModule.generate(Curves.zip_2, Points.quad_1) end)()
```
Now call the function:
```lua
Setup()
```
If we run it or play it, we should get our results.<br>
Here is the script if you want to add the system to your game:
```lua
-- # Variables
local CurveModule = require(script.curves)
local Points = workspace.points
local Curves = workspace.curve

-- # Function
local Setup = function()
	coroutine.wrap(function() CurveModule.generate(Curves.zip_1, Points.cubic_1) end)()
	coroutine.wrap(function() CurveModule.generate(Curves.zip_2, Points.quad_1) end)()
	coroutine.wrap(function() CurveModule.generate(Curves.zip_3, Points.cubic_2) end)()
	coroutine.wrap(function() CurveModule.generate(Curves.zip_4, Points.quad_2) end)()
end

-- # Setup
Setup()
```
This script demonstrates how to gradually add zipline generation coroutines, ensuring smooth integration into your game. Simply copy and paste this script into your game to implement the zipline system. Enjoy the enhanced gameplay experience!
