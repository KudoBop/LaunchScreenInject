# LaunchScreenInject

Small shell script that lets you inject some project related information into LaunchScreen.storyboard at buildtime.

### Instruction
- in LaunchScreen.storyboard create a UILabel instance and add label property

![N|Solid](https://github.com/KudoBop/LaunchScreenInject/blob/master/Images/launchscreen.png)

- move launch_screen_inject.sh into project root

![N|Solid](https://github.com/KudoBop/LaunchScreenInject/blob/master/Images/filesystem.png)

- go to target > build phases and add new run script phase
- set value to ./launch_screen_inject.sh with the arguments like below

```sh
"BundleID: %@, ver. %@" bid vn LBL_SUBTITLE
```
...where
- first argument is a format string with placeholders, just like NSLog
- another arguments which will be replaced at build/compile time
- value of the UILabel's label property, which will have text replaced

![N|Solid](https://github.com/KudoBop/LaunchScreenInject/blob/master/Images/buildphases.png)

When you build and run the project - it should look like this

![N|Solid](https://github.com/KudoBop/LaunchScreenInject/blob/master/Images/simulator.png)
 
### Built in arguments
Here is the list of built in arguments which will be replaced at build time
- bid - Bundle identifier
- pn - Product name
- vn - Version number
- bn - Build number
- tn - Target name
